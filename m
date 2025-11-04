Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825F5CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACE610E661;
	Tue,  4 Nov 2025 18:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNyTQFRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36BF10E661
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762280201; x=1793816201;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jPhm7XIIjSJMah+kJjboe3In+5pKCCxIoepAiksTo5M=;
 b=TNyTQFRlsZknpGlpencPzykugya+MSRt2kCLeJ3GYBkDgpOjrmUOCuB0
 QII22y3PJ/MoM7sUyltA6lPmAU8lp3L7FO7J0dRcHRMQwMbfH64JBYExx
 3/7445+Ou8MzK85Wzp4YjBienHucEDab41rJIAMSAh8VXyqVbboiMMSss
 XIWFtPp5hLj5Vluib3WjY3/q+Xo5rwzRiEafUomRegOjBoeYERNC+o7CC
 oQZ5fHRmUvb+4ciQJmnfiAT8lar8HxrIk3pMhjIybdHT+GBtKkAYcpkJQ
 g5QMj0kOpXa6o9KIccWcJcrgBONu9Q+GccfyYld/h+C7y2bs8AXGPpGqc g==;
X-CSE-ConnectionGUID: EiM3FgcAQWW4oNJ66qEh5A==
X-CSE-MsgGUID: K7B2kInTRb62Pxic4dSz0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68039975"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68039975"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:16:40 -0800
X-CSE-ConnectionGUID: B7OovgMTQWya+Sz+4PAIpg==
X-CSE-MsgGUID: WVlLz1fWQZCJpIYeDNGOQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191582498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:16:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 10:16:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 10:16:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 10:16:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0dF4JtqeR3m+zbrFLIc7lcJGW7DpktptA5LNOOZgkT5LZ+gLE+DJJIhYYMF8uxzKSzA8wWnUkVF3eRx91gKt3LJj6W6H3R0YB8IxLsLtfYKY/K5lcn+myGvv1ikjidFHspjKIWG7v6UIBU4MlCl6tdwq0xXW2vd419DytlISyVASuIWiXNUN5oyhN7PqP5u6w9rkerFdWiERMJxt3fiFxBxKuz/YHtxI8vdTm3DP/0oyYm1V3y6QW3ykTF9P7/3kAL44mrP+X8VmIOiwqHAqchcw9Dpsxc1k4JGOoBaZ/zyEXt77bVNyJRYskxCuu7xLcTqrOB8kvtdjZ9L5jW+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeRL5rbBZweU7jjQSdiixv8Sc4667izH2vNSF31nJOI=;
 b=nqBbQrOLAI/UZcZuomUGzsgVyn8lFFtY6pME1agfy2U9lea3+dp9lIudDOPu1sTGCFeePzBe+MBSOanvdkGq5xzH23c4Z53/QRTDcNt5TaQ2du4xv7+K9fZ6YzhMMAXmO2NaNJ5U0kVbKLzbp9c8ucZrEsgRCbQrX8A7EIwf5HQncnUipyGRBl4yEVvNFngwN6n+Nqr0hW3xjHbgbRkOJRQL2k5TUeoA4u6xJmb8dqLcqeRzZA1cQmrkopjmjbh29xRJNiMeVbbxjWFPBl/1Cvxf1psUnAKKtEpO1KKFvcRwq5QhTveqtD08TIfvvS9ov+4nQh/S29hAp5UNGDmwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 18:16:37 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 18:16:37 +0000
Date: Tue, 4 Nov 2025 13:16:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/xe_survivability: Add support for survivability
 mode v2
Message-ID: <aQpDAc_EclcByX3A@intel.com>
References: <20251014053257.3417575-2-riana.tauro@intel.com>
 <aPFE4hIJKUKh1pjz@intel.com>
 <b02685b2-5e50-495d-8ddb-00acffd8f8c5@intel.com>
 <149be14a-1da1-4f43-9b0d-7c38feb0b01a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149be14a-1da1-4f43-9b0d-7c38feb0b01a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 6164b6bb-90c3-457b-eece-08de1bce4ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0hlQlE1NzVoQTFoNG9qUzdDNEVDeUJSRUIyWWIyZ2tCQldGNzBwOHFabEgx?=
 =?utf-8?B?MENrSHBuWnZBVDRLeXhmNlZoTGExZUtEd2lDQ3o4WFFhb0cxZ2I2Vm5uZVBZ?=
 =?utf-8?B?KzFkSTF3ZmtET3NFZEFqeEdRVDlDeDZGSTJISDFreHhnOHdFajBRMXV5K2VG?=
 =?utf-8?B?Q0dVV3F3bXdwclJid1RWaGpTWW9iTVp4SjJBZml5c09hbTR2em53VHB0Y3Fa?=
 =?utf-8?B?aEZrc0dvMnljYWdvbDNOckM2VndLcUJWNE1zdFllYlJ3djdGWGZxVytPTGpD?=
 =?utf-8?B?M1Q1ZENBWCtTWi9lUXBQcTVFeU1xam9HMVFtTzBsdm44K2h2WnNlU2U4U3dp?=
 =?utf-8?B?b0EzVDg5ZUNoUVE4Y1ZYMmNHM2V6cFpPamxLTjhENnAwNWRkbm5xb2NJVmxw?=
 =?utf-8?B?cG9UVW9FdE52eG1KblBrZjZYMmFYcC9YYUpXVlo4c2t0VUxBV0htdlB3QWRB?=
 =?utf-8?B?MHlScWNHSWpxaTJ2RGE2SmF3TEREbEJheEUrM2dYR3hpU3Nwb2JQK0dxcktp?=
 =?utf-8?B?Q3FqSUV4Z2tFRkE5ZmdhVnFDeVpsbWs4Zjh5ZElSMTQ3Nys2NnFuMEJoOGJZ?=
 =?utf-8?B?WjFDeXlxL1I3WEt6Y0NVVlpJcmNsTFkxTVNIZzZpdlk3YTRzY0RGTU9wTDkr?=
 =?utf-8?B?Z1hPSnhuejJ5Ym9uaXRwbnJHa0xwdUJwS1htQVRpMlpGbEhVWWQwUjI0TldB?=
 =?utf-8?B?dUdxMk5nTEEwZ05kd2w3Wkp2b0pSNThtL3o4RVJxV1VYOXJRUE9RRUx1YS9D?=
 =?utf-8?B?U1djWHdoZnRxTkttQ3h0Ykd4a1lQZFkrcW5HL0sxTkV2bkhJOG9tdzVRZllj?=
 =?utf-8?B?TGJNekdaMmRVWDQ1Z2ZmM1ZRME9NaU1NSmhuaXNBUGpqNGhOVndRVmhTS1hN?=
 =?utf-8?B?d3RUK2taa0dtQ0RkcC9PM3ZXRlExMGlLMUFST0xWT3ZXSUFRdkMzbW9rdDlu?=
 =?utf-8?B?OFR1WmdyYXRqU0gyY2hNSXYwK2swTmZwbnZ6dC92cW9iVW8yMnVwRE82NDlK?=
 =?utf-8?B?K3RLQXQrU2RoY2tTVUhKRk1hNVJXSmY3eDZLeEkyMHVWNVMxWjh6VjlkVnI1?=
 =?utf-8?B?UE8vSTA0MjFmMnhja01QUDZYeG1JRGRPbnkvMzN2U0xJR0dJWjYvZFpiMGo1?=
 =?utf-8?B?Y3R4ZGhXOGNUV2Q1WW5yc2dwUnA3dHpKRzhScEwyUko4aldTODB1Nm5OWUg5?=
 =?utf-8?B?ZmFCQ2VYQXR1djFHd1R3SHJRNm9xamY2RmxZb25xV05LbGxVSWhra3FraldZ?=
 =?utf-8?B?QkJncVhaWnRuMjJBLzJaRElJWmYxMkpWKzRyUHhpbC83TDM1QzFobFhSUHJs?=
 =?utf-8?B?RjV0NkJkaVRzZHRUWjZCZE5WYlVZSTI5cVU1N205UGJPajRFTXRJajhoOG44?=
 =?utf-8?B?S2dUQUpVbGRpV2lXV2VjWFp6M1VaV1BTL2Z2QUk1UUdZZW5wUkJuOUlKK05F?=
 =?utf-8?B?dnFGSFV1dzhWQzlvcXArL1FONHdzUVd0ZG43ZnlGZCs0QTRrRVZqL2J1MFFs?=
 =?utf-8?B?cjJvdTRNN0dPMEl0eFM4U1ZoSnBkWCswVDZIY0lrVCtZMnBVTng0b2RuSHha?=
 =?utf-8?B?QjRra0orM0tna1NsdlUwdGZibk1uYzhXZG1ZTHZpVFdLSkh0OFdUVXBmK2JK?=
 =?utf-8?B?dUx4QU40VTBBRm5xcFZlSy8xbUFPTHZnazladmpDMGJ4L3JtclBJQ2RlQ3Jx?=
 =?utf-8?B?SDRkdXNBQ1BwMzlWRldLU2FKak9rZFBDYWhNakpHSk5TUzFhSldZWlQ4MTlv?=
 =?utf-8?B?aWFUVEtPNFVVWHhJaUk0R0E3WlkyUGJzZCtISytXbnVuRU5HMDRsbXM1d3cz?=
 =?utf-8?B?UjZmWXN3OGl6elF0UzlodGxIc0N6a1cxeG03Q1IxeVQwZVBDQU8yUWRHbkxj?=
 =?utf-8?B?MUZUcnFmYTZvcmxHNEovSUZpVUhRb2xsdG5BWmVtR1F0Y3RiR3BrNTBzK05m?=
 =?utf-8?B?eEx0cXo0R29FUDBWM3NoVzJmbndkVDZFVkI0NjBwQUFzR01BaEttbFBuTjJN?=
 =?utf-8?B?Y2tXd1A5UXNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2pLMTUxcGJPN1MvdElrNU8yejk1VUwvdm1nQ3ZmMjdlMnV3ZWVXdWNJdDRN?=
 =?utf-8?B?VVprVXZYMERnb1ZrMGNKdFpqOHNPN0pRZmtZMWtnYjM5eHFic001Tm1XS2JT?=
 =?utf-8?B?ZGxuS21BR0RQWWk2Y2paNVpRdUN1a1BVWSsvSExLRm8vRkk3dnhyNWY1TWxM?=
 =?utf-8?B?NDBXRGg1cWFqdkdSLzdyajJkUUVHSHFackFhc3RTbXNGWlVFVGRlc0ROTnY2?=
 =?utf-8?B?L3Rsbyt5SURJckNBTHcyNEpVeHdCR1RtWjBERmh0SlUyOTA1ZXhyTndvSEhS?=
 =?utf-8?B?MmxXNjNkVldyanFMSjBubU4vdUluVnUwcUhieG1uOGx4TTVhRkZrcnlRN3N0?=
 =?utf-8?B?MWQ4bnpLdUFjeFhheTk2Q0pmS3A1TjB6T1R2TFVrSU1JcGpuU3lJdm4vRmR4?=
 =?utf-8?B?bWZzNTJaRUV0Sm8zbUJ6WWQ2ekZ1bUxIbjFFMzFaZ05DSGM0bEM4RFNRNFI5?=
 =?utf-8?B?MHhBQkd1NFJaYno2NFBoQ1N0MXdMeGUzT3lNMnplbTdEVWZ2dGxhZkhNZ01F?=
 =?utf-8?B?VEZlaURHQm5lVmFEMytiMlV1NFFkWFVHUnQ1Tno1Y1kzWEhmM1VlSm9yYzNK?=
 =?utf-8?B?RWllZHEvNzNPZllUcUZwaEdPTjJtdWlCK0hUWUM0YzlLa3RGSG5CVVJVZXlD?=
 =?utf-8?B?bzg1N2FtSVMxUUlSckcvcm9NVG9lckdEREYwYUZDeXA2bFJPakVNaVlFTlZC?=
 =?utf-8?B?N3hadUlFTVVnTThpZmFDTGNTOW9XbUFOYnRDUVAyRDVkVk1Tdi8vWHpGVnI4?=
 =?utf-8?B?c2xRcnZNbitGUVE1cDJnM2RMTk5ZMSttNWJRc0xUVFVnYjJ2dEV5WllvZGVi?=
 =?utf-8?B?ZzI4ZHJHU1JmQTJoVlVnSGpKdExlc2tzcFF2RHdKd2xyM1B3Mkg0Qll2VFNt?=
 =?utf-8?B?N0YxZEd3VCtKWSt6TDgwcXpFc21vZ3h6RElPSXVQeG5EOU85bENXZHdRZzRR?=
 =?utf-8?B?L2wxNHZKblhjdVhSLy9pTENxRnhGc3M5eTNhRHdkRlZFT2Q4SHVWN0plSVdy?=
 =?utf-8?B?eW5NM0lMYlJmbTFzemM4SDdRUzNycjd6NkxPSy9IWXNSbHB4SUQ4RFBMK2Ri?=
 =?utf-8?B?Q0p2Ky9kc2hHR1lNWThUWmlpY09UQ3JBRm5CeGZqVGtRZDd4WlJjbG5tMW1v?=
 =?utf-8?B?ZGNaaCsxQVBLSThFZDhpNnpJSThpUGV0d2N2MGN4Qk9LSVgzcG5vcmNUUnE5?=
 =?utf-8?B?SHZvLzI1OHR4dUwwcEVzNVpSWXoxYmpMaDVkNHZTcVc5MTNrY3ZCVkF5Umtz?=
 =?utf-8?B?WmJlaEdNU1RuYnpoa0RCR3l2dUxkSWRmQ291YVBMdEQ2d2J5c3JrRDVjNmty?=
 =?utf-8?B?WWpDcWxDT3dtbVgwWlJzOGw5Skt1bVBNMnVCTm1qMnZRY2VKcVlWbzdpTzJa?=
 =?utf-8?B?OUI1SjV5RThHZ3ZrTGxObDJ1U0VxN1RjTXJHcnpvSUxPZERPb0Q5dHU0VjNi?=
 =?utf-8?B?a0tpMWRGMDJTZ0l3dlFmNitiRVQ3eGRRWFY1bEJXaFYvejFWV0ZMUWFLa1Ft?=
 =?utf-8?B?U0s5Q3cxOU1jeEtBNGhrSjIwblFST3pTYXJmL0NFeVVhaXNib3RCcWo0WXAz?=
 =?utf-8?B?anRycU0zQlA4bjllSURUSUhZRUVkYW1WbEk3TE5XcERBVjRuTXpZbjZ0TW9E?=
 =?utf-8?B?K3JKc1pkKzF2dmlua3lkQUdFVmoyUlAxT28yL1VsOVUrUnRSclhLSEYreXND?=
 =?utf-8?B?dHcwT3BudDdZQkNnZkNsaFFNK2UwZlBtNkQ2bjB0eUovOHdFWFBoRjBDRXli?=
 =?utf-8?B?OWxDamt5eWNGM3IwbjhTZEtDUW9QVHMwbk95NGVTVHMyV1lWbC8yTkFINWhh?=
 =?utf-8?B?d09kWjl3MmsyL1g1eDA0WW1YQlV3TWtkVXJvN3lXTlBZZERWdGc2bENSUS9N?=
 =?utf-8?B?bmpIa0lrNjhuaGpnYnFPRTNoa2VrQzdqYlZvMlhScEkvbFFLaU53RS9kRFZM?=
 =?utf-8?B?V0ZHVHIzOGRzZXBYY083SnNRQUJFSnNJT2lueWFrWmEwS2tJVi9YVUtlLzMy?=
 =?utf-8?B?TCtOWENmVTRXYVpIYmZUWms5QkdXMnFhbHRyZWxZcXVGRVZ1K0NPZkdkUEM1?=
 =?utf-8?B?RlpiVCsxejRxSTdEZXFjdis3R0NYVHlXaVdoai9hVk9RRXNvNzFuQXlIbys2?=
 =?utf-8?Q?q83XOS8M7HxBTaateRKdZa/DK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6164b6bb-90c3-457b-eece-08de1bce4ad8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 18:16:37.0710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjqT71zHQ1/HE6P9sWdq6R/ICkfz7w2EGhylNrwzTyEzCZEGz5iaw0fQBlVitPvaHhh8U2lyLX1IgAo1eq2iDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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

On Mon, Nov 03, 2025 at 01:35:07PM +0530, Riana Tauro wrote:
> Hi Rodrigo
> 
> On 10/22/2025 6:08 PM, Riana Tauro wrote:
> > Hi Rodrigo
> > 
> > On 10/17/2025 12:47 AM, Rodrigo Vivi wrote:
> > > On Tue, Oct 14, 2025 at 11:02:58AM +0530, Riana Tauro wrote:
> > > > v2 survivability breadcrumbs introduces a new mode called
> > > > SPI Flash Descriptor Override mode (FDO). This is enabled by
> > > > PCODE when MEI itself fails and firmware cannot be updated via
> > > > MEI using igsc. This mode provides the ability to update
> > > > the firmware directly via SPI driver.
> > > > 
> > > > Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > > 
> > > > Userspace should check FDO mode entry in survivability sysfs before
> > > > using the SPI driver to update firmware.
> > > > 
> > > > v2 also supports survivability mode for critical boot errors.
> > > > 
> > > >     cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
> > > > 
> > > >                 Capability Info: 0x138320 - 0x2001ae06
> > > >                 Postcode Info: 0x138324 - 0x0
> > > >                 Overflow Info: 0x138328 - 0x0
> > > >                 Auxiliary Info 0: 0x13832c - 0x0
> > > 
> > > I am truly sorry here, but although I was the one that designed this,
> > > looking it now, I realized that this is breaking the sysfs rules
> > > of one value per file and no fancy format. This is only allowed in
> > > the debugfs.
> > 
> > Just found the link regarding the "one value per file". When i had tried
> > this i found few sysfs having this format, so used the same.
> > 
> > > 
> > > We need to change this asap, and with help from any tool that
> > > might be already consuming this.
> > > 
> > > >                 FDO Mode: enabled
> > > 
> > > After we fix that we can come and add this.
> > > 
> > > About our options: I don't believe that debugfs is an option
> > > without the drm card right?
> > 
> > No debugfs will not work here. And changing the path now will break
> > any tool using it.
> > 
> > > 
> > > Perhaps what we need is to transform survivability_mode in
> > > the directory. Each entry becomes a file in this directory.
> > 
> > Since tools check for presence of survivability_mode file. We
> > can try this. Will check and respond
> 
> 
> fwupd tool currently reads the file for runtime survivability (though the
> file has only type). Changing this would break the previous versions of
> fwupd
> 
> https://github.com/fwupd/fwupd/blob/66a0e5cc13b2f9b1391d84186bd6274cc9971299/plugins/intel-gsc/fu-igsc-device.c#L397
> 
> @Frank, is it okay if we change the directory structure now?
> 
> Or else can we have two sysfs entries.?
> 
> 1) survivability_mode - boolean to indicate if device is in survivability
> mode or type of survivability mode

ack

> 
> 2) survivability info for all the other details?
> 
> /sys/bus/pci/devices/0000:03:00.0/survivability_info/
> ├── aux_info
> │   ├── aux_info0
> │   ├── aux_info1
> │   ├── aux_info2
> │   ├── aux_info3
> │   └── aux_info4
> ├── capability_info
> ├── postcode_info
> ├── postcode_overflow_info

ack

That sounds indeed better. We cannot break user-space.

Thank you and again, I'm so sorry for the bad sysfs design.

> 
> Thanks
> Riana
> > 
> > Thanks
> > Riana
> > 
> > > 
> > > Sorry,
> > > Rodrigo.
> > > 
> > > > 
> > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 ++
> > > >   drivers/gpu/drm/xe/xe_survivability_mode.c    | 32 +++++++++++++++++--
> > > >   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 ++++
> > > >   3 files changed, 38 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > b/drivers/gpu/drm/xe/ xe_pcode_api.h
> > > > index 92bfcba51e19..d41f07f9194d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > @@ -77,11 +77,13 @@
> > > >   #define PCODE_SCRATCH(x)        XE_REG(0x138320 + ((x) * 4))
> > > >   /* PCODE_SCRATCH0 */
> > > > +#define   BREADCRUMB_VERSION        REG_GENMASK(31, 29)
> > > >   #define   AUXINFO_REG_OFFSET        REG_GENMASK(17, 15)
> > > >   #define   OVERFLOW_REG_OFFSET        REG_GENMASK(14, 12)
> > > >   #define   HISTORY_TRACKING        REG_BIT(11)
> > > >   #define   OVERFLOW_SUPPORT        REG_BIT(10)
> > > >   #define   AUXINFO_SUPPORT        REG_BIT(9)
> > > > +#define   FDO_MODE            REG_BIT(4)
> > > >   #define   BOOT_STATUS            REG_GENMASK(3, 1)
> > > >   #define      CRITICAL_FAILURE        4
> > > >   #define      NON_CRITICAL_FAILURE    7
> > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > b/drivers/ gpu/drm/xe/xe_survivability_mode.c
> > > > index 1662bfddd4bc..1c9421651548 100644
> > > > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > @@ -16,6 +16,7 @@
> > > >   #include "xe_heci_gsc.h"
> > > >   #include "xe_i2c.h"
> > > >   #include "xe_mmio.h"
> > > > +#include "xe_nvm.h"
> > > >   #include "xe_pcode_api.h"
> > > >   #include "xe_vsec.h"
> > > > @@ -61,6 +62,12 @@
> > > >    *    Provides history of previous failures
> > > >    * Auxiliary Information
> > > >    *    Certain failures may have information in addition to
> > > > postcode information
> > > > + * FDO Mode
> > > > + *    To allow recovery in scenarios where MEI itself fails, a
> > > > new SPI Flash Descriptor
> > > > + *    Override (FDO) mode is added in v2 survivability
> > > > breadcrumbs. This mode is enabled
> > > > + *    by PCODE and provides the ability to directly update the
> > > > firmware via SPI Driver without
> > > > + *    any dependency on MEI.
> > > > + *    Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > >    *
> > > >    * Runtime Survivability
> > > >    * =====================
> > > > @@ -105,6 +112,11 @@ static void
> > > > populate_survivability_info(struct xe_device *xe)
> > > >       set_survivability_info(mmio, info, id, "Capability Info");
> > > >       reg_value = info[id].value;
> > > > +    survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION,
> > > > reg_value);
> > > > +    /* FDO mode is exposed only from version 2 */
> > > > +    if (survivability->version >= 2)
> > > > +        survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> > > > +
> > > >       if (reg_value & HISTORY_TRACKING) {
> > > >           id++;
> > > >           set_survivability_info(mmio, info, id, "Postcode Info");
> > > > @@ -171,6 +183,9 @@ static ssize_t
> > > > survivability_mode_show(struct device *dev,
> > > >                              info[index].reg, info[index].value);
> > > >       }
> > > > +    if (survivability->version >= 2)
> > > > +        count += sysfs_emit_at(buff, count, "FDO Mode: %s\n",
> > > > +                       str_enabled_disabled(survivability->fdo_mode));
> > > >       return count;
> > > >   }
> > > > @@ -179,9 +194,13 @@ static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> > > >   static void xe_survivability_mode_fini(void *arg)
> > > >   {
> > > >       struct xe_device *xe = arg;
> > > > +    struct xe_survivability *survivability = &xe->survivability;
> > > >       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > >       struct device *dev = &pdev->dev;
> > > > +    if (survivability->fdo_mode)
> > > > +        xe_nvm_fini(xe);
> > > > +
> > > >       sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> > > >   }
> > > > @@ -230,11 +249,18 @@ static int
> > > > enable_boot_survivability_mode(struct pci_dev *pdev)
> > > >       if (ret)
> > > >           goto err;
> > > > +    if (survivability->fdo_mode) {
> > > > +        ret = xe_nvm_init(xe);
> > > > +        if (ret)
> > > > +            goto err;
> > > > +    }
> > > > +
> > > >       dev_err(dev, "In Survivability Mode\n");
> > > >       return 0;
> > > >   err:
> > > > +    dev_err(dev, "Failed to enable Survivability Mode\n");
> > > >       survivability->mode = false;
> > > >       return ret;
> > > >   }
> > > > @@ -365,8 +391,10 @@ int
> > > > xe_survivability_mode_boot_enable(struct xe_device *xe)
> > > >       if (ret)
> > > >           return ret;
> > > > -    /* Log breadcrumbs but do not enter survivability mode for
> > > > Critical boot errors */
> > > > -    if (survivability->boot_status == CRITICAL_FAILURE) {
> > > > +    /*
> > > > +     * v2 supports survivability mode for critical errors
> > > > +     */
> > > > +    if (survivability->version < 2  &&
> > > > survivability->boot_status == CRITICAL_FAILURE) {
> > > >           log_survivability_info(pdev);
> > > >           return -ENXIO;
> > > >       }
> > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/
> > > > drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > index cd65a5d167c9..379d90759c28 100644
> > > > --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > @@ -38,6 +38,12 @@ struct xe_survivability {
> > > >       /** @type: survivability type */
> > > >       enum xe_survivability_type type;
> > > > +
> > > > +    /** @fdo_mode: indicates if FDO mode is enabled */
> > > > +    bool fdo_mode;
> > > > +
> > > > +    /** @version: breadcrumb version of survivability mode  */
> > > > +    u8 version;
> > > >   };
> > > >   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > > -- 
> > > > 2.47.1
> > > > 
> > 
> 
