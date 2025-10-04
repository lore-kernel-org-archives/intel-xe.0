Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCF5CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 16:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07310E00D;
	Sat,  4 Oct 2025 16:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoKyF9/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3F10E00D
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759596143; x=1791132143;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8td7oiARczfj+u8/l9tV1mdnpKFxXDsK1DY7smQfIJw=;
 b=hoKyF9/+u0tSt6HfrCGfgTY3PjI9XH/x5hJmy7ojokyl6y/J4GCvgp7u
 o/hi8ZdiSF/cowKtrcw9jpshny5pLW6Jr65D7mGneLjIlf7EF2ZPJRHb5
 BLsnpn+I7aGFNZneh0e636XQeVXAv4mlKxKf3sP5RFBt7TKSuf1gJW0wT
 TdcQaXpy5+mxA1eLN1ptq+6z3mOX4aaPzfDI6QhKdWVwUIoKWun7Hg6BA
 xTqZV4WPGzPE0tFoPh1Vd/LxN4zUkHWJfuKcjvqBwLZIa8qTsyhtRIHSP
 FrG/u25iiueNp63Z5n9xNuGZzqfd4CkbAdf8oMgYANVQPBGbp6CHPfIrx g==;
X-CSE-ConnectionGUID: othTsX6ZR1CLn5eh7Hqi3g==
X-CSE-MsgGUID: BwABqn1HSbWVVyY6lUjIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="73198944"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="73198944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 09:42:22 -0700
X-CSE-ConnectionGUID: XuwKyt4JSp+853r4uIVyhQ==
X-CSE-MsgGUID: NwrgveH4RDWYGneyjSX/wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="179133954"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 09:42:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 09:42:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 09:42:21 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 09:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqN5dCbJMx/bw6pvOR/os5P3Q39JnQjsvAG+0zgD5jezl0itTIJmSZp7f1jsZtGQrX3USZDk9P7jvULbiGqFXsyUkunwKTNE+dqek0Fj0ZiqgeS1O1ZB1tZZJ1d/lLnlR6wFUnLBY4x3yZ1pNGFU6iUH7NFeMFE4AAeyGuG0FzUODkdI0OL5JP1+GSTwnqFPf7RnpMi5F/9+UJiQvsOFbbbk5uow01gtyI8EGS0NVGnizJvnNk1a29ysEZr9eDg4KJ3ZEtv1AMYpQDXCDGpx6++YOxUNpMr3yW/Md36WoR8GFjGQPAYUxVJZDBpA55Ejq9kgzXtE4mcItcuDqbs7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/LBd2GxewyHPegJLzRD7vySWtGf9aIqizw86ffiwUU=;
 b=m45jlFUHZT4IBX9KeLKKns60Euvue/G2ybO5R1pX8IHId+UF91H46zB5kZNhfcOxMcg8M7a2s+6ks7iWuEf1gDCeubVMfslQTDJO799EaO5OgA4ePG9q16R8LGQ2MOJhQL7HuPtDiFdIN2SRK1yZqwRzAFlQJQ5UVgUM4+T3933EQF9ITlXh5DFpzpPoFo7Zv5knfS6ggU1RIMmhkHlF8dAA4BWoDwukvuuxnxQ5qWSTb7rgkQy5p9pRJm6XpsOTUyqGW8jQO+z7ZahDMzeNVvU3ouePPJjKP44UblAwV7NQ8mPdjIh1np7OuMIlCHu4mlDFC2nsIhqgce+NB1kn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sat, 4 Oct
 2025 16:42:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Sat, 4 Oct 2025
 16:42:18 +0000
Message-ID: <df58cadf-80d2-4c6b-92d9-beeb8630fc5a@intel.com>
Date: Sat, 4 Oct 2025 18:42:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Update GuC log buffer type value
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002150302.99524-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c7303e-3c1a-4f9c-62d3-08de0364fb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a041UUJPd0lFSlI2VXRjWURaanBkOWZreDVYa2dPRDhhSUIrdXBKZkJQYUU0?=
 =?utf-8?B?MStSdUlXQUJ0NUNKK1NHc29lenMrakVxcXhuY3NZWkZ4YzdmQUJkLzZvVzNs?=
 =?utf-8?B?ekxCb3BmMHllMkpBTHMrMHNJcmFUdUVLY1k4Mzd5SWkzM0gramRuS3g5WTAw?=
 =?utf-8?B?bXVuRi96b2dmbWlXNEJlbE9JaUF6ZkJGaC9MaUkrYUVpTkN6V1o5QWdBN3VC?=
 =?utf-8?B?K3hIL21aZi9mZWFseVB0Ykc0Y3VxcmhKQktHc2d0M0RYSXRPN200dlZob0JU?=
 =?utf-8?B?TURuU3hhSE8vZGw1ZTc3YzNFMTFrTU5NUDZEL3lGR0FtT0wyalRZZm1jMS9v?=
 =?utf-8?B?dWJEUWFPYnZWWkI1Y2pNOU1kSURFWXRBRTJySjVnVk5keTNrUFVtMFd1c3Vs?=
 =?utf-8?B?SDc5Yk5TWWQ2Q3hlSm5hZW9mZHB0RHh2NENrUFNsOEpndE12NUVJSVpNcHUy?=
 =?utf-8?B?aXRDeG5nS2V3d004UTVpOXdDVlBvWG9HbjJZR1AzV0dEUjlWTjNiNy9CWGhQ?=
 =?utf-8?B?YUg5VmVhWWtma0lCT3NiUGRIeE1NVS9yc1pvZk9PU2h3d1lEYjBFaUI1bnF0?=
 =?utf-8?B?d1EraVpJQ2tTUTcxYUhZa2RTZmFzeWlaQmdNYVRJeXluRHQxNGxTM1pZRG5Z?=
 =?utf-8?B?RXI0QXdZQTRudnc0OEFVMTUwYjhmYVlMUjA0SjdNS3NxQ1NPcy94Z3B3N0hD?=
 =?utf-8?B?bnBoemV0YU9JM29XeEtmd3pkTzU1TUdmeWhtRS9qNUppVG5WNE4vRUoxOUZL?=
 =?utf-8?B?U2pza1dlTEpqS2hOblNhRG0xNkVPaXc5VWYxM2hCVTc2eWRkVEdEWFFMdGZD?=
 =?utf-8?B?bEwwTndnK21aNU45MDJjcFRxRmJwUkY1TjJlQUZnc2NOSzU2ZHV5QWVEb0Ur?=
 =?utf-8?B?QkpxWUpRdmc4R1VNVnE1OXo5ejZ1QnBsalZ3T0NsN3U5L0FLdGEwV2xDSTNN?=
 =?utf-8?B?TEo2d28xc2luQWpiT0ZkL1FMRDh1ODh3eWVVTkRsbitnMkdVTTZ2NDZyUEZT?=
 =?utf-8?B?UWRlQW1sTGlaUmI1bGxGT1ZoM1RoV3JQNzBTdHJNSWVWK2NqTHA0Vm5abWlX?=
 =?utf-8?B?TWZhZkI1ZUZEWXlpdjFxd3krVDNWcHZHUzdPZDcvRFlzdnlkQ2Exd0pTd3lq?=
 =?utf-8?B?T2htZVUwR213UzhIeW1rVDJNMlFUOEc3dXhSVlZKNlRsWU1aTE5XbXdUV051?=
 =?utf-8?B?bVlGWG96d3h2UWhoTXZBZVJyT2dyYUwvajcxWmFXVG5sY0J5bDA4UVNYUkNh?=
 =?utf-8?B?NDlsUktJSXEzL3ZqRGxvNUVHOUNIWi93VVN5YmtDaFFNdHJoeXBxTjFvWFJV?=
 =?utf-8?B?TjJrUDdOUUhjKzh3Z216c0phb1FhODkyeWVrblFocHVpMDA5WVF6eTlLbkJr?=
 =?utf-8?B?VlR4bVpmTFhRblJuL3hlNFgyRUdmMXhIcEJTNVZldmNkVitFMyt2Sk9EMGhm?=
 =?utf-8?B?d010NFBVc2YwWTVIMG5PbG5QNG05bkt0bjVyaFBrNTBnUE5iaGJpQ3FqeUFh?=
 =?utf-8?B?Nzdod28ycGpGS1F5T3lxRjJWenEyaC9zd0dLYkJXZDY0V25PUEJrdmhmTWtV?=
 =?utf-8?B?QTBFMVNyTVF0Wm5Oc0NFcHd4aGtrR1BXdEVZc3FMRjVPNXRuVVRzb2wyTnVE?=
 =?utf-8?B?YXVoaHZoZVBIbjk3WEJvMC9hUnlUMFJKQXVZWjJRMTF6Y0hZbkRqVTMxVTdw?=
 =?utf-8?B?RlFHekxKOVVSbGNHWFd4aU95akVaa2ZnWWFtckhkc3JlL21Yay9zWUJWMm85?=
 =?utf-8?B?NjR2bDh5b3Zrb2RaUzVsUkxTNUd2SlhYRm5KNHR6MjBrQm9McE1RZ3dCS3F5?=
 =?utf-8?B?UUJpM0twNmlkaHJBSWFEVWQrTU9LNGpEc1J5YXpGK1ZDQzNFNkZJOVRZeDl4?=
 =?utf-8?B?aGE2cWZPSHFnbjNBMG81TXBxdzNBY1FhV3pMZ04yckpHcnJjajVOOFFzNFJF?=
 =?utf-8?Q?euIl1HwrgMlzXDHqSUxy1BQdVmqfADoT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBDdkZvamlqZWlpdGNhR3oxMmx5Tk1OcmFYS2tQYmdxVG9aTndIWEIxU0hX?=
 =?utf-8?B?dW5STGpLTkNERHhkOUtKQ1hTZG9xQkJGTThYdyt5NU9rODRyWjZlSFFQRGJy?=
 =?utf-8?B?a0tuQ3ZrUTEyMEpTVXpuTjR0V1M1NStWU0paSUxiZFhZTXhKdGR3a2FtUDJq?=
 =?utf-8?B?M3BINEpDc2dyQVBkb1RWTUFhTElVN3loRExpTHlYVmJkTEt0cXl5b3ZlbVlV?=
 =?utf-8?B?d2xvTXZuZWw1bW01NE1FdWlTd3l0UkkzQml1NlJOTFF4QzBXSEZQSEEwd0tn?=
 =?utf-8?B?djJSdFYxeUNRR0JsTE5wYnJORGFIVnFHK3FMQytWdzk3VTBUUlNPemNaSmJm?=
 =?utf-8?B?TmozaGZXWkZCN0JENHFYRnAyNnZnTWtjZzU1QlN5NTVNTXlGMVdRcTJUWS9U?=
 =?utf-8?B?QUkrRWNhRGNpMWw4VlJrNlRVU0k4eHZvRzhJZDMvM0pFZGhhY0IwaWt6UXln?=
 =?utf-8?B?SE81Z2lGVzBUVjlvNXhwc1NWd0tLcVNkRk9tMFNVS25LeGl5WEh3T2plMzVG?=
 =?utf-8?B?dGg1TTVYR1M5U3pJNDhaN0xLendpS3B2U2g1WnlOZVJaS3kxOTJkZTJkeHNU?=
 =?utf-8?B?K2o1YTlMZTA4TEJCdU0rSWg4ODluTFFJTjc0YllWUGlIUmxXelFwbHhOOXdJ?=
 =?utf-8?B?aEk3YlY3NXBJOWRnTFJCUit2T2tDMHNVV1hPSjlCRWluWXRDaXZGZExsdkd0?=
 =?utf-8?B?V1Y0YWEvSnpDTk5LTFhOYUlyd0xLM2R5TG55YXM2MGpVcy8xZ2RnNmprcWtz?=
 =?utf-8?B?dmRuMmJZbVNlR2xhejVJM01MZDJRRno0bFk2NzcvU2hnNC9sVnVtcEFiR1M5?=
 =?utf-8?B?dzN2OERKMEhrOXUvZi9RWWNyMWJEbHhaTXA2V1FGVUJFaWhiUDVhY3BDdXgr?=
 =?utf-8?B?aTl3eXBQamFKTEFFMGlJVGh6WmpBYUhmZDRwLzczYWRFRlhVTkRaYWpGdURx?=
 =?utf-8?B?Si9oYi9pV25ncjZzei9JeUpNSklWdXYrRmR2UEdxWkd0WEhEczlVVjMzUXkw?=
 =?utf-8?B?b2J2TkhmUXJHY1ZyZGFubG1YR0NDZjVDeHFwd0N3N0dtOEp3Ui9NbmI1WE50?=
 =?utf-8?B?UkRKbFR3elhMTFVGOWdPZHpGdDhVMWFGMFNmRnNRRlM2eDlYc0dmUEFFeDcy?=
 =?utf-8?B?ZFJiTlAvUGEybXFaQU4vVXFwQkk0SFhSUTY1YTIyWVdGOGhMakgxbTlQSVMy?=
 =?utf-8?B?eHAzZWVLelhQUGxZbDRjNVV4K2N0VWk3YWJJOXc5S0JNT1dhQzBSb2VRbGoz?=
 =?utf-8?B?UTVjeFFtVG9BNHVYaG5SU1FhaGxPSXF0cGRVanZ0ajF1RFRyS29pczB3bkdm?=
 =?utf-8?B?UENuYURTbC9xZHhzcDZxcGhCSVQvblVLWXdUWFNvdjZIbnlPcHQ4RzZIZFRW?=
 =?utf-8?B?NHJVT29sVk16RVVPZm16ZHFibTZXek5XKy94N0JqMEplWkYzMzNzZ3dETC9q?=
 =?utf-8?B?OEFSK2E4ZDN3YWIzNk9TOWVvUWxPaUdpeHFwY2tJbnA5YWNXa05sTzdKYnFS?=
 =?utf-8?B?NzNFY2JIbUs2RHI2TjRyQlI3VnZFY0dtSVZSVkgxYWc2QUdmblRBMkRQbjNo?=
 =?utf-8?B?dDZyRFQ3alkwV1FXQVc1a1gvdjdPNk9qYlVjSHQyeU1TUFFMOFkwN0JncFlD?=
 =?utf-8?B?UEtzRzVwSkFCVk5xUzBGU0prQnNhMnZWNk9JbXFVRFQxd2NENWlXVFl6d2pv?=
 =?utf-8?B?eVhxZndEQ29QeFFXclhuTXByWE9pY0s4TjVaWW9DVDg2SFk3cDFzY013bjhE?=
 =?utf-8?B?TVp4aWhJbGEycnl6LzBaOGFUcXRnRTRYMzlGZ2lydWJVZENqVnMzMmR5aGZJ?=
 =?utf-8?B?K2RGUWVQYmU2RFZHdVNBQTZQUGRTNUJteXptekJwVWNtZTZabUdnT1h2dGJN?=
 =?utf-8?B?Tm9iWjRzTnRBa1JGanphd0Q5THhZeWo5N0E1WjZXdElBbjFSVG5ITlVPK2tq?=
 =?utf-8?B?Si9DUUxmK2F5Zi9GaDJyajRsaWRnUkhRY0hHbklML3JoZk01czFGWUhLN2VO?=
 =?utf-8?B?bCsxRUpFQXc2WkduNEpraHBac3NMQ3cwcEFvbFd1Qlo0Tk9nN1B2SFM2RldH?=
 =?utf-8?B?OW5HbElYUHl1dVNiaG0veGV4aTZnc1oxVTRiYXl2T1dsMkhHbEF5RGc5Y3pO?=
 =?utf-8?B?aXJpa2R6andnZHBFNmIzbkswNVFlTDZqbjJSL2dVaGRYK0hySS8vQW9MSmgv?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c7303e-3c1a-4f9c-62d3-08de0364fb8b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 16:42:18.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q/mFTCmrahVjHb2Qw6udro5bzzvi0LIOvcrER/4aOBDZpOnGx7Ypib3JglPHZ6yqo/OihQFYezTFyPD5qFmpzl1zSLe8HP8mk4OAlpimis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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



On 10/2/2025 5:03 PM, Zhanjun Dong wrote:
> Update GuC log buffer type value, to align with the GuC specification.
> Rename GUC_LOG_BUFFER_DEBUG to GUC_LOG_BUFFER_EVENT_LOG.

hmm, my copy of GuC specification has:

	GENERAL = 0	/* Log event data */
	CRASH = 1	/* Raw crash data */ 
	ERROR_STATE_CAPTURE = 2	/* Error State Capture data */

so if the goal is to align (more) with the spec, maybe it should be (to keep them reasonable short):

	GENERAL_LOG
	CRASH_DUMP
	ERROR_CAPTURE

+ @Daniele

and btw, IMO this patch should be before the other one that cleanups macros

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..1a487164b980 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -10,8 +10,8 @@
>  
>  /* GuC logging buffer types */
>  enum guc_log_buffer_type {
> +	GUC_LOG_BUFFER_EVENT_LOG,
>  	GUC_LOG_BUFFER_CRASH_DUMP,
> -	GUC_LOG_BUFFER_DEBUG,
>  	GUC_LOG_BUFFER_CAPTURE,
>  };

>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index fa1d490dca0d..900b39fc734f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -293,7 +293,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
>  	case GUC_LOG_BUFFER_CRASH_DUMP:
>  		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>  		fallthrough;
> -	case GUC_LOG_BUFFER_DEBUG:
> +	case GUC_LOG_BUFFER_EVENT_LOG:
>  		break;
>  	}
>  

