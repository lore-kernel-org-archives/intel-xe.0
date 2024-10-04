Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BCCCFA758
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 10:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7510E25E;
	Fri,  4 Oct 2024 10:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIX5JfvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C66E10E25E
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728036420; x=1759572420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8+eyRh7WZA5WHu4yAQUjNhBIqYYwxiM/N7L1tBGUdJU=;
 b=nIX5JfvW0C3ONy13WNY61vQkdCFELZx0Kx0Q4CCNaPgP1sYlu3DyilcZ
 KhHqfxLGKReS8ymoBBKRnpjnG3T0UN45b+fnrs/BhgJo2kK7HDjqwOzug
 sYBPFactaTInnsUdCFtUbgEiIPY3ESpdFd8EpOO6sKgM7LpE0rqmy4V8h
 Du6QAQwZSCoACS6TadIEd+9U+U+Ds8q26yYhwNZYwMV9igvK8CmcIg1wR
 gk+xpRmcDZVjNieu5Xc1qXVbk5qdqghG+GNiqyq7QAe2BwLXONpfHboBm
 xOqijK0rTMjfJpUiNfuhZss40WTnmYKZylc5GwHMaLPB6dauSXSXheK73 g==;
X-CSE-ConnectionGUID: 4DhhTdEKR/qlhwInRjQXkA==
X-CSE-MsgGUID: ipoKgelzQRK//DNRQ53oPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37911522"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37911522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:06:59 -0700
X-CSE-ConnectionGUID: qqgTs5B6T0ukZL6ykvU0jg==
X-CSE-MsgGUID: tu5sjHypRN6Ra7SfEJqqhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="112124268"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 03:06:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 03:06:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 03:06:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 03:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckMUXN9M3SovxTcNi6SwC0ydNzL3MxNFstFsfFuPLgKUsZaMnZHT2aan4Gy3d0e69CxAzJoULzvZL4hhPF8bvNus9npuV0/MUTTRLb/VcjQoxCqwbZppn+adDzI4Y78rw+4Ul8tiQWYHVpAM9AZoDccIJTsma9/z9OjKyyJkx8yhdMsB0cvGjwUzgee+G4lFUI5qFRNsifrs0vpMi0sdw54F+3uQjjVNrSO+QzNFuY6lWFCcwJ9jDq+R1FFk0fLBFnvJa7Qkve6vPC5oplJMJCz4/j8lX5c6VLrRWD/75VnRhDxp8ujoYjHTXVbs2Ua1Ka6kvLQIpEHv2mgsO8Pr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meH6nBtBcxYHoTktbW0xEFvN2JXF/ZlXKOEHGGzAHkw=;
 b=sf4RXH/CA81qeit4oSZ6xO8c2/pnOmiQ+KFT+xFQT7DyHx5ABgJvT9TlKKT9KjK3ctvs++zaSJkwPOvzay/N/qKw5x+MmGa3WzNTTZ5MHxJZB+QWgrGXeBg84Rq0k4tPBVB8V7z3I5rv1J4pNVk1gVETJNzy9D0lbcNxrcDaeVPF+5PRdqaLW9ee/XWvwP+g4VKO6H6YnxDh6igBhYX+UZD5rzH3MekZ+Pwgv8vHri3x9bFybaPZR4M9Q+W/MUgs5Y0Wl24Blk1dcr4FeP2PPTGXKlhic3VxNZXspQbuReykHeOYEq+HALExdexrCv+d0VlOaYHcCjEN9ktvV3SHdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 10:06:57 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 10:06:56 +0000
Message-ID: <0f45ed91-488c-4dff-885f-e6355ef02c78@intel.com>
Date: Fri, 4 Oct 2024 15:36:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>,
 <vivi.rodrigo@intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
 <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
 <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
 <Zv1S++mT0UuQEFNZ@DUT025-TGLU.fm.intel.com>
 <ab52e413-3dc4-494c-b50c-5456c81502eb@intel.com>
 <Zv+QJ4HVR0pJbNsX@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Zv+QJ4HVR0pJbNsX@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d57698-c5cb-4303-a282-08dce45c475a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cURNcjJYV3FLVU1zM2g4ZWxyOWt0ZTN0NlZIM2svVmQ3REwyM1Bua21FMWJw?=
 =?utf-8?B?U080c2cxQm5hUkdzUlk5cERrZ2s0RnBjdjRaaDhDOURFeEQ4aGUrd3R2NXU0?=
 =?utf-8?B?cmFiQktTYzgvSVFQZWJCNFJEUEpqVWVMMWtEUStISThxaWlWOHN3YTVlRzIv?=
 =?utf-8?B?WVJmbmhXeUVxdmIyQU51eDFFYzEyOHM0bkROZFdhOWZkSWYvM05SQlZsUWVB?=
 =?utf-8?B?d09DS204cHU1Vlh5Ympzb0Nxd2JOb2FHUDJmUHl6M000RVlKQkpoRGVDZ2NF?=
 =?utf-8?B?dGxiQjhDYXo5R0xnY0Zrb2VzNUZSZ1lHWFdQbktWSXdhdVF0a3BPTTAyRU9l?=
 =?utf-8?B?cDd1TDRQM2RTZEVvT1R4THdabHA5eitnODloanNzb25jcUkvZ2dLS3V0TWZI?=
 =?utf-8?B?SUJ5c0oyTkJnYTlrZmpFWTEveDN3TitrelV1b09IVDFhbUVwSE1MajZPL2px?=
 =?utf-8?B?SnVlNDVZdEkrWWxnRlFhV1Z6bXo1VGZaZGNsWWJRakdWMzZhT2V0N3lVcUtr?=
 =?utf-8?B?MmhCYUVYWEU4VXRTNHJsN1d6NGIrakJqbngwNzlTV29CbEpCZ3NBNlFqZmox?=
 =?utf-8?B?YlNNTlJRNWU5dnFDOU1kMlZycnY2WmhEcFpqNGlNeCtKYVFaWkVoSmtXSHJy?=
 =?utf-8?B?bzJnMDRtRDExYnN2TkI1UTRyYWM3U3UvdVZiWHo3MUJWL0RZa2tBMk1FNVlH?=
 =?utf-8?B?TmdLTkxmKzE5N1JSSmFuelB5eG51OThFUXJoSGsyNyt3NzFtUE41SFFnMXJH?=
 =?utf-8?B?U2dnK1ladjYrU1ZrbGpaQWtHbEVkNWdpOFYrdHVyWVpxVWYyZ01sL09ZMnB4?=
 =?utf-8?B?M2FZZmlodHZyN3lBR3dlQWZxT0JmSXM0Tlp6MjBWdDkwN2pYUHVrTE5UYVdz?=
 =?utf-8?B?ajZpd2M2N212RGhGaDVzeGZ4ZHB3U0lablBZUDVqcllDejZTajhVOUptaU1Q?=
 =?utf-8?B?MmJIc1psWFk2Y3FaVXd3VitpRWlacU5iMkh5N25FMTkxVEo1b1h2eGhiQnhp?=
 =?utf-8?B?bk9kdityZ3IwS0hwdWM0d1QyN3ptSHpYTUdBU29vOGpySEo5OVJFc01XbjZQ?=
 =?utf-8?B?c0FpaHNnSHZUTXg4QmdXdUlicEtTMHJWMzQ5ZVdYWEs0QmtLM0NoR3BZOGl6?=
 =?utf-8?B?NmRhOGJpVW1xbjdEc2N1VnNja3FmTHpTb1hlVmRTbHdLemlmdE5SUEE2TlZP?=
 =?utf-8?B?aS9aeTMycXVlTzNIVzhCWm5nTitJR0FNSUo2Um9IQUd1SlpLb3F4NUszYmxl?=
 =?utf-8?B?cWlMdXVDY1Nxc3hmbHR2Q0VCL2F4R29rVG8wOGpCRjhwcHVHbG1tN3lDS1lu?=
 =?utf-8?B?SEJQWWU1bGgyVzF6MEpjZ2tNRlBjSzhXQ3NFVWszWUI5dmJCRlphY0ZrQUIx?=
 =?utf-8?B?dHRCWmpBVk5OaGkwM3lHTENxbUg2QW1GRERjcGhxUEJ1VitBUWZFc2RJaDRl?=
 =?utf-8?B?ckdqZ0FQWUZmTVV1TkRKNURobGViSjFIa0NNVmducm1sZ05LZ2E4d2hiNzd3?=
 =?utf-8?B?VmhSR1FqdnJ3WmdpbTF3UGFzZGR3VFJGVGxmV0RmSW04VEdyaWpRWlZwUE5r?=
 =?utf-8?B?TmtadjNlRFl5VVl4R3B3RHZxZy84elg5YStQbEVIUnVjL0F2N2d3YkF1M0oz?=
 =?utf-8?Q?f45PuD/Y+q1orj9jYzPvhmCTyPHlLAG+I+Awwq7YNhyY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?end4ZG4rZFZvMTJNNmdkZWthUFdJbjRBVkpCbkJ3ajlVQWM5bmxqZDVCTm5m?=
 =?utf-8?B?T1hZQk9oNFFIOG5YYko4MG1KMXZmMmhqYmFUQmRoanBoY01raUR5aTlzc05K?=
 =?utf-8?B?bkZ2RlBjQ1ZWT01vRkZJTGVuakpTWmRTNlY0eldGV3JOSmJoRlFKOXRZc09i?=
 =?utf-8?B?Zy9zTGhUcWdYRm5sR2ZJQWxNN3A1ZWNDOHdrR3NlN2ZxbjBOeG85TXJXMmdO?=
 =?utf-8?B?Q2MrTWY4QW0renJmZExFZ0IvUWZRUzU3aW9RVDI4WE5RejZhNGRjZ01LL2Z2?=
 =?utf-8?B?MmhGTFFXYlBDb3BCdzQ1a1FCL2FUeFU4eXdyaVVZSWpNUFJIby9QYTZOUUV6?=
 =?utf-8?B?cEFZUEhwV0dLdmQ2NXFRcjZ2N0xBWEFORWs1YiswbDBIbzlrUHRFNysvMUg5?=
 =?utf-8?B?OStLOW0vQk1DV0grOVV1Y2xzTjlCcTVTNEFMWGRGc3J1dEgvclNVVzNKaXNr?=
 =?utf-8?B?b3ZEdDJGdC8zTXBuR01IeVNISlRkVGM0R1Z6MTlSYWdwVTQ1a2IwdkZhQXdz?=
 =?utf-8?B?WUlRVElFaVZFVGxGcCt1TjFrWWJzbk1qY29yUFlWRDBRMzY2S2FhS3ZXaUtV?=
 =?utf-8?B?b3k0R0w1dlJZSmJQN3FnWE1QYVZ2Y2dRNG9uVkFLdkxvc0U1djBGRkR0dGs3?=
 =?utf-8?B?TVFQOVo2aW1GTEpIY0F6d2ZaZ0d3N1d6YTdING5DTktZKzczQkJEVEVpZTNP?=
 =?utf-8?B?Um4zRDhpNTZCYWt4cVE4UnBrSFJ4UzVRZGNuWS96Q0pER1VZdmtvUmlsN05Y?=
 =?utf-8?B?aFYvWUs5YkF3SGlSVVl1Umx1aThRWDBpdjNPWHZXUmljMEg1bVNPQTlQWEow?=
 =?utf-8?B?b0o5RVZYTVNHUUQ3OFc4dW1haVdibjVYZlgyYUt2ak96dDFIdlY2YVVyM1lw?=
 =?utf-8?B?dzEyTTlaY2ZMMkNnVkk2bDZKMVlhQm14MHp2QU1qU28xbDl2RjBsODlkMEFa?=
 =?utf-8?B?UUdWUHdia3BuckVqM21xSUpkazJaUFRsVS9jaXRkTVFYMUpVV0lrS25TMmdR?=
 =?utf-8?B?RHZ5ZGV4eVA1MXRKUVAzOW1CcnB1VklvTEVHOTRYRTEvSEVDbHNsZnQyc0RS?=
 =?utf-8?B?RDRWTkR3RkllQ1hVM3RCY2NuRkJFY3JoMEtQaHRoelAzdHBJUFNlL3pHVDhu?=
 =?utf-8?B?SWV5NTdjSGZxL1BzcDdyQnh1K3VYbWhYb3IzQ0dzeDJldWxBTkM3TlBHbnZ6?=
 =?utf-8?B?UHgrUzc5ZzJqb29JRmZmZ1YvMlFwSjZkSzU4ei9WSVpyMnBMUWdOdmVIUEFI?=
 =?utf-8?B?azZqeHM0OVY2aVcrQUxQOUdrTUxDT1dCSmFOVzFyT2pLYTdnelBvNjh3RjZq?=
 =?utf-8?B?VFZ2dUphZncwSVFOdEoyRGxGV3duanA1ci9qNC9kekNPZEJsSHpCb05kNU53?=
 =?utf-8?B?Z011OXFUdXR5WUNwbWlRenRWVkN0OGRCZVZEWlpUN0V6dVFFa0dQV2FEWGR0?=
 =?utf-8?B?elo1NmNwWi83UUIwOXo1eUFSMUJsOUF1M2hZd0ZPQW5sME5yNU91TXFyNlpw?=
 =?utf-8?B?YmNHMytyODcybzRjMDAzNkYvUm5DTWpBNUY4S1pqZ2RQcG14dUY0NnVpSm1Q?=
 =?utf-8?B?blFzNUdxTCs2UEJpbkg3WDk4NkRZSzkxS3JMYThKMzA0UXQ3eC8xaVlDN0xM?=
 =?utf-8?B?UHhRN0dqZlBWNHBHOHlSTVF4ZiswS2RERC83MFQyeWlhUVNUdTdkcHVjaWpo?=
 =?utf-8?B?M2lROEFYYW5PZ0lOWlh5NHBEUWoxOGU0WE5VeEhsMitFY0lodU5kL0YvbXp6?=
 =?utf-8?B?TEYvUDYzV0I1Y3F3TWYrY2M1RXNiczBEL0JPbU5zaGh3Z1hHTkFSU1h1Q2kz?=
 =?utf-8?B?WG1NRHh4a3ltQVFpZ25CTDk0RHdWY2t5QXhkZDN1eHN5SjFqUDFXZ3g4MHpH?=
 =?utf-8?B?S0R4bkJQVlRrZThWQ2tUUmpsV1hzNk82Ull1R3pxVUVHaFp2OXRSWDdFNkU2?=
 =?utf-8?B?c0lJYmU0OVdBd1JFQ2JvUUprdVgrYVhkK0xJK0pGZEd2c3FDZW4ySjd5Q3VT?=
 =?utf-8?B?cmNReGJMdGhkdnV1ZHhESENkRTAyTi9Eck54TjZzdWZLWllTbGhyOGN6QnVh?=
 =?utf-8?B?TjRMRWU4b293dXk0cEluT3E2a3FmRTVtT1JqeUFleFRINENqS1U2WjR1eG5v?=
 =?utf-8?B?UmhsUHFKWE0rWFZuSjlTWE5MK25sOFM5YkZZV0lDQWtIaTlvUURwbC9jajJX?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d57698-c5cb-4303-a282-08dce45c475a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 10:06:56.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN4crhwblJe0I1L0vgvPkA1ArHoGqpn6at5BXTE8pUd2EMQhSGwNIqOU+8AnJ5xBbrXbOHW8GH+MMXGRidzAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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



On 04-10-2024 12:20, Matthew Brost wrote:
> On Thu, Oct 03, 2024 at 03:24:12PM +0530, Nilawar, Badal wrote:
>>
>>
>> On 02-10-2024 19:34, Matthew Brost wrote:
>>> On Tue, Oct 01, 2024 at 01:41:15PM +0530, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 28-09-2024 02:57, Matthew Brost wrote:
>>>>> On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
>>>>>> It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
>>>>>> queued, but it didn't get opportunity to execute and timeout occurred.
>>>>>> To address this the g2h_worker is being flushed.
>>>>>>
>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
>>>>>>     1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>> index 4b95f75b1546..4a5d7f85d1a0 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>> @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>>>>     	}
>>>>>>     	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * It is observed that for above GuC CT request G2H IRQ triggered
>>>>>
>>>>> Where is this observed. 1 second is a long to wait for a worker...
>>>>
>>>> Please see this log.
>>>>
>>>
>>> Logs are good but explaining the test case is also helpful so I don't
>>> have reverse engineer things. Also having platform information would be
>>> helpful too. So what is the test case here and what platform?
>>
>> Sorry, my bad, I should have added issue id in commit message.
>> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620.
>>
>> This issue is reported on LNL for xe_gt_freq@freq_reset_multiple test and
>> xe_pm@* tests during resume flow.
>>
>>>> [  176.602482] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
>>>> GuC PC status query
>>>> [  176.603019] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>>>> GT[0]
>>>> [  176.603449] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
>>>> running GT[0]
>>>> [  176.604379] xe 0000:00:02.0: [drm:xe_guc_pc_get_max_freq [xe]] GT0: GT[0]
>>>> GuC PC status query
>>>> [  176.605464] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>>>> GT[0]
>>>> [  176.605821] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
>>>> running GT[0]
>>>> [  176.716699] xe 0000:00:02.0: [drm] GT0: trying reset
>>>
>>> This looks we are doing a GT reset and this is causing problems. This
>>> patch is likely papering over an issue with our GT flows. So this patch
>>> doesn't seem correct to me. Let's try to figure what is going wrong in
>>> the reset flow.
>>
>> This is seen for slpc query after "reset done" as well.
>>
>>>> [  176.716718] xe 0000:00:02.0: [drm] GT0: GuC PC status query    //GuC PC
>>>> check request
>>>> [  176.717648] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>>>> GT[0]  // IRQ
>>>> [  177.728637] xe 0000:00:02.0: [drm] *ERROR* GT0: Timed out wait for G2H,
>>>> fence 1311, action 3003  //Timeout
>>>> [  177.737637] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task state
>>>> failed: -ETIME
>>>> [  177.745644] xe 0000:00:02.0: [drm] GT0: reset queued
>>>
>>> Here this is almost 1 second after 'trying reset' which I'm unsure how
>>> that could happen looking at the source code upstream.
>>> 'xe_uc_reset_prepare' is called between 'trying reset' and 'reset
>>> queued' but that doesn't wait anywhere rather resolves to the below
>>> function:
>>>
>>> 1769 int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>> 1770 {
>>> 1771         int ret;
>>> 1772
>>> 1773         /*
>>> 1774          * Using an atomic here rather than submission_state.lock as this
>>> 1775          * function can be called while holding the CT lock (engine reset
>>> 1776          * failure). submission_state.lock needs the CT lock to resubmit jobs.
>>> 1777          * Atomic is not ideal, but it works to prevent against concurrent reset
>>> 1778          * and releasing any TDRs waiting on guc->submission_state.stopped.
>>> 1779          */
>>> 1780         ret = atomic_fetch_or(1, &guc->submission_state.stopped);
>>> 1781         smp_wmb();
>>> 1782         wake_up_all(&guc->ct.wq);
>>> 1783
>>> 1784         return ret;
>>> 1785 }
>>
>> And CT is not disabled yet, so SLPC query will go through.
>>
> 
> I agree CT should not be disabled at this point.
> 
>>>
>>> If this log from an internal repo or something? This looks like some
>>> sort of circular dependency where a GT reset starts and the G2H handler
>>> doesn't get queued because the CT channel is disabled, the G2H times
>>> out, and reset stalls waiting for the timeout.
>>
>> This log is captured on LNL, with debug prints added, by running
>> xe_gt_freq@freq_reset_multiple.
>>
>> If CT channel is disabled then we will not see "G2H fence (1311) not
>> found!".
>>
>> During xe pm resume flow this is seen during guc_pc_start->pc_init_freqs().
>>
> 
> Ok, was spitballing ideas - if this is upstream then the CT should be
> alive but somehow it appears the worker to process CT is getting
> staled.
> 
> Also it very suspect the time gap between 'trying reset' and 'reset
> queued'.
> 
> This patch doesn't look like the solution. Can you look into hints I've
> given here?

Ok, I will look into it.

Badal

> 
> Matt
>   
>>
>>>
>>>> [  177.849081] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: GT[0]
>>>> GuC PC status query
>>>> [  177.849659] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H IRQ
>>>> GT[0]
>>>> [  178.632672] xe 0000:00:02.0: [drm] GT0: reset started
>>>> [  178.632639] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work
>>>> running GT[0] // Worker ran
>>>> [  178.632897] xe 0000:00:02.0: [drm] GT0: G2H fence (1311) not found!
>>>>
>>>>>
>>>>>> +	 * and g2h_worker queued, but it didn't get opportunity to execute
>>>>>> +	 * and timeout occurred. To address the g2h_worker is being flushed.
>>>>>> +	 */
>>>>>> +	if (!ret) {
>>>>>> +		flush_work(&ct->g2h_worker);
>>>>>> +		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>>>>
>>>>> If this is needed I wouldn't wait 1 second, if the flush worked
>>>>> 'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?
>>>>
>>>> In config HZ is set to 250, which is 4 ms I think.
>>>>
>>>
>>> HZ should always be one second [1].
>>>
>>> [1] https://www.oreilly.com/library/view/linux-device-drivers/9781785280009/4041820a-bbe4-4502-8ef9-d1913e133332.xhtml#:~:text=In%20other%20words%2C%20HZ%20represents,incremented%20HZ%20times%20every%20second.
>>>
>>>> CONFIG_HZ_250=y
>>>> # CONFIG_HZ_300 is not set
>>>> # CONFIG_HZ_1000 is not set
>>>> CONFIG_HZ=250
>>>>
>>>
>>> I'm little confused how this Kconfig works [2] but I don't think
>>> actually changes the time of HZ rather it changes how many jiffies are
>>> in one second.
>>>
>>> [2] https://lwn.net/Articles/56378/
>>
>> Oh ok, Thanks for clarification.
>>
>> Regards,
>> Badal
>>
>>>
>>> Matt
>>>
>>>> Regards,
>>>> Badal
>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>> +	}
>>>>>> +
>>>>>>     	if (!ret) {
>>>>>>     		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>>>>>>     			  g2h_fence.seqno, action[0]);
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>
>>

