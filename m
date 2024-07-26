Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937EC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 16:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC2510E9D6;
	Fri, 26 Jul 2024 16:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9UNYGEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6FE10E9DE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722010623; x=1753546623;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ceSXzqiAiLXJ2ZvbPK2SWpuYZNK/CcOBVlNFQC9rnVY=;
 b=Z9UNYGEEQtd+Hs9wvELRm86lXHEXWZzp7GQTlj0e+g6YbZrjelA5fHmM
 dyzz5a+ywBfqhBtfK0ixHltrzjCu9Z+30BRPdtT5RXhb1CSk8nGb3Ssq9
 jwtDhzkSqpVGiCII4JXkWZX5vw0Kw9Y4geXeiKhHDEL3Gh6Os+3r3Pn2p
 79Y3vMcyq8r7l+4hbefeGi7KWtQDJsX4859nFMwKCHlmCuyewVKI7Z+C+
 FSAFKmlm0p++mfoIqRJSXX/aRofYQL9lvdVtMfNIEemFyxCGLZdjDfI01
 T3UNxwtJVQBVkMbKkQd8Had7gmua6eNHgh40D2c202FSvwE2rHPJiN1Fr A==;
X-CSE-ConnectionGUID: WUMTEMVhSGCxlX+jGWP/Yg==
X-CSE-MsgGUID: WCLXQzgETpSrwijHjkW4hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="12731996"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="12731996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 09:17:03 -0700
X-CSE-ConnectionGUID: h0ScaN20TkmfCiYWE3q1dw==
X-CSE-MsgGUID: rk893IEfQkapH0U2OvNZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53921627"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 09:17:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:17:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:17:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 09:17:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 09:17:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Prh3OCFwsb3Czew3qmruFAwcJway+1efn1N5uuOp9Knn2Q9nWtrCTjS5J1KncR6rPWd4NQD9GzUPJYwrkjW6FQPObpu0Lbx3XPE7jBXMzSw0q8J41qZRhwxMjHaUKzo84oZlxtUa+sSmm3Xarj7v3XZB9ST8OoPCTey5issb3wLV2qFVjHylQHtUN7yL6aLVGTZd/+LhNVw02/5mhLHFhGRRyaO997vZs6DwYkTMvtL7kBw4hT3sIywpWx83ZYbkKYK88kHo3mSfHHjpHh1mMetafMxBK2yn4ZoF3B8EqEZFBc1KXcnjW3xs+yMpks/D4+OPQPHF4KvvWi4BbSJpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlqp9yvKJKLJI/SuWJ5xj8IhOKWoUmgLXCIBQ8O8Qls=;
 b=DdoL+9WlocyMHR9AfIKPb/AQ4Sp1O3Rj2u5gPWHhqpeS1jxkgaeOFXfT/SdIPYE3bhJREa7YRBRazNgncA/c0kJk9soFa5wYYkm53XORnMhG4YR3iq/VuNxf+0K7j8J5u3rmqOxf+rQgbl7uH1expPX4UvtmH6xrV6ranEii9BvT2YmazSsJqGWK/gVq7dhSxlKEVmxHZ66Kk0my/LicqYEehE+hKSzCIWFQaCQHmYznM/GxqqJo2KuUfULtcmXCmsz9QZl2iZzunlkXDeblGRySbQZHQVMwergQCbx51JAhhnddztIRgklR7RR9LTPZcHBV4JEnTwys1OIsOnxN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 26 Jul
 2024 16:16:58 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 16:16:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-5-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-5-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe/kunit: Rename rtp test cases
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 13:16:54 -0300
Message-ID: <172201061410.1586.7248971044475027816@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 9177a9cc-cfd1-48f5-e04c-08dcad8e5fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVpWYUhMZEk3dGFndm9wMVNnd1BXbGhDczl4b3Rpc3cwdFJ6MGJHNEF2dkRM?=
 =?utf-8?B?V0IyUi9oTE1CWFVMTjBKV0dVdmF2MDRBMkZHU2c2Nk5rY3Nvbm5ETERubHZ1?=
 =?utf-8?B?Zi9MRENteEJncE9DYXVPKytOZzhUWWVCVUptS0dxMEFFeGVDZTFPSGd1V0dv?=
 =?utf-8?B?dGtUY1RtckRKei94U0s4Sm41Q1NScW1DeENTa3dPYTZJZDBvNXQwUWEvQVYx?=
 =?utf-8?B?QjZxWVREeWJiV3lYTTloeW5VdTd6TU9RUXRsbDh4M244RWhiUkt0NE1wQmUr?=
 =?utf-8?B?MVBIMEJMSW9PTmw3bzFyOXdTZHEySTNjNkMzS2JsOUVEOThOTnJZVE5kMVlL?=
 =?utf-8?B?MGF3c2RGczNYQkJ1ckdxemxoR0NyTXlKdmE3eHlpZU5OVEcrRCtOLzZaUkhX?=
 =?utf-8?B?ZXZMRXZxRTJWTEYxY2NpTHZvUXYrcDR5QmRtMEN1USsvUDZMQU1uVlR6QVFG?=
 =?utf-8?B?b0xaVUFUbWZ1QkZsVGFkYy9HamtWSFZZRUhhNVpQcWcvQ1djMlVVVlpPMVB3?=
 =?utf-8?B?Rk1wZVM4cHFHZlk2S3ZPZ1R4VkJOM3Jyb0d1enpocDBLdS8yN0JKQk1KWndm?=
 =?utf-8?B?VWE2WnFpcWsyOWsvREUwRXFLMFgyT0tSS085RDg4RFN6eHh3b1NQU2RUd05E?=
 =?utf-8?B?akFmb0FRWG1MRmsrWG5XcStGMExKdGtwNjRvL1IwOXg1dTVjWEh1dzdRZDAw?=
 =?utf-8?B?eUlRdVhTUHkvRWdZS2xjdVQ2dDhyak5ub3dKeHVhMkwyUDU5Ylo1b2o3Qk5k?=
 =?utf-8?B?U2J4MnBNK1NJVmlabWlGNkNoSTFPbjV1TmJZSUhpcERzODJPRVZIQnRlZjRI?=
 =?utf-8?B?QThib3IreWNubjc1b0c1czl3UW1aZW5TcUMzK0hrTk5FRlM1dDJyR2Q1VXQ3?=
 =?utf-8?B?cnBmTjZNMWNkM1piTG9iZlpFTXRKSlpsVjB1WWtYUnd3bXl0MEc0b1hMdlNs?=
 =?utf-8?B?U082QjJjc3FBOS9uRkhxMGxoTUhkQ0VVRE8yU2xhR0tVQkx6eGVzVzBhcTVH?=
 =?utf-8?B?TTh1S3I1YlVKdk5qZDNBVmMrYmQwM3hpTThRbFAwL3U0WXNySmhkTFRySkpn?=
 =?utf-8?B?blIvcVo2TmV1NWFtenM4QVpJQ0FBdTVBV05tM2VjcFpndjhTV1hpR2cxY2Ji?=
 =?utf-8?B?TE5CZ0pnZUpOZkJYSnYzUUpUcnBzWDFWOWpoZjBjdzhtWVBiNHpSR1ZGaVhU?=
 =?utf-8?B?cjZrTkJqQ0laODE5cW9MRVZjRm02alIwQjFiWm1DWWNFYlJ4ZGs1azQwQWNr?=
 =?utf-8?B?WmNuSkJHYWNvM2s5WDQ1dHJURFVMdU00ck9tM2xMTVMyWWZQd3FKU2VMbnpt?=
 =?utf-8?B?V1lzL0Z6cGQ0YkdMakR0Y3BvdndndHUxMFliRUNpRjJhMnIyWnRXMkF4TzVi?=
 =?utf-8?B?ZHdUbmljd1VNL0Zzd0VMUE9JUUJiNmNiaytnc2U5MFZxNXdBMkgrUGZZOGUx?=
 =?utf-8?B?ZkNZZ3RkWXBWOFU2QXhnamFnclpxK0ZLem9oQ2dwd3htd1NKMkZTNTRqV3Zi?=
 =?utf-8?B?cDAvMkxzbEN4N0UvV1ZXSlVFUDBjSzh1RUdScDE2M3FRTVhjcURJMUVmMHdR?=
 =?utf-8?B?ajFXM0VCOWJXTmpadnBEc2R4LytJSzBFd0h3d0Q1c1BGTTBFVlJPU3p2REN6?=
 =?utf-8?B?V09PQXd2dVpwbmFiT0pqV3F2Uis4VXBOZHhPUnZNWVNWdGc3NVB2VU82dXdl?=
 =?utf-8?B?YXYyY3dhbFgzM1hNZE02N0c2WlA0M1lXTnJHQnVNam1JclQ1L1dwSUlkNzc3?=
 =?utf-8?B?VHdYUWhhMmlZN0dOZGRmMzkwbE9OcVp2Z0lnUWpuTEkrVGQwbmFhMlQyS1Z5?=
 =?utf-8?B?K0tPeUNPaktKVkhFSE8xUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmp4RVVzSmlIdERHWEp5NTZ0UmxreTZYNTNWVUg4L0RZdGR1SnRmd0ZjMHlT?=
 =?utf-8?B?d2RVYTNIMFU5OEd2U0I0SjBiS3AvUUFhRURkOG45STVLcWU2ckoxSEg5TzlM?=
 =?utf-8?B?QXFxR1hPRXhOS3Y3U00wVkd3T29vTUJMaTIwcEtwczFjOVMxMFg3MFk5d1R2?=
 =?utf-8?B?UWYwRU83b2o3eUZENFFWQ08xa0ovUHlOdlBpenh6OFp4VzlXV01zMlBRNW9s?=
 =?utf-8?B?WUNvMW5XUFpmb3JKaE1rNjM0c3hhU3MxREY0NkRZUEEyUzZ1WnRNN3RTVTRz?=
 =?utf-8?B?Q2JvT2xrd1RBQ3VLdDc4OVd6MjQvb2c2OVl5dGpMWEtxMjlmSThlQjA5MG10?=
 =?utf-8?B?alJQV3ZHNCtMMVowUW1laTVLcXcvSEtOQ2QwdlZDT2R0ZHhEeVE5UHV1Wi9a?=
 =?utf-8?B?N3pEZ3JDZjFFRHk2dEd2MjdTUEY3U2hKdmtoUnpqbkZRS3EyMDE0SGtVQXF1?=
 =?utf-8?B?aDJXUHU5ckU3NU9adkpEQWNDMWJuajhJNGMzSTVoMWlwUG82b1BIRXJxTVRz?=
 =?utf-8?B?Y0JqSXlPai9qOU9hRDdIS1lVc2RCK2tJZWRSWXFDbFF6TGNmK1RuaXN0YWNM?=
 =?utf-8?B?KzBpTmd4OFAzZ0FWdzAzc2hQWFhBMjJxdFVHN1p3S0ZFUlZ0TXBYR2JxaXBG?=
 =?utf-8?B?dVhRdHpOaFZveVN6cWtpd05SZ2hwZ3FLWFlKMFN5cm82Z1Q5aDE2NTlSZ1VY?=
 =?utf-8?B?RTl3a3lDTjk1M1hSU1VmdVY0Z0prTDg5NTkrQWJFY1B6eTBqenAwQnpQMVQ4?=
 =?utf-8?B?TkhqVDEwS3dOUGMzU1JqZ2FaT2RjbGNVU2tPWDhmQzBhSENLdm4rZHRrL2Ja?=
 =?utf-8?B?V2lZOWFORm9vQWh2MmgvZjV6WG91NFdYZlEzajVQeWt6elpmMUJ5d0tRbVVG?=
 =?utf-8?B?K21PNWZNc010VHJONWdQU1NTRG5EZTYySFlPbEtSZ0hiTTAvV2E5d01pTlVS?=
 =?utf-8?B?MlY0cW5zKzFlV1RKM09VMG5WUkx6ZlRZNGtadWxDRld1czM0OGNLRU03MXNQ?=
 =?utf-8?B?Zjl1M2thUTlGSkdlM3pCUXdIRDNPTC9oOHN2d2xGN3AzSmhlcTgyeTFzdTlj?=
 =?utf-8?B?c24zZHZZVVZGS3YvRXJ0bWRpZitOVElqSXlnRG1Ddjl6aG5rYnQyWUlJN3Jh?=
 =?utf-8?B?NSs1b0hZZFNPVUdrQXdGUXdkOXgrUGtrQm54ckczbWtzc2lVRlZFNFdHdlRG?=
 =?utf-8?B?bUl0SHU4VUUwek9ZbENkM1N2WGV4RENxYmdWOHFzNVJiNnFDcFFCeDc3dHBy?=
 =?utf-8?B?OWxBbVJDeHh5WWJ5U1NiZmxFVWViNXU0c3ZaSS9pbk85UERSMXp0UG5oSWVJ?=
 =?utf-8?B?SlJDYzBFMFI1RVl6Ym0vRmowZk93d2hldXpBcnlqMTJDeWFvOHZHdzljMUFp?=
 =?utf-8?B?aDF4VFdmelpwRW16SFlXanJYanZpY3krTnFDRW9CUnJLT0lMS2t5NVpuazdx?=
 =?utf-8?B?NUJRbEJZZFQvRk92bUFiQzhWeWI5Q1JPT2lFbXZwdmUrSTYwcVlxRDdQYm85?=
 =?utf-8?B?UE5mbkgxSjgzRmhTVVF1Y1J1aXh0STBzVmJ3bzVqdVptcHZ2UnN4Zkdjank3?=
 =?utf-8?B?TkJKQkVDQWpPcHBTYk93bGV0enp4TEVVcFJWZ3M3MjZQMzdPNy9ySTgxUlF2?=
 =?utf-8?B?a3FrRW1ZN09BNFJrdTBEV2NMR2wvbGplM3VWVzZBT1dJMFpweWQ4YkNuUmJX?=
 =?utf-8?B?Y3RsVFdrOGVrVmM2d3ZtMXViTnNCckNBZHB2cGRaZ0l0d01tRERwMWdIS1BQ?=
 =?utf-8?B?VEcyalR1SG9Eek9USGhUbDF0WDM4K3RYN2IrMFROcWJMck5yQnp4Ym5QbHJZ?=
 =?utf-8?B?MDkwRURFOHd4MUx2anNmTTZMak5hTmc5dXI0S3RvU0lBZVkvd0ErOVdiZHZj?=
 =?utf-8?B?UmNVOEM1UnNRdCtnYTVxUlJyWnlYeFJKNXdCWVZtM2JYeHorUVdOYmptQXJQ?=
 =?utf-8?B?dk1rZVpaUWFmamQ2Sk1taDBJQ2JhSGRYeDhNRFVJMFVMRnM3MDk2Nmw2OWlr?=
 =?utf-8?B?Q2RzaHl4emdXeU9CZzY2STJ4YVg0YXgzUUNneFRmSXpkbmNrdmNNU0cyRndB?=
 =?utf-8?B?Y09aRS94eEg0R2JGTXlVTUpJZER1VllMRFhPNXBuTmwzWGp4Tm9FTGg5NmIy?=
 =?utf-8?B?MzdRN0NYNzgxaGMzd0JhRUpGOUN5UVRDVGJjRVN4dzFDcTVXTWZTL1FjK1cz?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9177a9cc-cfd1-48f5-e04c-08dcad8e5fd5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:16:58.7578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utkog0q2bW+p4ThtKKeuumpea9bq7gMpkNE35lSpI0mbJjeWdyWvJrg1Pozm/OkdYQaThsd5tqwOIgGI+ZAjvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2024-07-26 03:43:34-03:00)
>Those tests check the behavior of xe_rtp_process_to_sr(), so name them
>accordingly to allow adding tests for xe_rtp_process() later.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_rtp_test.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/t=
ests/xe_rtp_test.c
>index dbf982b1ada8..73e97f8d2b5b 100644
>--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>@@ -31,7 +31,7 @@
> #undef XE_REG_MCR
> #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
>=20
>-struct rtp_test_case {
>+struct rtp_to_sr_test_case {
>         const char *name;
>         struct xe_reg expected_reg;
>         u32 expected_set_bits;
>@@ -52,7 +52,7 @@ static bool match_no(const struct xe_gt *gt, const struc=
t xe_hw_engine *hwe)
>         return false;
> }
>=20
>-static const struct rtp_test_case cases[] =3D {
>+static const struct rtp_to_sr_test_case rtp_to_sr_cases[] =3D {
>         {
>                 .name =3D "coalesce-same-reg",
>                 .expected_reg =3D REGULAR_REG1,
>@@ -298,9 +298,9 @@ static const struct rtp_test_case cases[] =3D {
>         },
> };
>=20
>-static void xe_rtp_process_tests(struct kunit *test)
>+static void xe_rtp_process_to_sr_tests(struct kunit *test)
> {
>-        const struct rtp_test_case *param =3D test->param_value;
>+        const struct rtp_to_sr_test_case *param =3D test->param_value;
>         struct xe_device *xe =3D test->priv;
>         struct xe_gt *gt =3D xe_device_get_root_tile(xe)->primary_gt;
>         struct xe_reg_sr *reg_sr =3D &gt->reg_sr;
>@@ -309,7 +309,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>         unsigned long idx, count_sr_entries =3D 0, count_rtp_entries =3D =
0, active =3D 0;
>         const struct xe_rtp_entry_sr *rtp_entry;
>=20
>-        xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
>+        xe_reg_sr_init(reg_sr, "xe_rtp_to_sr_tests", xe);
>=20
>         for (rtp_entry =3D param->entries; rtp_entry && rtp_entry->rules;
>              rtp_entry++, count_rtp_entries++)
>@@ -339,12 +339,12 @@ static void xe_rtp_process_tests(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
> }
>=20
>-static void rtp_desc(const struct rtp_test_case *t, char *desc)
>+static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *des=
c)
> {
>         strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> }
>=20
>-KUNIT_ARRAY_PARAM(rtp, cases, rtp_desc);
>+KUNIT_ARRAY_PARAM(rtp_to_sr, rtp_to_sr_cases, rtp_to_sr_desc);
>=20
> static int xe_rtp_test_init(struct kunit *test)
> {
>@@ -377,7 +377,7 @@ static void xe_rtp_test_exit(struct kunit *test)
> }
>=20
> static struct kunit_case xe_rtp_tests[] =3D {
>-        KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
>+        KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params=
),
>         {}
> };
>=20
>--=20
>2.43.0
>
