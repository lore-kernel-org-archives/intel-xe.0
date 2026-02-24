Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DCEF3C9BE
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 16:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B21C10E5E1;
	Tue, 24 Feb 2026 16:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOJKqYtz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E6410E5E1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771951023; x=1803487023;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u2d2fjjY7F+9UrG1jbrIaOks8yn6fLKWyIdjo622QcI=;
 b=BOJKqYtzeu+9yg/HEc8dNbYcaZHgGA2V5XV1I5olpvMZq6EwEH10lu30
 FXwSsacNvEAxPkr2vC0HtJHOtJbrVJVsaxoaJLaggl+ni3olrgDdB5Jwg
 uD2m12YLB3IvVwr2J1WZdI+HqskhLXWjej4358W4g8DDRTQ8+sbsPIBBn
 tRFSXPCZjDhtsmqvfM0xhhRWz4cbA6f0Phw4Ej3NALrIfUyWtncoBGQ7u
 i2xg/CfeqXLLZBwowLxkWF5VP3Pfl8R6Rv07Sl3tk7pl0bsm3A6+2fOAl
 0A4u1lQghV4pbz83vgY6l9b3b1IJKgSN0EDUWPmLZv3RLOc2pFL3ab+HU g==;
X-CSE-ConnectionGUID: WS+y/E/dS5+ja02plNYM+A==
X-CSE-MsgGUID: hqtysT6YSWemh1OakfINug==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73040258"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73040258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:37:03 -0800
X-CSE-ConnectionGUID: XEeR1FA5T/id96gBonb7CA==
X-CSE-MsgGUID: QdmTcETWQ3W9TYUnxAnD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220555972"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:37:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 08:37:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 08:37:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 08:37:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+K99ZwuCwWfOntGi5uOQCiFKcxwhsxysssaUtydC8kGdnKJi2i8UaGwWh4c4ONmVXQgZ4iZ/y6Dq0JYSPI5Tk2mkSgGyntc0LOrIFfipd1toQ4ehKpZTHoWg2l/wP+7e8z6DBuTf+icJ18kIFZbfjtiQRRXjgN5CiF9i89IDOgguVsNcw//a6WsHCBgm+qDNbPhdaxLCn/vAu3JieKo6dJhaqpDDwEBp7A5JT2Kngb6ectRBRyTNjng6JBv7ZZaHKwKVwa+W6IPS8N6tlXGpPw+aFT8YA52zKR2wCWS5aZSNJlu3qVhBgBZcTBeIm6MFzWjgfFvjuQP3tjeMH0m1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K4E0omZTclau2qDpAdrMirqRlCWqRSklbSZbeCLczo=;
 b=tgvl16ti7/xwdzVt7D7Osp5YlnFwGe2AFGP0uKbO2AlV1yduLwN1HYvvtJRjX751BxHjc4AKH4ONNIW2EK6c44fPxuWR/3X7WQ8V4AiGYYjpiJd9s4vKrh3pDkXZw+pBtl/FSIUNnODBaq4r72TNjnj1s33cTtP8v2kOQKqIl4YsP+UhmuokHZYJFiG5C9ky66vH6T/hlqnamYOYebZbu7PJmYK3jsyp2pI20asAH7EwsI59AgCITjd9MWOIjIe8Sfp7rnSknOTC40heUMU4CUKyZjxZKd1UwIeMuETGY2AtXKu7OCG6dXnaDe/tfNRbRjwxvzK+R8IzVjX/UN1QPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 16:36:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:36:57 +0000
Date: Tue, 24 Feb 2026 08:36:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Message-ID: <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
 <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
X-ClientProxiedBy: MW4PR04CA0281.namprd04.prod.outlook.com
 (2603:10b6:303:89::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 509634eb-f8b2-4969-8f3e-08de73c2ecf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anhDa0VLRnBWKzlBbm1pUUhIQ05TOU5HWklDZTNsejFOQ3J5Tkt3M2J6eldR?=
 =?utf-8?B?RGtNV2UrNVFkcGR6L3pucUNYTm5TTUQvN1A3SGxVcGd4Q0tyMUxRZS9QZ2xo?=
 =?utf-8?B?NFRIQWN3cHNEZHFmNU9mcFdXVFI0UGVVSU44eUs1Z2VFQURvNkpYZHpvRlIy?=
 =?utf-8?B?NG9sNXcrTjFXUE5tZS8zb09RWWpJV1NQUXVYNXErUnNzMnpUU3UzS2l6NFl5?=
 =?utf-8?B?SFdEMG9aZU1CZnJobmJoZHdKUkVEak15bGZ1RnhuSTRDdG9NUysyMGRreUtt?=
 =?utf-8?B?NlRNN0dVTFZ0MERMVXMyZmJLbm16c0Rhakx5L0NnUzJkbjlUQVh5NmtERThN?=
 =?utf-8?B?bWJ1cHEvYkY4MmcxV252akhlSTNnTDNodnpMcnd0ZGtVNkpvWUZWc3VZU2Z5?=
 =?utf-8?B?TEl3SlNnR2dMbmFnODdrUjlHdFZvRDZaK1NIeVJkSXdTblhnbnA1Sm9WMzRF?=
 =?utf-8?B?YXlYWFFSUVFGUGdqYTNPK3JKRm5PaDVmZDdTcDdnVXFjYW4vS04xTkxqTlVm?=
 =?utf-8?B?QUI2VVlJR24yTVRRaHFya3RWUDh2UWhtb0lobGVjTStENG1Sa2F0dmdzMElD?=
 =?utf-8?B?b3REd0tpUmU4K2U1QVpDNmdSQjkzeVZWMkx3dDBaRmlpYmI4dGJFSytrUWQv?=
 =?utf-8?B?V3NGN0l0QnBMeTB3MHhuZU5zcmNzbXNFRS9INlFHQjNyL1Z6Rkd2eXRhMFhv?=
 =?utf-8?B?dGpCWGVQbWs2YmVadDkxcEpWZFBZa0FBWjFmYkxVZ2d6MXdRdUs4bVQvdnZz?=
 =?utf-8?B?MXZMZjB6OTRhUXY5NWRCSlJrZnVPMTduTmx3WHdQSS95UkQzT0JucDBCbDJU?=
 =?utf-8?B?Q0psb3dvZHh3cFUwUnYvSTZVQ2xaNFJQbWNsMGVjM1FZMmhqbHpnYXpXeENa?=
 =?utf-8?B?T1hlSVEvNitFRTViQVhZTzNKbmtBSTZOYWhFUUhucG8xR1B1K200U2lEa3A5?=
 =?utf-8?B?TVp0SlBuWlFubnBlaDhPL0FuVnp6N1RmZktxWWhFeVVHOVNoODNhYVdNOERw?=
 =?utf-8?B?YW9idE8xczJGZ2cwUnF4UjFmUkRNV29jNk1qM2FSZmFueDR3RFo4YXBmblAz?=
 =?utf-8?B?K2hWSWNwYldrUGtqS3YwQUFMeHdrenhtMXcwbVN4RmxmM0dKS0w0MndjZkw2?=
 =?utf-8?B?clhURzRvdkN0OTF3TTg1M2I0cWYvazZyem90QmhlYXNrYWliVWMvWUloQ1lT?=
 =?utf-8?B?eVRMKzdNS3U0UE1JMVpMZjNnOVJKV2RpNGFORm9vT1ZlM0hkM1lnd2EyTzJh?=
 =?utf-8?B?alNUN0phd3FZV0ZLNGxHSVBmUktoS2N6cUxLbnpTN0c4Y1VNUVlJRWVjKzBN?=
 =?utf-8?B?UjhHa0xGZ2dpVm5lSU9hUitkNTV5TXVZNmNRQ3NiSEFybE1XUTgzSEh3aHRB?=
 =?utf-8?B?ZnY5VnF5N2VGNVM1bG1TYStuWFdFdjBKc0ZlbDBmUzJJWWZ3TmJmcXg1RTEv?=
 =?utf-8?B?OS9LdTRCeE5kS0hpWGJ2bGhSUzRLYVkxMm5VenFKNXBTV3ZVaVJVeWtNcCtz?=
 =?utf-8?B?WVg2ZVJscU5WMXNvUGdjVlZCSHFhS1d0Z05yV3pLUU5VdVhtYlAwK2xndnNv?=
 =?utf-8?B?V3pvemFBTlkzZjI1eXUzb1N2TmdGMk1KdmRJY3ZsN1p4S2FiY0JHenlaOWRK?=
 =?utf-8?B?SnNHK3R1U1VqTHdVN05xMm1zNXZEWkVybXUyYmJPSUlnK1VoT25jckhoU0Zi?=
 =?utf-8?B?SEYwYTJ0aThDc25KeE5pMC95V3pGU2tFMXp4WU9xU2VyQ0RlY21uZ1hld28w?=
 =?utf-8?B?TjZYd2ZJZVdvdWwxY0NheUx5MEhHcXMxWFdlbW9QQnFiQkR3NWRTQTZYc3c5?=
 =?utf-8?B?L1FPWkp6Yy9aRnIxa2pLandRTGNTbHI3TG1yVWRhM2VpeE1FUTgzSWhxZWZN?=
 =?utf-8?B?T2xwWXBmWmcwTzRrN0RZMDBEYTU4Ni9tN1BEK2tlRm5QajlyQm5BNU0wS3N1?=
 =?utf-8?B?SUdqTXJPTjBDVjNKeEN2cE42Ni9rbGgxTHkzRlMvMDJJd2oxbGRuM1lXaFRM?=
 =?utf-8?B?SnZ4YXhOQ3JpanYySGJUZmZvbEtzdVVYT0xnU3V3ekxrNWg0c1dINWxVb3pz?=
 =?utf-8?Q?RgV2Cj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejcxUUhTRDZCNktldlJjWUZRY1poSE1YOWRNQW9BY2tuZ2tKTzBEMUh6enBS?=
 =?utf-8?B?TDk2dUh4QTBVa1F3eTlzR09tLzFBVExTckJEZTJVMGlMVUxiNmF1VFNRYmo4?=
 =?utf-8?B?czlQSzY0S2tONHNYOGpaR21WVjNub2VDZHFUTDNVU2EvUTBEdU5HSDJnMzRk?=
 =?utf-8?B?ZHFSUE4zNHFJbmlqU3FWaWRnMms4a0pvajlUcVplbDhmVFVnaC8zSzEvZ1A2?=
 =?utf-8?B?Uk1PRHB1Tmc2c2dtSkxZMzF5TDdSWUd0eHhaelN6MGNEbTZDNXhVMERMeTFW?=
 =?utf-8?B?dmZUWVFLemFpT1BWUDc2YWFjc0FzeFVIcjQwU25yUnl1aytxRW1IcmdYVnhS?=
 =?utf-8?B?d2R4MEptR2hkbVk5MDFzdEdnTFlGczBzcDhkcWpmYjAweWxPSjBtOFpzblZY?=
 =?utf-8?B?NUtrWkU1akplZ21KYitBZmxPUFpKSzd6cjdKUXBhOXVldXRYNzFLRWVicG9n?=
 =?utf-8?B?ek05dkxXQ1k2RUg1bFROUUJ1dndoanc3TGttNlpLTW9wZ3hLd2FmS1h4K2sz?=
 =?utf-8?B?dzFGR0xCcHQ0eFE1N3gvOGd0TUlsd2FDYU5Ud0FjVXU1VXdQWjgzT0NJSXRH?=
 =?utf-8?B?ZGxPd3J5b2lnQ0hEWXFnejdCZzlweFh5VGNaRDhmckVsMjZ3VkZtMHJHWlQ3?=
 =?utf-8?B?T2FMMlhTTVpzclUySTNlSFlMMWhXL2RaMThqamIzV0tCK051Ry8xc291d2pF?=
 =?utf-8?B?WDB4Y0Vsa09nUDNPU2ZyeDhoN3lVbDg1b1Z2MTNLdU1xeWhiSXlJZkxUNTNH?=
 =?utf-8?B?ZWNvQ1NSV0kyZkpYZDYyK3hqKzhtSTNmSWxOVnk2Z2tnZ3p5SUxmd2U5bWRZ?=
 =?utf-8?B?SVR4emdVOC8zOTlNZytWenZFSmR3VzF2RGZ1VWlKcXpWQnlhQ3BETTFOZlh3?=
 =?utf-8?B?T0xsalB0blZRSVFTYko2REg4Nm9va2o0VVZJSmw2Sll5UldCZ0hxUFk5RWg2?=
 =?utf-8?B?OXpyVE9TeDcvS09ScjlEd2FBelByYktWbno3WC8zYnVNRWduMVhMRWl6VURM?=
 =?utf-8?B?bWZ1dWpYREJhQjhlYW4zREFaRjdzTklaMzFrbmk0R0tTNkpmTFI5aW1BUzhr?=
 =?utf-8?B?NVVWaEJRZHBmekVrNTJhdDJBQmVSa0QxWWFWcjlnSHhSWUdTOHI3S1ZWSXdD?=
 =?utf-8?B?bldkVTk1aFZqSkhkbTlDaEovMnlzeUxWc0J3c3FKMmkyemtpNzFtcEszS0ZB?=
 =?utf-8?B?Nzl6UjQ3NjhQNzBCNnlob3Z6VVFEZkIvQTBCcytBVzZLNlZFZG1VeTkvZnU0?=
 =?utf-8?B?V2ZvY200YlNpTmpOSWUrcHhUektyaXlZaVV2SVBYSkxOK0g3MlUxZ3JqNVND?=
 =?utf-8?B?L3FpOWFabDEwWkZsZDRpMVVKWG5sWnVHYlU5V3JobTZsTTJ0STN6TEhtcVVw?=
 =?utf-8?B?RHFXd3Y0cm14MnZKR1M3SnpETVNia2xGOUxkMlMzcEZGUjBRNTc0ajN5Rkdk?=
 =?utf-8?B?WndlNXY5QmJMcGZ4L3YwTGNlZUk5b1YzYm5leDFscFZjMUJXVTljK2ZlQkU1?=
 =?utf-8?B?THJ2TEgxa0N5WnRKNjdaVjZSbXJ2c09pTG1hODNmSlUxNm9KOEJpUUQ3bGV2?=
 =?utf-8?B?aWVkK3R5VnNmR2FCZGN3SWsvYzVJK2h3b1pQNlg4NVVla09kNVBmZ3NaMDhR?=
 =?utf-8?B?eTVVbXpBUEJTUklEUys1K3VWZW41a3U0bEl2dWlsc05OeVZoZHBnTTFLdDFo?=
 =?utf-8?B?TFc4cGtuTWQ1ZkpCc0dCQUhMRGkxeERiUDFIbzdvTkNYL2YxdSt3d2xHUDky?=
 =?utf-8?B?VHFhZXlYcmIvNXB1YmhLeDY0eDM0Z0tyZmZ6bkxQWkVCMWtNbzR2U0xSY09z?=
 =?utf-8?B?ckJmaHVBM0hPVGNjckRNWUJrbFpPQkU2eHI4NlFHbmVSbjJDODRRa1IwSlRn?=
 =?utf-8?B?UkpJb1ZsZlNnWVJCWkUyaWZlU0xJUUtjNW5TSy9LOWVMcDZRZlVJY0t1elVn?=
 =?utf-8?B?cFBuUm8zZHFRSVVIU1c0VGw2Nk9YYm9ENW1sUlNKZzBLK29zbmJXNUdZekg0?=
 =?utf-8?B?R0hMMS9FT3I5cXZWWStNNDE4aGJPcmZWV1orZFRSd0dXVXJYNVM1bjVUdVlj?=
 =?utf-8?B?ZEI0REJ2ZnhrRlZlTWVqMjg2c3dYbXUwSkJ1WnluUGVKU1lIcGRIeEVidE4w?=
 =?utf-8?B?UnN6ZXhVWFp1SlZUa0Z6THdiNUNTdHhGYlhhcnVWYlMyaDYyWGVuTU0xbWhK?=
 =?utf-8?B?K3BpZW5zSkpCUndUUnlNeW5MU0laTFNkUTdoT1pUK25UbzJYSmx3MVdKUEUz?=
 =?utf-8?B?L0hPYWVyemNSOExZR2lIdUlINllFbEM0WUVCZzVabDJWMVZ2V2Iyc0toTFZw?=
 =?utf-8?B?V1RRdnpSbXlMaUdPYm1LMWJpUWJXVFV4bTZoSjZJVTEwc0t0c01BV3FmK1ov?=
 =?utf-8?Q?KOQHBnOUf449OEDs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 509634eb-f8b2-4969-8f3e-08de73c2ecf6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:36:57.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2uJDy2GM3VSsL4rOSy+lbWrnBXjbnoB+DgvSursvP/lf51EwOJyyfN+wsxb/w7V1F119wfQ8Io6V4fmRdxduw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

On Tue, Feb 24, 2026 at 08:37:44PM +0530, Yadav, Arvind wrote:
> 
> On 24-02-2026 18:18, Thomas Hellström wrote:
> > On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
> > > Track purgeable state per-VMA instead of using a coarse shared
> > > BO check. This prevents purging shared BOs until all VMAs across
> > > all VMs are marked DONTNEED.
> > > 
> > > Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
> > > a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
> > > handle state transitions when VMAs are destroyed - if all
> > > remaining VMAs are DONTNEED the BO can become purgeable, or if
> > > no VMAs remain it transitions to WILLNEED.
> > > 
> > > The per-VMA purgeable_state field stores the madvise hint for
> > > each mapping. Shared BOs can only be purged when all VMAs
> > > unanimously indicate DONTNEED.
> > > 
> > > One thing to note: when the last VMA goes away, we default back to
> > > WILLNEED. DONTNEED is a per-mapping hint, and without any mappings
> > > there is no remaining madvise state to justify purging. This prevents
> > > BOs from becoming purgeable solely due to being temporarily unmapped.
> > > 
> > > v3:
> > >    - This addresses Thomas Hellström's feedback: "loop over all vmas
> > >      attached to the bo and check that they all say WONTNEED. This
> > > will
> > >      also need a check at VMA unbinding"
> > > 
> > > v4:
> > >    - @madv_purgeable atomic_t → u32 change across all relevant
> > >      patches (Matt)
> > > 
> > > v5:
> > >    - Call xe_bo_recheck_purgeable_on_vma_unbind() from
> > > xe_vma_destroy()
> > >      right after drm_gpuva_unlink() where we already hold the BO lock,
> > >      drop the trylock-based late destroy path (Matt)
> > >    - Move purgeable_state into xe_vma_mem_attr with the other madvise
> > >      attributes (Matt)
> > >    - Drop READ_ONCE since the BO lock already protects us (Matt)
> > >    - Keep returning false when there are no VMAs - otherwise we'd mark
> > >      BOs purgeable without any user hint (Matt)
> > >    - Use xe_bo_set_purgeable_state() instead of direct
> > > initialization(Matt)
> > >    - use xe_assert instead of drm_war (Thomas)
> > Typo.
> 
> 
> Noted,
> 
> > 
> > There were also a couple of review issues in my reply here:
> > 
> > https://patchwork.freedesktop.org/patch/699451/?series=156651&rev=5
> > 
> > that were never addressed or at least commented upon.
> > 
> > The comment there on retaining purgeable state after the last vma is
> > unmapped could be discussed, though.
> > 
> > Let's say we unmap a vma marking a bo purgeable. It then becomes either
> > purged or non-purgeable.
> > 
> > Then an app tries to access it either using a new vma or CPU map. Then
> > it will typically succeed, or might occasionally fail if the bo
> > happened to be purged in between.
> > 
> > How do we handle new vma map requests and cpu-faults to a bo in
> > purgeable state? Do we block those?
> 
> 
> @Thomas,
> 
> The implementation already blocks new access to purged BOs:
>  1. New VMA mappings (Patch 0005): vma_lock_and_validate() rejects MAP
> operations to purged BOs with -EINVAL via the check_purged flag.
>  2. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and xe_gem_mmap_offset()
> return errors (-EFAULT / VM_FAULT_SIGBUS) when accessing purged BOs.
>  3 . "Once purged, always purged": Even when the last VMA is unmapped,
> xe_bo_recompute_purgeable_state() preserves the PURGED state - it never
> transitions back to WILLNEED or DONTNEED (see early return at the top of the
> function).
> 
> The only way forward for the application is to destroy the purged BO and
> create a new one.
> 
> Regarding the 'no VMAs → WILLNEED' logic: this only applies to non-purged
> BOs that happen to be temporarily unmapped. Purged BOs remain permanently
> invalid.

So I think xe_bo_all_vmas_dontneed() isn't 100% correct...

I think should return an enum...

enum xe_bo_vmas_purge_state {	/* Maybe a better name? */
	XE_BO_VMAS_STATE_DONTNEED = 0,
	XE_BO_VMAS_STATE_WILLNEED = 1,
	XE_BO_VMAS_STATE_NO_VMAS = 2,
};


Then in xe_bo_recompute_purgeable_state() something like this:

void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
{
	enum xe_bo_vma_purge_state state;

	if (!bo)
		return;

	xe_bo_assert_held(bo);

	/*
	 * Once purged, always purged. Cannot transition back to WILLNEED.
	 * This matches i915 semantics where purged BOs are permanently invalid.
	 */
	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
		return;

	state = xe_bo_all_vmas_dontneed(bo);
	if (state == XE_BO_VMAS_STATE_DONTNEED) {
		/* All VMAs are DONTNEED - mark BO purgeable */
		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
	} else if (state == XE_BO_VMAS_STATE_WILLNEED) {
		/* At least one VMA is WILLNEED - BO must not be purgeable */
		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
	}
}

I think would avoid the last unbind unintentionally flipping from
DONTNEED -> WILLNEED.

What do you both of you (Thomas, Arvind) think?

Matt

> 
> Thanks,
> Arvind
> > 
> > Thanks,
> > Thomas
> > 
> > 
> > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c        |  1 +
> > >   drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
> > >   drivers/gpu/drm/xe/xe_vm_madvise.c | 98
> > > ++++++++++++++++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
> > >   drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
> > >   5 files changed, 116 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index cda3bf7e2418..329c77aa5c20 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -318,6 +318,7 @@ static void xe_vma_set_default_attributes(struct
> > > xe_vma *vma)
> > >   		.preferred_loc.migration_policy =
> > > DRM_XE_MIGRATE_ALL_PAGES,
> > >   		.pat_index = vma->attr.default_pat_index,
> > >   		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> > > +		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
> > >   	};
> > >   	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 71cf3ce6c62b..e84b9e7cb5eb 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -39,6 +39,7 @@
> > >   #include "xe_tile.h"
> > >   #include "xe_tlb_inval.h"
> > >   #include "xe_trace_bo.h"
> > > +#include "xe_vm_madvise.h"
> > >   #include "xe_wa.h"
> > >   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > > @@ -1085,6 +1086,7 @@ static struct xe_vma *xe_vma_create(struct
> > > xe_vm *vm,
> > >   static void xe_vma_destroy_late(struct xe_vma *vma)
> > >   {
> > >   	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > >   	if (vma->ufence) {
> > >   		xe_sync_ufence_put(vma->ufence);
> > > @@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct xe_vma
> > > *vma)
> > >   	} else if (xe_vma_is_null(vma) ||
> > > xe_vma_is_cpu_addr_mirror(vma)) {
> > >   		xe_vm_put(vm);
> > >   	} else {
> > > -		xe_bo_put(xe_vma_bo(vma));
> > > +		xe_bo_put(bo);
> > >   	}
> > >   	xe_vma_free(vma);
> > > @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct dma_fence
> > > *fence,
> > >   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence
> > > *fence)
> > >   {
> > >   	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > >   	lockdep_assert_held_write(&vm->lock);
> > >   	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
> > > @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct xe_vma *vma,
> > > struct dma_fence *fence)
> > >   		xe_assert(vm->xe, vma->gpuva.flags &
> > > XE_VMA_DESTROYED);
> > >   		xe_userptr_destroy(to_userptr_vma(vma));
> > >   	} else if (!xe_vma_is_null(vma) &&
> > > !xe_vma_is_cpu_addr_mirror(vma)) {
> > > -		xe_bo_assert_held(xe_vma_bo(vma));
> > > +		xe_bo_assert_held(bo);
> > >   		drm_gpuva_unlink(&vma->gpuva);
> > > +		xe_bo_recompute_purgeable_state(bo);
> > >   	}
> > >   	xe_vm_assert_held(vm);
> > > @@ -2681,6 +2685,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > > *vm, struct drm_gpuva_ops *ops,
> > >   				.atomic_access =
> > > DRM_XE_ATOMIC_UNDEFINED,
> > >   				.default_pat_index = op-
> > > > map.pat_index,
> > >   				.pat_index = op->map.pat_index,
> > > +				.purgeable_state =
> > > XE_MADV_PURGEABLE_WILLNEED,
> > >   			};
> > >   			flags |= op->map.vma_flags &
> > > XE_VMA_CREATE_MASK;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > index d9cfba7bfe0b..c184426546a2 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > @@ -12,6 +12,7 @@
> > >   #include "xe_pat.h"
> > >   #include "xe_pt.h"
> > >   #include "xe_svm.h"
> > > +#include "xe_vm.h"
> > >   struct xe_vmas_in_madvise_range {
> > >   	u64 addr;
> > > @@ -183,6 +184,89 @@ static void madvise_pat_index(struct xe_device
> > > *xe, struct xe_vm *vm,
> > >   	}
> > >   }
> > > +/**
> > > + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked
> > > DONTNEED
> > > + * @bo: Buffer object
> > > + *
> > > + * Check all VMAs across all VMs to determine if BO can be purged.
> > > + * Shared BOs require unanimous DONTNEED state from all mappings.
> > > + *
> > > + * Caller must hold BO dma-resv lock.
> > > + *
> > > + * Return: true if all VMAs are DONTNEED, false otherwise
> > > + */
> > > +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> > > +{
> > > +	struct drm_gpuvm_bo *vm_bo;
> > > +	struct drm_gpuva *gpuva;
> > > +	struct drm_gem_object *obj = &bo->ttm.base;
> > > +	bool has_vmas = false;
> > > +
> > > +	xe_bo_assert_held(bo);
> > > +
> > > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > > +			struct xe_vma *vma = gpuva_to_vma(gpuva);
> > > +
> > > +			has_vmas = true;
> > > +
> > > +			/* Any non-DONTNEED VMA prevents purging */
> > > +			if (vma->attr.purgeable_state !=
> > > XE_MADV_PURGEABLE_DONTNEED)
> > > +				return false;
> > > +		}
> > > +	}
> > > +
> > > +	/*
> > > +	 * No VMAs => no mapping-level DONTNEED hint.
> > > +	 * Default to WILLNEED to avoid making BOs purgeable without
> > > +	 * explicit user intent.
> > > +	 */
> > > +	if (!has_vmas)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state
> > > from VMAs
> > > + * @bo: Buffer object
> > > + *
> > > + * Walk all VMAs to determine if BO should be purgeable or not.
> > > + * Shared BOs require unanimous DONTNEED state from all mappings.
> > > + *
> > > + * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM
> > > lists,
> > > + * VM lock must also be held (write) to prevent concurrent VMA
> > > modifications.
> > > + * This is satisfied at both call sites:
> > > + * - xe_vma_destroy(): holds vm->lock write
> > > + * - madvise_purgeable(): holds vm->lock write (from madvise ioctl
> > > path)
> > > + *
> > > + * Return: nothing
> > > + */
> > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> > > +{
> > > +	if (!bo)
> > > +		return;
> > > +
> > > +	xe_bo_assert_held(bo);
> > > +
> > > +	/*
> > > +	 * Once purged, always purged. Cannot transition back to
> > > WILLNEED.
> > > +	 * This matches i915 semantics where purged BOs are
> > > permanently invalid.
> > > +	 */
> > > +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> > > +		return;
> > > +
> > > +	if (xe_bo_all_vmas_dontneed(bo)) {
> > > +		/* All VMAs are DONTNEED - mark BO purgeable */
> > > +		if (bo->madv_purgeable !=
> > > XE_MADV_PURGEABLE_DONTNEED)
> > > +			xe_bo_set_purgeable_state(bo,
> > > XE_MADV_PURGEABLE_DONTNEED);
> > > +	} else {
> > > +		/* At least one VMA is WILLNEED - BO must not be
> > > purgeable */
> > > +		if (bo->madv_purgeable !=
> > > XE_MADV_PURGEABLE_WILLNEED)
> > > +			xe_bo_set_purgeable_state(bo,
> > > XE_MADV_PURGEABLE_WILLNEED);
> > > +	}
> > > +}
> > > +
> > >   /**
> > >    * madvise_purgeable - Handle purgeable buffer object advice
> > >    * @xe: XE device
> > > @@ -231,14 +315,20 @@ static void __maybe_unused
> > > madvise_purgeable(struct xe_device *xe,
> > >   		switch (op->purge_state_val.val) {
> > >   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > > -			xe_bo_set_purgeable_state(bo,
> > > XE_MADV_PURGEABLE_WILLNEED);
> > > +			vmas[i]->attr.purgeable_state =
> > > XE_MADV_PURGEABLE_WILLNEED;
> > > +
> > > +			/* Update BO purgeable state */
> > > +			xe_bo_recompute_purgeable_state(bo);
> > >   			break;
> > >   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > > -			xe_bo_set_purgeable_state(bo,
> > > XE_MADV_PURGEABLE_DONTNEED);
> > > +			vmas[i]->attr.purgeable_state =
> > > XE_MADV_PURGEABLE_DONTNEED;
> > > +
> > > +			/* Update BO purgeable state */
> > > +			xe_bo_recompute_purgeable_state(bo);
> > >   			break;
> > >   		default:
> > > -			drm_warn(&vm->xe->drm, "Invalid madvice
> > > value = %d\n",
> > > -				 op->purge_state_val.val);
> > > +			/* Should never hit - values validated in
> > > madvise_args_are_sane() */
> > > +			xe_assert(vm->xe, 0);
> > >   			return;
> > >   		}
> > >   	}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > index b0e1fc445f23..39acd2689ca0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > @@ -8,8 +8,11 @@
> > >   struct drm_device;
> > >   struct drm_file;
> > > +struct xe_bo;
> > >   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > >   			struct drm_file *file);
> > > +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 43203e90ee3e..fd563039e8f4 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
> > >   	 * same as default_pat_index unless overwritten by madvise.
> > >   	 */
> > >   	u16 pat_index;
> > > +
> > > +	/**
> > > +	 * @purgeable_state: Purgeable hint for this VMA mapping
> > > +	 *
> > > +	 * Per-VMA purgeable state from madvise. Valid states are
> > > WILLNEED (0)
> > > +	 * or DONTNEED (1). Shared BOs require all VMAs to be
> > > DONTNEED before
> > > +	 * the BO can be purged. PURGED state exists only at BO
> > > level.
> > > +	 *
> > > +	 * Protected by BO dma-resv lock. Set via
> > > DRM_IOCTL_XE_MADVISE.
> > > +	 */
> > > +	u32 purgeable_state;
> > >   };
> > >   struct xe_vma {
