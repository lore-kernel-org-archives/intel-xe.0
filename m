Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4889FCCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 17:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9310E166;
	Mon, 27 Oct 2025 17:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vdh2lrPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE9810E166
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761586034; x=1793122034;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sKHJ0NkVf9dKkzoUj5/LWArGtNV9kgXwBR7mYHlCqQ4=;
 b=Vdh2lrPTpsmFgh2i0SHSPBz1FwNmPa+muISFKSeOjrjOnrj1cIakLhm4
 IqKG2k9yA1B2oZMp1UuRSXaGdFNJkMnb/8xzClfvC9xf2rYN3aXPiaX7z
 QVHowHodO0EeU2yuoObhIVZ/Xec64VavIqpBpuegDN2kCLFDnwZtqzIbt
 LJCzq+sh71+7Bz2ufokiH08oQX+Dv+nz4sWTUlCzDL6XMLW8Nii6C1dJe
 trmt+05E0G1aovMAJvBSNv53iLpFOkvgCmT7tJawFJlyLIf3oxsTLHtPK
 BeC+SXd4bUkb+ehjitCKwvzMOXuBuf2OkTlmBkRcWVkhiOSiFATw5VE/r g==;
X-CSE-ConnectionGUID: 1xlSBHYgQlawILfNNRa6MQ==
X-CSE-MsgGUID: 43FjzngyRhCo6yZIn4V2bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63712719"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63712719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:27:14 -0700
X-CSE-ConnectionGUID: bHWfOiUUTF285gCwYeLGjA==
X-CSE-MsgGUID: ncUg6QnETgG1Ulo3ioMjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184999994"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:27:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:27:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:27:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrl9u9agtdBF8Hzp0weSd1aXtXsdF8EmPKzxsjIJWyUDPjL7/ccB5G5lliVbOSpIebZst0TbUMvD/k0iD4LlKL5an00FTr49BRIQSQ1Xmf2ipGmIJIAUQHqFUPgrQtZcz9mfBJnZNVpN1rp2bPXS9kOVAuGpoiHOsLT0T41nKSSjEUH9tUE6OtRvPvQGnOITWYikonfZ3SDPCQyzy+iVCpoX0+WrkF69iNGatNzVLYrGWlY1604V8SXeWFRD3ra1AsQjbMSjiU+YnyqKy39JayyZ8qMeoHC15Kp1Oud72l5YA3xBnO7G03wZXA7GTBKjS0Ch90DxPkyG/4nxQAEOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GahtBM0RxWhwlesoPRh2c8euF+JA46Zta6iaQDGqBE=;
 b=maiaf84OuR/hyl6lttU7050n+dACsAimyJC7jRtSyxhZlMpRU+gvbt8vqMUpu9X1ZPInBjQxbgqtyh7lpI8nFgIR7lDdc5bsySsnnLfwd4g0fK293FZQKsviihzE4HRvImZiw2Pn1xqkRtCpQSOY1L4+ryz9BJS8mhxKkaQQ8v7amNVp4kd2+ZqmmBaUlpaCrqhKWk6kRp4TcUtIParXjiQ1x1WzqLyho1PLfg9E8HhJAm2SICFsVFxnBJ9kFotAi9lAUNmEdrq/mOoHs76yo6h6OmdTo1uMYKpyOEwmnfd52BugkQYgz3B0psTNiDjNCHiIfa6QioeQpyUybEZZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:27:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:27:10 +0000
Date: Mon, 27 Oct 2025 12:27:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 03/14] drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
Message-ID: <ztlryvb6mschuesh5k77i2ldehaa3ed7asriokgnqkajrxzcij@j6lezpryhquk>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3fcb5d-4260-4218-b2fa-08de157e0f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJSRXdTUmxkYVRNZEZwSXE0bWQxUGdUdklUd3lEdFJuemJCNVNhUUxjdXpI?=
 =?utf-8?B?d2pzRWVCNDI4Y3JibndSNVRiR3BkZmVDbVpXSHZkZWFWOFArdW1pWDFsU3ln?=
 =?utf-8?B?aWVRcTBWeHBaUXpUcDljSkltamwvWk93TGlsT1p3NkZQcU43MlBEcW5JY052?=
 =?utf-8?B?THFWeGo2WVN3SDhEZHF5QVhwTE1EYWF1M0VtakhBZTZrbDJtVGdva0RkUjdB?=
 =?utf-8?B?enRHWENVTHRGRGhNUXdqQ2M5TDVjN0dKem40aEJhV1dKVmFQMVVIa0g3TFpo?=
 =?utf-8?B?TzJyRVg0K1VQRjE3QU5YMXVzZ2FILzVMUFB0N2dFUkZTVjVzSmdSQ2pjaXhP?=
 =?utf-8?B?OW9RZnZjKytOYU9vV25pQytxS3dWMXlqd21yOElWV2dzTEZySjNaVVFzNmt0?=
 =?utf-8?B?S1gxZkxrY2VvSjNqa2tIbXltU2JCRVdHUXdpay9NMXJyK3I0ZFZrWXk4czYz?=
 =?utf-8?B?UEVmVXJWcjVHTGExQWdQalBsMDRLY1lBZ2RrZ2lMUjhuVnpzRmtTQ1kzM3k3?=
 =?utf-8?B?QjNzRE5UN2VzMU84UVFiaFJ6RFpSNitURmpOcWVXOGtpT2JOSmhzTFY3L1or?=
 =?utf-8?B?SGpRbUp1M2E1NzJoNzZGZ3hqSkhxTTVlSHhwUjA4ZjhVNUNLeHBPbXUvczE5?=
 =?utf-8?B?TTZOVGRMTDBYcmhNWUNYZmFpUkJyTVl2VTNIZWtCZ2w3MDRyRSs4dDhkMmdY?=
 =?utf-8?B?UkZGR1M1UThSK2pQZ3pMSFZ4b1d0d3RNUFNRSkdkVE5XZEZYZHBBeSthUlI2?=
 =?utf-8?B?djNpY0JqUUloQ09oUUNzTVNzenFpOFJJdzBJcGozcnNNOTRXVVdLMFJYUDRI?=
 =?utf-8?B?WkNKc2hrKzlod1QxWkxyZVUzdjNWbXhRVG1CV21rN0J4NlZ0WitFZFhkanJ4?=
 =?utf-8?B?VFJEVHYzczAzOCtPaDZxZmFtNDl6blhRaFZiOGJ0dERkSkFFZTVkYVJSUS9M?=
 =?utf-8?B?OWZCZlA0bHlDYmIyMDhxdVdjSUV2TjAwN0tIelJKTnRwZTg3aVp0TDR2N2hC?=
 =?utf-8?B?MDZucXNXS0didEdQVFlhdkdZTGZTYjMyZFRXbWNNb1plQ3l0QkR0bzZHRC9Q?=
 =?utf-8?B?UHpmQkx4MXB6LzBuZmo2M0FjN05XNEJmU0kxazRwQU5BTE8xeVBnUm1ENkFM?=
 =?utf-8?B?bnVlVTNyc1JjZEd5UEF0aDJ3YXlVdXpBcTRQMm1RSDhsOCtGTGRTQzNMQzJz?=
 =?utf-8?B?K09EcjFndzI0QWd2SHJKZlV0QmQ3cmVSSGxUQTRXeTRuUk1FYTFWdm5NVi9k?=
 =?utf-8?B?ZU5CMHhLZTVidUJqTHROMUFjTGxVZXdodUZWV29CblZkdXBBdk55eGd5a2Vx?=
 =?utf-8?B?a0JVUzJMblVNZ0h4ajdmeWgwTU5qNzAwU0dpaTdIK0IxNjMzamhwczhaZ1VS?=
 =?utf-8?B?UkJmVktjZWt6RUlpK3RiRm9WaHBYQ0ljWmFrT1dPSHhxQXd1TEFNdFlrd2lO?=
 =?utf-8?B?eHhxSjVkOG16YllaMnY4NkdkUWZlNklZL2VLYWVOeE52VE1KK0U1eHU0dWpZ?=
 =?utf-8?B?RVVEOWk4N0ZXSlhFQWtGMkVVbDVNc09KbFNnSGVVZFI0b2JUOWt1QURDeTU5?=
 =?utf-8?B?b0RCRGgrR05Nd2JpdGk1T1M5cFMvSjVieElucnM4S1FXMTdwM0tkWHVXOW1k?=
 =?utf-8?B?VlQvck90TC9TN2UyQjJlSEZMOGVldlFZWG04SlZtaEVtNGsyakhwV1k3NDFX?=
 =?utf-8?B?aGEvMW9PeVZyOUk1V1hXSDNGUHpET3BOUzZkMnZJdDMwK0JnSDVEK2ZobXdN?=
 =?utf-8?B?bGtBMnBtVHVFNEQwNHM0TTd5OW9qMmNCUVRLR0h5WkJjTHBNNEVMVlowcDVW?=
 =?utf-8?B?dm1JZFBMUlZVOVRWeFB3S0VzVGE4a1dhU3p4TDZoNm5vMnpyang3WDRTdWhl?=
 =?utf-8?B?a0lTbHpiUDZNVFozSjR5WGViazd2RmRQTlc4bGh3c082YXVqc3lwZXVKUFk4?=
 =?utf-8?Q?nIGoJXaX5TlXTYiZrTc3kZD814RdnSte?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09LcWVuSWpJS0ROVFcxZDcvdnVYSkNLQ1pwZjZCSktPbEc0bXB4d0JBQVBx?=
 =?utf-8?B?MG1Tb05BTVJ6RVBxY3RGSHRrMFdlV0dGZ2RLc05pWTcrUTFLZE5Nald5VXB2?=
 =?utf-8?B?c2pRckU4V0tEQWMwVUNDajIwWUI5R3NRbWZvK2dKSHREM1l6SnpNQWs1ZzBn?=
 =?utf-8?B?R09ZN0NaZTZNdFM1c0ZmNkNqQ1AzU1FXNEszQjQ1NTJYZzRlUXhPUU5heWJ6?=
 =?utf-8?B?bXlDQWFtSllSUVZMY0xmSDViYlE3YVVuOG5UQ3BhUGwrcjg5VjNoc0NidEM0?=
 =?utf-8?B?cUVPL01oTGhJQU5TbDlrR1BINkk2ZHZkTzlHNWdiWFFKZGhkUjRMUW9WQnBH?=
 =?utf-8?B?LzAwa1duOHc2aW12bmJ3MDgwdkczbmRUTEFCQnk0OG1taXVrUnR0SHdOeFRJ?=
 =?utf-8?B?ZVhibDRIdUZuOWVHMXE2M0poMlh4RUdsTHd2TCt5NjJmRXdrdVR4WW0vV2RM?=
 =?utf-8?B?VTFYbmJ4a09QVkJDR2pjdnRnbDJWQWNDN3V6aDI3OEZpeU9XMm9yUXNNSENH?=
 =?utf-8?B?RXFPQjZxcVQ4MnFqbVpDekp3OWQ5YVNuK0hzbXZlcW1yc1Q0ZDBwYXlSWVQ0?=
 =?utf-8?B?Rkg0NGhZVWZiVnRSVURvK0UycXp0bVpkSGlzMHF1eTZHM081TUlkeGRzaXFL?=
 =?utf-8?B?TlFabVZIVEFDZ25MRUUraFBZMEx2RkRhdlZ0TVl3NW05M25jcFplUE5Pbmw0?=
 =?utf-8?B?SXdUbkxqUmlwaEphRU9lb3BCT0F4b2FNL294TkhGeXdRNTBwc0lWNWNqZk9R?=
 =?utf-8?B?blEyS0pBVWxLQ3dhaGltblJRYjY5clVneVBPYnRsLzRsNVVmeFh3VFZFMGNs?=
 =?utf-8?B?MS9adUxXQ1N4TEdmSnhUai9Yc2JPS2xLWW1WRFY3eGd6L09lM1lUQ3p0aWUr?=
 =?utf-8?B?VEJIeWZGZEQvOXlUUTB3UGxYdzhid2QvQTRzUVZDUllEdXlIMEZraWxTMUFh?=
 =?utf-8?B?ZklOb0RRNnlyN2JvTWNiY1lPQWxjRVh3SFo5NFFBbnhHSmlTd3FpVDhnNHBm?=
 =?utf-8?B?UlIzL3ZRVnZUYTF6TUlmLzNQdzlMWTY5SHlFNnd4N0IzNEQyUUJwaEt0aThy?=
 =?utf-8?B?dmxYa3BRdW1IY3lTVUxKdnp3T0dTSzcxb3UxV0tSS2oyUE5jS3ZvU0NUaE1D?=
 =?utf-8?B?T2RLVWJvR0x0b2EwOGFKajFKQ0llK2dUMERRblRHOVp2SFR2bGkvc0dZanBR?=
 =?utf-8?B?TTdPZmpqMGRhQnhVTXp5NzJNdXhWTGxyVEpqT0pQbWxTdFNxdVNMc3BWTTdW?=
 =?utf-8?B?QnBQTk5obGNSM0JNeE5HQ1dWQzBSQk5GS1J0ZmdnN2RSeXFJTUhyWEhHU3FH?=
 =?utf-8?B?UDFwc01UTW5POHhRNnpBMlM3NGVNR1F4dDhyUlE4c25vdGh6eXV5a3FqVjlG?=
 =?utf-8?B?WXU5cVVRc1V2V0ZzbWRZTC96S1BZTzdGM2ZTbnkxcng0d3BUd0pPWURsZit0?=
 =?utf-8?B?NTk0YXBIbysxSGNCSVl0YTF0dE1lSFBhcmtpMUZ4K3FBVmhSRE9mbzFRYWRP?=
 =?utf-8?B?aXkzQ1FWQlNPM0FoVCtDZFZqWFV4ZS9RZFFCSHp2UUpsVUZ5YUMzZ0xrZkRn?=
 =?utf-8?B?ZzVHc2Y0SU9EUUsrS2YybDZWMGVVRUhCSE5JY1pISmdabGtVSnVrZEM4YUZK?=
 =?utf-8?B?YS8yb3dlZCtKSXpIcGlHMkM4Yk8wRHpENzNHSlBQNFdVUS90MGdCMEhkZU1G?=
 =?utf-8?B?azJjTitDWWlOdlJKdGtsaDEvemdSeHUvMG9SckJvZE92b0x6OTJ5N2txZFlk?=
 =?utf-8?B?QkxOTEJXc0tMekwvY2tMWlRnSmdjcTNKd0I1K2tna2tSaHovMnpTbkNyeWUx?=
 =?utf-8?B?Z29naDVKWGFyRjZyV20rRjFmdUhjODhFbHkvZ1oweDhDLzZXeWFHMWs0Zk1o?=
 =?utf-8?B?VE9JOTFld3FyZ0ZpMi9hNk5NMW9pa3dXYmNqS0lwRTU5dFN3MGRkbFVNaXhq?=
 =?utf-8?B?VW5EM29DZllKUGMxZ04veVllN3V3dzZXci93SVJTa3JpZ2NXRU55NWV3OXpr?=
 =?utf-8?B?QTVWQnVscXdLKzZrc1FnRmo5Uk5zRk0xbG1pM0pUVGY0bW5RdXd3TUphWlVV?=
 =?utf-8?B?QmVOMGVGak5GSWxRMXRDbXdaVFh0T1JsRlhQVjkrMFpuQklCeEp3bXRoaVVw?=
 =?utf-8?B?QzdXY0taV2dBWUF6S01zZGNEQ0pqNXI0ZnBHVWdtOERoZE15M1ZnY1NKNkhn?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3fcb5d-4260-4218-b2fa-08de157e0f2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:27:10.3096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n9RgTPwKqzxnl6lVGuJVUWhVJANEnmst8o1xWvI1leCog8tAJGE+E1Vz2R9RYev7knst+ES3OrW/E51EX2EaI0aGMAHDCP7CsLxJLOcycM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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

On Mon, Oct 20, 2025 at 08:24:03PM +0200, Michal Wajdeczko wrote:
>On current platforms, in SR-IOV virtualization, the GPU is shared
>between VFs on the time-slice basis. The 'execution quantum' (EQ)
>and 'preemption timeout' (PT) are two main scheduling parameters
>that could be set individually per each VF.
>
>Add EQ/PT read-write attributes for the PF and all VFs.
>
>By exposing those two parameters over sysfs, the admin can change
>their default values (infinity) and let the GuC scheduler enforce
>that settings.
>
> /sys/bus/pci/drivers/xe/BDF/
> ├── sriov_admin/
>     ├── pf/
>     │   └── profile
>     │       ├── exec_quantum_ms	[RW] unsigned integer
>     │       └── preempt_timeout_us	[RW] unsigned integer
>     ├── vf1/
>     │   └── profile
>     │       ├── exec_quantum_ms	[RW] unsigned integer
>     │       └── preempt_timeout_us	[RW] unsigned integer
>
>Writing 0 to these files will set infinity EQ/PT for the VF on all
>tiles/GTs. This is a default value. Writing non-zero integers to
>these files will change EQ/PT to new value (in their respective
>units: msec or usec).
>
>Reading from these files will return EQ/PT as previously set on
>all tiles/GTs. In case of inconsistent values detected, due to
>errors or low-level configuration done using debugfs, -EUCLEAN
>error will be returned.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 116 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 +++++++++-
> 3 files changed, 176 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>index 663fb0c045e9..f2e14103c9aa 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>@@ -152,3 +152,119 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
> 	xe->sriov.pf.provision.mode = mode;
> 	return 0;
> }
>+
>+/**
>+ * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
>+ * @xe: the PF &xe_device
>+ * @vfid: the VF identifier
>+ * @eq: execution quantum in [ms] to set
>+ *
>+ * Change VF's execution quantum (EQ) provisioning on all tiles/GTs.
>+ *
>+ * This function can only be called on PF.
>+ *
>+ * Return: 0 on success or a negative error code on failure.
>+ */
>+int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq)
>+{
>+	struct xe_gt *gt;
>+	unsigned int id;
>+	int result = 0;
>+	int err;
>+
>+	for_each_gt(gt, xe, id) {
>+		err = xe_gt_sriov_pf_config_set_exec_quantum(gt, vfid, eq);


I find it weird that a race on multiple writes would basically give
undeterministic results for the device. We are locking/releaseing
xe_gt_sriov_pf_master_mutex on the gt, but shouldn't we syncronize
multiple writes at the device level?

>+		result = result ?: err;
>+	}
>+
>+	return result;
>+}
>+
>+/**
>+ * xe_sriov_pf_provision_query_vf_eq() - Query VF's execution quantum.
>+ * @xe: the PF &xe_device
>+ * @vfid: the VF identifier
>+ * @eq: placeholder for the returned execution quantum in [ms]
>+ *
>+ * Query VF's execution quantum (EQ) provisioning from all tiles/GTs.
>+ * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.

or if you had multiple userspace components trying to set the value
creating the race above.

Lucas De Marchi
