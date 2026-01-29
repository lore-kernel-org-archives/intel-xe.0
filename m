Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B1D73E9E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 22:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637C610E1EA;
	Thu, 29 Jan 2026 22:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mboLplPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C2810E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769727140; x=1801263140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UTUxY8ZDNFpGZwk9VqwASTGehnZ6ijlWhK0s2y0Bad8=;
 b=mboLplPwCWfszQ6oVg4dfdD4LtEE4rS9zIvS//fgBgKn7y9bRRBMZ2kw
 osW9BJrUCh+F33uy+GV6KLEcY7tP3IGq5C1D6245YQVD/93Q0/WYVXex/
 t4xWR4wn571ZFDa3/N2EQun329A8q4yOUpEtjqOW/M+FmRWcpP5s0GfFM
 ci0++Qknq4f/uAicTsrDGGKG0mQWOmP6jzgouolWwr8WBEj5VD6sWo2uy
 MA1NCAek2Y8bw0lskVpT5JTQSs/AqbkgSqY2Woqp/DtgYfQ5pyWRm7rT+
 pGmfKnQ8RE1sD+wgRRivy+jlJ4bP+RAsYBGwhXFte0aPr3SRwJY1u7pzS A==;
X-CSE-ConnectionGUID: jAjjQhbARgavKMZeCRaYiQ==
X-CSE-MsgGUID: kaHhYjQzSpiBG4NeBOTQUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82088832"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82088832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:52:19 -0800
X-CSE-ConnectionGUID: sgN9F8f/TQCeF5HAKtYKHg==
X-CSE-MsgGUID: V3VW2x8TR4SlQeEiqT6mdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="212786320"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:52:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:52:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 14:52:10 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 14:52:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQtHR8IwsPLYetr3+9APuSxIF4h1miypBjf1lpq5QXzPBioa/IbnmIcXODdDkmNkoS26wA1lT9my1aU3pRXXsxQQxSrk46YzNEepxbLmYA+yTpjsT+ZcNVLnboiQk6gPTIF0hvVRKV/QZRsBqoWebcCoHSzlwPTnvDWl7gXQbs+Mf/zVnMhZrzX5vL3+Atnh/A64MG2ALaE14IpuSGmomfxD9g2/G/7PQbJ2apKK0d0BEXeRjtjpcP/RvKct9g7TzKxhBKTKZyH4VtHxbJVDlEoPhZTX5XxEshb52XG5kmNOCxCRydmbgNfooHfPi+RjbdHm2C9YVL08GDBh4TUVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruYFzv9CguK72Q2gC+bvuVU5IGNgPINvCAiKHY1QtjY=;
 b=ocGEpBiObCiSuznnHvri9SaDGax+0cxdVrhSPe/IhQa50taAe0v6XzlqlWOwPLfgnjEtjIJsYGHR6llu7/YRkYtR6bRGaIX7CNxESUFfaGCBoaydw96V35DzMCwujTURrS2XWjGeQca//GL7nW8l2PEhzfEBMs8eRCfpvMNc8bS3XN/mk7N5Ox86xuIQ4thwmoQ8N28FxjuxQ3PaKK30rPPeN9uP3rX+cx0nbldjFz+WLKEnIm3BEO0LiyrOA3hbjozu+Lv3I7+s97vb27VyWrx8alXhCz81pI74Q3jSOKje4nT14hujVojIe3UHK6U0QJ/py95N1T6oyc3fIrv+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 22:52:05 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 22:52:05 +0000
Message-ID: <bfd9fbfb-4b07-4f11-9589-24f6f354058d@intel.com>
Date: Thu, 29 Jan 2026 23:52:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
 <20260129121044.3670780-11-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129121044.3670780-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 89adf772-e6c9-4d4d-383d-08de5f890651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkdWTlo3TTJhQ1h5OXFjdUkzUzkwNmlqbnBlcjVlN3NXcm05ZXY4YTVLNmFQ?=
 =?utf-8?B?UnphVFhqV1JGem5ZdWdVS1ZZK0JyY3cvTW1jS0tIMkpXcEZDaEFESG12aTY5?=
 =?utf-8?B?dXlOcjdlaVhTcDQ5RXkxVGsrWnlSSmZmeTNGV0RyOEV0NkNPM3dhUjN1RUhk?=
 =?utf-8?B?VklCR01naVAzZE1ybWdiYTV3ZDhEbTVYS0xHSE1ST1lpYk0wTXdBRkdwSzF0?=
 =?utf-8?B?TkZBY2ViK0pOdWZGK2Vibm45WTZ3MHV1eVlXbUx2UlYvQkZqWHZ3T3NodkJ5?=
 =?utf-8?B?T2ZSM1E1YUNwOHhscnptM1dXUWpDamdlbVl4S3FmQ0w4Z05RUWc4VVpsaXg3?=
 =?utf-8?B?eCs2eG54blFndURISDc2WEorSGxqUXpnSzhZamJPcWdtWXlRNWZnYXZ1MC9m?=
 =?utf-8?B?QkpWVkV4alhpUXBOYkVSaHprcm45dkZNWHlURDducnJPM29JSVhpSEVMY2x2?=
 =?utf-8?B?a3FWTnhsMjcrN2tTSlNXcGpvbTFWbW40SkFadUFHcGU3aGJhRitFNXpaVVA5?=
 =?utf-8?B?SFhyV1FjM3JiTllWSWFDcmErUVVLelBrMHhqYUl0WmVLUkxvVDJKOHNuNDZ0?=
 =?utf-8?B?MW1ZNFFMbURuQ2g2T3FZdmZmd0MvN0twdTZSY3NiTmxwOGZGU01ESjdPbnM4?=
 =?utf-8?B?c09hRG0yTGYyMFhvRklaUmRPY0I2R1V2UENXSld2K2hXaTR2ZzJIUVc2WWI3?=
 =?utf-8?B?aDYwV1V1KzlMUmJhMHptME5RSWVlZDBFbksxM1F5T1BPMy9SVWtvMHk2cVl6?=
 =?utf-8?B?MDAvQU9XMEFmYzU2M1pXcHl4bk5uK0lKT3NZSEJEdnI2Sk9sVHgxSElKNlk1?=
 =?utf-8?B?Y2hab0wzZjJZYjdYK25mZElRSW0xY3MzN0p2Yzl5K2kvMmNiSWh0MEJ2eDZF?=
 =?utf-8?B?RnhaSzZwYjJJYXkxb015OHg0K2ZmZVdSWi9SRnZ3WW9UMTBBNWJvWHlKcTRF?=
 =?utf-8?B?Vm9oRUVYSDlVNkJCWSsvQm05WWdmb3R1OXV1SzlEVDU4VkxRRUJUSWI2WmRN?=
 =?utf-8?B?R1VuVmErRTlyNFpkVHp1R0V5MGQ1V3RPRGZHU2dpQzNEVGdUSE1DZDV2Wm9T?=
 =?utf-8?B?R2t5SWRLV1h0RDFyTU5ka1lGd0dONEQxWXFyc3hMekRGQU9nb1RQRFRSamJE?=
 =?utf-8?B?OXMvcFBmNW1DOWxOWEt2S3AyTE4rTlB3Yi9WN08xUS9xMTFBcms0WlJjTGgy?=
 =?utf-8?B?dTFldllUSG1WZjVZZGE2V1NHTTZ4aVRJK1c4V1E0b2JQeUxHbjEzK0E1SmNZ?=
 =?utf-8?B?eXd6NG5BcGZKUUZqclVjZkJNcjZOWU9xOFNhUXhKa3RobGNiZXluTXg5WmZ3?=
 =?utf-8?B?WGJwM2RLa2pqV0JMSE43ZG5kaE0zRjc2NEJBb25nU2ova1hGNFZ2VWU3d1pV?=
 =?utf-8?B?OGtzbGd0ajhneDZmQ0pFNW1USWZGZGxIUzBjKzZzaUNISGsveTJ5bG51YmdU?=
 =?utf-8?B?WXI2RkVsUTR0VzJBUDd4OC9zZngzMXFkdVZLZDJOL3NId0hQWnBXZnFzTlNw?=
 =?utf-8?B?TXM3R3oyZW5yRVU0RmVoZHhqejBOTEtVanNlb3pwbitTQ21XZDZtMzBPdFhC?=
 =?utf-8?B?Z1FoY1Rta29mNDJXaUJDUFZjZ24yY0ErVnVybjIrSDNFL08xcVhIajVEWFNW?=
 =?utf-8?B?UTlnL25PL3JhbjNGUzRHZ0dlUzNBcERaa2RtajRQOVdoUVZlZVpEczl4M1E4?=
 =?utf-8?B?ck9RQkczeFJodGJjK25NT1JMZ1pkUVBNS2U1SVNIRUFmUWpGQ0t4b212enhl?=
 =?utf-8?B?R3JtbVBWM0grK1NCWHAxS3FvTkNyY2xwU01IUG5ZS3NSWmsrdUhsa05UNEZr?=
 =?utf-8?B?SUZHcHJ4TW9tMGpMRzM5ajN2UStrclcwOE85dTB6aVA5MEJPNFl5WVJtcHla?=
 =?utf-8?B?OTdsSGxqcTlkOFVpTUJ1Y1owcDRMVVhENDJHT25DY1Q5dFVhdVZLREhCbzQ0?=
 =?utf-8?B?bk5wWlB5a3FvNmt4RU9VSnR0UjFRRWZ3MXljbk5CdHVJWk5tQWtuWFJTOWdQ?=
 =?utf-8?B?c0xqQTFlNDNEZ2pXODlCRFBoQ3NjbUhUUGY1YUp2eUJxSHVVSVhMMTZlVXJm?=
 =?utf-8?B?Uk5nbFJFaHVjU2gvc25tL1p5N3Y0UVR3U3QrT29PdWxuNTQ2dEpwS3FPSkE0?=
 =?utf-8?Q?f1jc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdESHVKYkUwQUdkY2JXaFRYL3plLzArbmhJTGV3V3Bzb0ZVZWMyWUo4RkFp?=
 =?utf-8?B?NXpVdDE2aVdpaG1weiswSHpScmFyVkhsYXhuTHhkeVZ0dXhERUlqRkVmWGpL?=
 =?utf-8?B?RE1XeTFhUk1xTlZFOUNNQmJWWVBFR3VZNjViVEZsVTgrSUhGcnNzQW1OQURG?=
 =?utf-8?B?R0U4NmdxUGdGbmQrSkRwMnlVTmNOQTBlc3VmM3JEZXNqRXUyZVZvenBlVTh3?=
 =?utf-8?B?QThPOUpkM0E4U1VnM21nYlhjbFAycHAybXRBbjF4N2pNTkdHYjBNVjVDSyto?=
 =?utf-8?B?bDZhTVNOK0k2cytNNm5LV1VBbFZkSS84RGhBdjREazRGdFlhN2RWVHVTTG1p?=
 =?utf-8?B?aTRUQ1A3N1hkZmNtalczTWU0THQzY281R015MXcwTHEyc20zZkFvTWRFMlJO?=
 =?utf-8?B?V1FndzlYL0V2cXJ3bnlMODdIbjQ5REIxZ0E3ZmJVWExkdjcyUWxzMXpocGpK?=
 =?utf-8?B?WW1jLzR6b0sxd3pBYXc2YVJHTEFSeVZJbE5DMmNramUvVHQ2bm8xKzZyMzNH?=
 =?utf-8?B?S1lPdXUzS2dRZ0xqbUVZNEhuenY4RGpSVmg1aVJvRUVEcldhS2kvYng2dkJG?=
 =?utf-8?B?UkZqdXNJdGxHTklaSWwwN2o0UHBrbGZPOWs3ZFZJVllnNEtacW9UTFpValNn?=
 =?utf-8?B?MlR0ZjkvSkFyM2FuMTA4c1NiTm5qbkhCeHE4elp3Z0RLSFc4T2FidHY1a3d5?=
 =?utf-8?B?NyswMmxyTVgyR2E3REkrbTFheEU0bHlZRjNUa2NlL0pHUmtNNmVPWjl0VFVP?=
 =?utf-8?B?VVVvWmlFUmVDRnQ4WHFqTU11Z2JLQXlIZGFXdVNReFlhWlRNV0VEaWpsaDJY?=
 =?utf-8?B?Uk9JQjREL3hoZHJsUDUzb2pGRThRem9iZmdEbm16OVJ6Vkd1S3FoSHM3VkNC?=
 =?utf-8?B?eFhyei9GS0cyL3VLSlZBQ1RyTW1mR3hzS2gxYWYySHFmMXFEZllHV2lNdlE5?=
 =?utf-8?B?RHlqdE5vZXRRYlA3eU9jR0NlM3ppS29UY1dGL0wyOHRMczRNQ0NEbTJlaGxT?=
 =?utf-8?B?bEhyU3FpOEtYZGJ5QTdDa2puOCsydTBSSVJhOGtTTUdRN1I4UmpoQ3Fubm9z?=
 =?utf-8?B?d3U5UnA1elRIeWtXRjNvK0dGejdvOElwUHhqWkxNME9aS3g3d2Q2TDhYOFY1?=
 =?utf-8?B?SUJybmxvbzVUcEZxeTdVMWhDcm9TQzluWDgvQTB3aGF2NktOYjc2eHRJeUh2?=
 =?utf-8?B?ckFFT1dLR1lzYTJIVER2QjFVc0czanJQajBWZXl3MmMxWEZCNWx2VFlrTHdX?=
 =?utf-8?B?dldMUlprQ3pkMjlONkFZSWlJZFh4Y0ZETDRhQXYxSlpSZ1dlVDNWS2pmdkRp?=
 =?utf-8?B?KzJzVFR3YTB5WG1WcEd3YUUyMm56cjlLMnNvenBaUWRZNnZIZkR3ZjIrR29X?=
 =?utf-8?B?dDZzQVZFemFQTmp5S2svR0MyT0dIZHZnc0lya2pUU0xwL2cvc2tOcUFzaE5j?=
 =?utf-8?B?aEFWbUQ1VVNSczFiRzJMamhhNlpvQkcrRlJFaWVIclh4Q0FWNGhqczhseFp4?=
 =?utf-8?B?cVVjd3B4UHdrMEJibkFnbkJNd1RYUjdCanI5cjYwbnZVUXZYbUEwV3ZYZ05N?=
 =?utf-8?B?bkRaTnJrUnc1WWJWZVc4WU1SOGxpeXg5R2ZvTm01eFNFK1pZT3dZSHE2S002?=
 =?utf-8?B?eE1XcHFEZHdIZXkzbUxZd2FEMlo4SkI2elh6Tm4wUUZOeGs4SWJTUE9hZXpV?=
 =?utf-8?B?YlFTV2pJVjlFVzJWeWhwYlpaTkVKTktROUM3NUxOVWtJMFJjNmh1a1lMcVNS?=
 =?utf-8?B?OXdZSWRqZ0FhTlFZcjNJTDFUazV3cGR5ZGF2cFpWWVFuWXFqWWtua0cvbERV?=
 =?utf-8?B?RHF6ZTF5R09MNjdaZ285NGlwM1B5blRrQUtrZG5wVllYSEJKeW9IWU0xK1Vz?=
 =?utf-8?B?YVFxMnBHRG1BQXhPR2FZeVNIbW1JbzEvbldLblBVdGpqYXpYV1BiZ1JkbjZ6?=
 =?utf-8?B?QzN1Y1piZ0pYVkIrY21lblpBUWJseU5pV1lncHBpMHJ4TUVPK0hYVmROcFRG?=
 =?utf-8?B?a3g0VUF1SkRhY2VqK3F6T05TRGxJUDFkdkJwNDlsMDYya1ZhbmY3bGxOR2ZC?=
 =?utf-8?B?OEVMVGYyTXdLclA5TVl1SkZGWmlaTVphOFFXOUs3T1FVMHhHMTI1UTNtc2NQ?=
 =?utf-8?B?V3Y2eEorVkxsZ1RWK2Q1TXNpZW9PdkpNR1pEQmJESnE1a3JheGhEak43SVdL?=
 =?utf-8?B?dHN3aFdBRkdscTZMeUxwV3c2YVdPaXVMWkdVSm1mTzJMMEhGVGRkOTU1UDMx?=
 =?utf-8?B?ZTlndWxJbWphVzROWVUvNFpNTm9FNitYRytxL3AxeFZMV2U2WXJGVm9mc25I?=
 =?utf-8?B?a2FGTnI4Q3U3T2NQcmU2Q2JobWhUWWdHelZMQzV2T2t6L0QvUFhLOThDejh6?=
 =?utf-8?Q?BG4txdb0Z5WerUK8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89adf772-e6c9-4d4d-383d-08de5f890651
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:52:05.6111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe7qMf/Lz/iJZkVCDm2xAmCHKgUfABxVB8rjZX5PkhHk51BryLvX1pqI2URZEKs6MaEE5wCOk0TW/RDb1lz9HqjuQ9HTGeUwOms8SachHbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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



On 1/29/2026 1:10 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Implement the System Controller mailbox communication layer:
> - Low-level frame I/O operations
> - Mailbox busy/ready state polling
> - Command preparation and fragmentation
> - Multi-frame send/receive with phase bit handling
> - MKHI protocol header validation
> - Public API for sending commands to System Controller
> 
> This provides the complete mailbox infrastructure for
> communicating with System Controller firmware on Xe3p
> dGPU platforms.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v4: (Matt, Mike)
> - Refactor MMIO access to use domain-specific accessor
> - Add input validation and buffer overflow protection
> - Add bounds checking for multi-frame operations
> - Fix potential NULL pointer dereference
> 
> v5: (Umesh, Riana)
> - Reset phase bit to 0 on error conditions
> - Refactor mailbox receive path
> - Updated xe_err messages for consistency
> 
> v6: (Matt)
> - Use SYSCTRL_MB_CTRL_MKHI_CMD macro instead of FIELD_PREP
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 390 ++++++++++++++++++++++++

what's the point in adding .c file without adding it to Makefile?

>  1 file changed, 390 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> new file mode 100644
> index 000000000000..15a186a6f057
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -0,0 +1,390 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +#include "xe_sysctrl_types.h"
> +
> +#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
> +#define MKHI_HDR_IS_RESPONSE		BIT(15)
> +#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
> +#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)

move them to some ABI header?

> +
> +#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
> +	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
> +	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
> +	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +
> +static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> +{
> +	return container_of(sc, struct xe_device, sc);
> +}

that will not compile until patch 6/6

you should add minimal struct definition and plug it into xe_device sooner

and likely this should be placed in xe_sysctrl.h to avoid code duplication

> +
> +static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,

for static functions we can omit xe_ prefix:

	static bool sc_wait_bit_clear(sc, ...)


> +					      unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +				 timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> +					    unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +			     timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
> +					  size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> +	};
> +	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};

why do you need this zeroed ?

> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;

maybe add some asserts for expected len values?

> +
> +	memcpy(val, frame, len);

why this extra copy?

	xe_mmio_write32(..., ((const u32 *)frame)[i]);

> +
> +	for (i = 0; i < dw; i++)
> +		xe_mmio_write32(sc->mmio, regs[i], val[i]);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
> +					 size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> +	};
> +	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	for (i = 0; i < dw; i++)
> +		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
> +
> +	memcpy(frame, val, len);
> +
> +	return 0;
> +}
> +
> +static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
> +{
> +	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
> +}
> +
> +static int xe_sysctrl_mailbox_prepare_command(struct xe_device *xe,
> +					      u8 group_id, u8 command,
> +					      const void *data_in, size_t data_in_len,
> +					      u8 **mbox_cmd, size_t *cmd_size)
> +{
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t size;
> +	u8 *buffer;
> +
> +	if (data_in_len > SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
> +		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> +		return -EINVAL;
> +	}
> +
> +	size = sizeof(*mkhi_hdr) + data_in_len;

maybe additional struct definition:

+struct xe_sysctrl_mailbox_mkhi_msg {
+	struct xe_sysctrl_mailbox_mkhi_msg hdr;
+	__le32 data[];
+} __packed;

will be helpful? 

> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;

you likely don't need this tmp buffer var, as this should work:

	mkhi_hdr = kmalloc(size, GFP_KERNEL);

> +	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
> +				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |

you don't need to mask command here, FIELD_PREP will take care of it

also you should either add assert that will check if command fits in field,
or, if command is not in our control, add separate runtime check and report -EINVAL


> +				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));

IMO adding explicit 0s via FIELD_PREP is pointless

unless there are some definitions instead magic 0s like:

				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, MKHI_REQUEST) |
				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, MKHI_MBZ) |
				     FIELD_PREP(MKHI_HDR_RESULT_MASK, MKHI_SUCCESS));

> +
> +	if (data_in && data_in_len)
> +		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
> +
> +	*mbox_cmd = buffer;
> +	*cmd_size = size;
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc,
> +					  const u8 *mbox_cmd,
> +					  size_t cmd_size, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t bytes_sent, frame_size;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +	bytes_sent = 0;
> +
> +	for (frame = 0; frame < total_frames; frame++) {
> +		frame_size = min_t(size_t, cmd_size - bytes_sent, SYSCTRL_MB_FRAME_SIZE);
> +
> +		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> +			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			sc->phase_bit = 0;
> +			return -EIO;
> +		}
> +
> +		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |

REG_FIELD_PREP ?

> +			   SYSCTRL_MB_CTRL_MKHI_CMD |
> +			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
> +
> +		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
> +
> +		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			sc->phase_bit = 0;
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += frame_size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc, void *out,
> +					    size_t frame_size, unsigned int timeout_ms,
> +					    bool *done)
> +{
> +	u32 curr_frame, total_frames, ctrl_reg;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	int ret;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg);
> +	curr_frame = FIELD_GET(MKHI_FRAME_CURRENT_MASK, ctrl_reg);
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	if (curr_frame == total_frames)
> +		*done = true;
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
> +					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +					     void *data_out, size_t data_out_len,
> +					     size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	size_t frame_size, remain;
> +	bool done = false;
> +	u8 *out;
> +	int ret = 0;
> +

please no spaces between vars

> +	remain = sizeof(*mkhi_hdr) + data_out_len;
> +	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

and keep vars together

> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	out = buffer;
> +	while (!done && remain) {
> +		frame_size = min_t(size_t, remain, SYSCTRL_MB_FRAME_SIZE);
> +
> +		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms,
> +						       &done);
> +		if (ret)
> +			return ret;
> +
> +		remain -= frame_size;
> +		out += frame_size;
> +	}
> +
> +	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
> +
> +	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(mkhi_hdr) ||
> +	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
> +	    XE_SYSCTRL_MKHI_HDR_COMMAND(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
> +		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		return -EPROTO;
> +	}
> +
> +	if (XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr) != 0) {
> +		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> +		       XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr));
> +		return -EIO;
> +	}
> +
> +	memcpy(data_out, mkhi_hdr + 1, data_out_len);
> +	*rdata_len = out - buffer - sizeof(*mkhi_hdr);
> +
> +	return ret;
> +}
> +
> +static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
> +					   const u8 *mbox_cmd, size_t cmd_size,
> +					   void *data_out, size_t data_out_len,
> +					   size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t received;
> +	int ret;
> +
> +	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out || !rdata_len)
> +		return 0;
> +
> +	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
> +
> +	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
> +						&received, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	*rdata_len = received;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
> + * @sc: System controller structure
> + *
> + * Initialize system controller mailbox interface for communication.
> + */
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> +{
> +	u32 ctrl_reg;
> +
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
> +}
> +
> +/**
> + * xe_sysctrl_send_command - Send command to System Controller via mailbox
> + * @xe: XE device instance
> + * @cmd: Pointer to xe_sysctrl_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sysctrl_send_command(struct xe_device *xe,

this should take *sc instead

> +			    struct xe_sysctrl_mailbox_command *cmd,
> +			    size_t *rdata_len)
> +{
> +	struct xe_sysctrl *sc;
> +	u8 group_id, command_code;
> +	u8 *mbox_cmd = NULL;
> +	size_t cmd_size = 0;
> +	int ret = 0;
> +
> +	if (!xe) {
> +		pr_err("sysctrl: Invalid device handle\n");
> +		return -EINVAL;
> +	}

drop it, as this should never happen

> +
> +	if (!xe->info.has_sysctrl)
> +		return -ENODEV;

just assert ? we shouldn't call this function if there is no SC

> +
> +	sc = &xe->sc;
> +
> +	if (!cmd) {
> +		xe_err(xe, "sysctrl: Invalid command buffer\n");
> +		return -EINVAL;
> +	}

this again looks like our programming error, and we don't check for NULL if parameter is mandatory

> +
> +	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> +	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> +
> +	if (!cmd->data_in && cmd->data_in_len) {
> +		xe_err(xe, "sysctrl: Invalid input parameters\n");
> +		return -EINVAL;
> +	}

use xe_assert instead

> +
> +	if (!cmd->data_out && cmd->data_out_len) {
> +		xe_err(xe, "sysctrl: Invalid output parameters\n");
> +		return -EINVAL;
> +	}

ditto

> +
> +	might_sleep();
> +
> +	ret = xe_sysctrl_mailbox_prepare_command(xe, group_id, command_code,
> +						 cmd->data_in, cmd->data_in_len,
> +						 &mbox_cmd, &cmd_size);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);

to report errors we try to use %pe format

> +		return ret;
> +	}
> +
> +	guard(xe_pm_runtime)(xe);
> +
> +	guard(mutex)(&sc->cmd_lock);
> +
> +	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
> +					      cmd->data_out, cmd->data_out_len, rdata_len,
> +					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
> +
> +	kfree(mbox_cmd);
> +
> +	return ret;
> +}

