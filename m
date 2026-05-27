Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E857CD6E44
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 22:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23D210EA45;
	Wed, 27 May 2026 22:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3isviDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7E10EA45
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779919248; x=1811455248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nAqfnCp3DdvUtAT7SGLDJYrdgr+qWfU2kc2ELGL1+34=;
 b=J3isviDedGjD90MKMABdg8Er1NDGoGDAdaeH+lto1GwvhLRiLNU6b+qM
 9i7WqFblE8jnDDypRI0heY7agDPFtjwFaz9WGod4qdZRvH2I1YFreYiWe
 26B8qUyOaonPwNQ8z1wnluXJtvZYmLj1qDYyopBeHWiRGOt8qF6PH6OdE
 /99V2Ln2AmF1S0XAzLE7ey4x/FgWI5kzy8hY2MrotWaFthcqXi1IOi7VS
 e1xbWxUKlHDyjA/TYLBs29KGdOTGXlpammXh49KKEdE38XkhJ4uG2/68w
 jVS3WfMWWrEM/D32xW/gPc2rmiY36rxzzlB9I41Dzf5thUYk33bJbD2sK A==;
X-CSE-ConnectionGUID: JlCoQlbSSb2EXOUsSZpHhw==
X-CSE-MsgGUID: RIOJ4UDLRyWRf8O+cbtfSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91334050"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91334050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:00:47 -0700
X-CSE-ConnectionGUID: Glqmhh2mS82gPDV4BS0VFw==
X-CSE-MsgGUID: wCz+1lmrQ1CTdpOv8vDdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="246647368"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:00:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 15:00:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 15:00:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 15:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oa52Qhu1TJgE8ip1xi9ROqGpS+He4UUapyHoVrV4wbf/9VXZ/SIfBaUc11bAQUK7fjmrA7/t1mdrm1N/EIEOVN7mhDG0kf+ysaEcU/+rhJfhWzulxfqwH/kH8+HaSzGknnXmg1mjXXRcdE1hJzI+vZacTODqwT+5R+C2s1XWHTOHFc50UptTefFp+EUTB4AKiUjekHKTa5yc1TDRcQ/dD39hHnCT7CxM4ZMlkSfuACFix1syq4vd2kobtoKqhnsJmGW72DKd3XZwnYt62Teiib8PszaBlVRe+JMjE2wmygRiQqMzxGxsoQU4CpOG5Cad+NWRA0Itx4AztaQD5/RnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNLrJ/aPRp+f7HcJoxhdsKA1YnHGMaG1PM47ogPGAk4=;
 b=R5AP78Uzqspp/eoMwjlt9dmEGcMbgs/KetBsEEkLI1Kkjt9MxDRu1KVzdzDemliwLS3s8fHjbgtaj+K9Dj75D9vN+Iavw8UcdX4Z1s4OL3L1yfVbX3JRmlH4/VWxnSbuZF79WqzF89qadTRi+tolQne7jGo0mLMU8ueE0Nk0/1yr8UmXl/zE0WrClTsAh/7OAKL/AwU3jgyHqkSjaCigTi7+5g1BNdqG7l3x5hR0sI15gDGlOOE666YaYUp8nDHvpNXn9vVtGEoljqtWQUUViqGpF33rkBvabsg46i2uIhh7y2sFdbd6z20lu6hNQ08+bJC3fp1yLtBZnq1Reqm1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 27 May
 2026 22:00:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 22:00:44 +0000
Date: Wed, 27 May 2026 15:00:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm/xe/rtp: Save OA nonpriv registers to register
 save/restore lists
Message-ID: <ahdphq5r+Z/o47Pc@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f35eeef-0e8d-4ac9-d107-08debc3b666a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: tXlbq5En1QvZXqoQU6Z7ocdPCcCFa/dVTfNGQcO7otPPgmUNcC0hngQvD70jDawIfQ0hAAONPM6Hix3uByJLqu62d0dKlPbAxgGUiBN6C1N8lmKAV+SPXiJ5r6tFktqP6HHn8AnPkYFn6iYDoRykJHkj37G3mUSjXThcK3iSmVFOumYNzr6PRu4sQXFoOVugxgs7H3O4/Wi0sBVDzK6Y7lQLJkyoEMp1bFezi0QzbSbow8K+IuMXQlwOiEnV6Uc8UIqgBtWFSTsSUch48fRHhSGvuAJDD4GUNdLXC+LSK9zvDUPVTLxU01SZeMqOjqksKT3iZ7qWTV+71i1/Iq4Ez8b4qes6mfkMi5d2+QEqW9TILzXZr/gXh5JeL2IfdmPH/miCFK7Q6V7Fha1w6O89GeddiokbUN9v6tnickhMJ/yTUSRks7FBnwrcVGI5uaZHgk4xau7+v9RscGc9u4Z4znQAo7a+URFRPHVeQiBBKk+sOcbc1I48dIqosK4EJPv+9BCYHnLCroL/J2/YNLPo5BfR0HFAkpYagdzlSAP+hvS8V6i0I1U/aeLagSLECSgTBJ9rizMp0WFJNcAWUIFsuklFzdEJ9HVf42+hSkFuG6B8+qdnVHIDvH24p1JJbhkqs+UtCgzHTr5rwqb6D2WlWIUp8l1hZD47rYaTn2ZPsdb1FKIpMleGZOH2dv1CRBnx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUFkTyt1Zzkvc3A5bTB5VE1UdjJOV1hEUjFWd0o2RmwwcUZVRnk3NDQxREk5?=
 =?utf-8?B?YlQ1T1NDV296M2NxY05UOFpJMElqblZ5Z0VKcndzREg2TW10bFFmV1BHa0VZ?=
 =?utf-8?B?dUNIbkRWQUJ5QXhnSWFQSVVoSzlCdkttUW5PNFNxMkpXai8xQUZFZ1RFZU1M?=
 =?utf-8?B?UG9BQXh3dTFWYUdKd3dqb0N3ODBKTlY1VjZiZG5nMm9uMGJacFluZzNxN3hC?=
 =?utf-8?B?MFRpQ0U0N1FEQnVFc0lHUUJ5TGd3NmNaUG00UkNTSS9nS3EzQndGaXM5Q0h6?=
 =?utf-8?B?OUF5aWlITXBQb1ROVjBDcGU0QWdDdVJ2bkVQZVBsMlZoTUlwaEF2SEFxTk5x?=
 =?utf-8?B?WSthdEl5R0RKWDdRVWFwbDRVeEJ6b2JBMWFnSGdETXBwZXlwT01aaHlaWWN5?=
 =?utf-8?B?MDhtMEQ0Y1J1V0tRV3hnR2dQNE9URnNKdit0azEwaThqSDNIZG81UDRCZ0k5?=
 =?utf-8?B?eWZpbDBWeTJxaVNiNGtWUzViZ1dzM3hGbnRxYVM5V2dvU2RUd3NrV1VLdVlh?=
 =?utf-8?B?UEdoT3lyVThwbVdTZHNpNi9HbmlCa200a3pKblJXWWMrRXEweGVjYnZwN05z?=
 =?utf-8?B?eUVNYnVlTE1UQnAzUlVWdWNUeWNqandGY2Nhc3I5V0VVVkxIS0g4Wll0RGQw?=
 =?utf-8?B?VEwxS0U4V1A0NDhsa3cxUzYzZnY1S0Fxc1pCanNKdklyN0ZucGFHd1c1NTc4?=
 =?utf-8?B?eUM5STlOeVR2d3BCODJ3aEQrM2dIK2hUZ0dWanFRczkwdDNuaXFkbHU0OHRs?=
 =?utf-8?B?WVZYbytlMlpTYktvVm5Ma25URno3U3IzVTlMOXBhNlE2eGdFaEROTVJXVWR1?=
 =?utf-8?B?cENIR2NMT3BDVWNtcm9DYVIxWTVDY0lFYkh6aVRIZ1RsaVNZWks3QjhZUWpR?=
 =?utf-8?B?UFkyZVhJMGR1aVpiR1oxRmpxSXVwL2JlK1d1czhMUjRpS1RoNTEzUFc5YmRj?=
 =?utf-8?B?RGVHVG1XZlJFaGJLb1FLUjlFc3krWTBPMXIydnp6RkxHV2VDSGo4UmNTeTIz?=
 =?utf-8?B?R3lCb1JoNWtiRWQzZkR2ZzZUK0FOeUE1Ris1RFU4NFpNZVFIS1UyV3BlOTR0?=
 =?utf-8?B?WERGSk4wSlhBTWNMa2VVd00zMitxbW5XS2tkcXFUbldXUy95UXNZcEMzZWt1?=
 =?utf-8?B?eXpuR2tHYUZhQ1hsK3pZcE15K2hjczlhNndWVXEwZmJqK1VmbUFlcmNDYUc3?=
 =?utf-8?B?K3BTd05IWnErNkEyM1RaQWNRNkpxWWNpSGJQc0o3Yi9UcFF6aXhQdytFNEtk?=
 =?utf-8?B?Q0dPVXZVNjZRVHFYWkpEYlZYamdJQzZjSWo4Wk5JUExheS8vR1VJdFM2bXNH?=
 =?utf-8?B?b0tiVjFJVXhta0NQS0V3c281MGtKTzFMOEdLdHZSKy9zcU92RVZPQkhXcnFL?=
 =?utf-8?B?UlVhZUVUV09sNHE0RGtZS1RDaEFGbWVXc2w5OVZKMmc4bTIyTTFaZDF6VzZZ?=
 =?utf-8?B?V296OWtybUxuVW1hNTBzMjRJS0RrT1VDZDI3TUJpOUNoVVpMejlYb2YwWERy?=
 =?utf-8?B?Ujh6bUtQU2pIMGdITGtDWElFVjlJVmdKOVhDenE0M0NMK3BXbDg2YlVGYUVE?=
 =?utf-8?B?Sk9DQXhkdEdqODJaM1NqVVRlNFh0R3MrN3VHZ1ZlSTZQWnNGTFEzeXpEdTZ1?=
 =?utf-8?B?NyttYnNaNzZmZ2Z3TDc4RUQ5clpmaS93Z1BocXhNOFRKczQ4MFFobExsdTMw?=
 =?utf-8?B?L0xZMG5IYU1hL2Y4NU51cldiWDk5MFExQ3htOHUxT1FlMUV0Q1ZPcjFBRGF1?=
 =?utf-8?B?UW1rN3FqSWpKVGZzRzlsN2I2Y0NsUm9KMHcxMEJkUGk0NDBmdzdULzRIMmdY?=
 =?utf-8?B?bTFEb1ZyZVNyeGtVenoyRmNvb1VKK09oQVFBYUVLdmZGaHJLQ0MzZ0t3UCtn?=
 =?utf-8?B?Qk1acFdOMHVodmJyL09WSXpxdlBnc3UvbHRYSENuMWlreWVEajBGRG5VeHVy?=
 =?utf-8?B?cWt4RUxsTGlBdjd4UUJrVHpMbFRnMUQxYWp5VjFxSk9JSlE0NFYvbFRITUxn?=
 =?utf-8?B?d3VNalg1UWU3V25kdHRwRnIyREJ0MXNSN2d6b3pFSzNudGpySWpwVkxXOFFi?=
 =?utf-8?B?ZHpWSG1oSFc4OHRFZS9QOHBEYW9rTFI1UmNZYnJoMkMwdWlqN0w5OHorT29V?=
 =?utf-8?B?eDJwbXhqbnVWVW5WNzVrcTVydExlSDEzeXlsQTFnVjZZaHk1YW44VUtKcXRL?=
 =?utf-8?B?VGlCZDE5cVNac01Xb3kvb3RqMEFoWEVyWll5dm40TlNqUW5qK3d5SFpzaGpZ?=
 =?utf-8?B?ZzRRT1BKOUhseUN1ZXpBMWE1VUYwYk5TbEN6SzJwbTl5WFgraGlETDhHa3NK?=
 =?utf-8?B?dEJVSnFzaisvaFl5dG52elBvSjlWbWNPS3M5YjFGeW9yS2xCNHhORFBBWHda?=
 =?utf-8?Q?DbqTVBIFMOJSz3ap7TfVXsY+hbw/4uKs1n/OV?=
X-Exchange-RoutingPolicyChecked: a0lfx8IXu5vHRMLf7mXhQ1cbXMyEAUC4S/v2lqsImDX/OwpbnlFvV8tD/gYpr8NJAsnc1Idy951/ma5y+Op7vQPHWStYbFe3BPVcCIzODRk3ZQ+y0SU5NIbgy6RWU8uSj9bKPx5aBn2JzO6XX5S/pROHcYd2EUeDv+PBhR1zw2GoyddZuTzb9/84b34TBcWuTQShNXyxyRnRZ81Rm/udawBZC2ZWEojlcbWZ8tfDPzlNr+o22iGiMbYvFWQKciVQZ1AX6nAoWIFe7lG2vqWixJoDtxhOF/m5p3k0iDNVAeJq3bEUyLSoqcX8cJMTtzaphEmqC10rw3rrI82l3hW+wA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f35eeef-0e8d-4ac9-d107-08debc3b666a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 22:00:44.2308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rp9SOQEQt9erVqE8GsEpMsArrpFQY78FCDoFv0b4MIYApUlsQFmMe8EP2YjQkFqnfB8eqvAzV4MR9ESPFc7jOGhjJIPHR7eIZNrZhdGQfxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
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

On Mon, May 18, 2026 at 04:47:12PM -0700, Ashutosh Dixit wrote:
>Now we can save OA whitelisting nonpriv registers to register save/restore
>lists. OA nonpriv registers are saved to both hwe->oa_sr as well as
>hwe->reg_sr, for reasons explained in coments.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 6d42c00c1d75b..18053582a6afa 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -216,6 +216,17 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>
> 	xe_rtp_process_to_sr(&ctx, oa_whitelist, ARRAY_SIZE(oa_whitelist),
> 			     &hwe->oa_whitelist, false);
>+	/*
>+	 * Save oa nonpriv registers to hwe->oa_sr, from which oa registers are whitelisted
>+	 * or de-whitelisted, by toggling the 'deny' bit on oa stream open/close
>+	 */
>+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->oa_sr, nonpriv_slots);
>+
>+	/*
>+	 * Also save oa nonpriv registers to hwe->reg_sr, to ensure oa registers are not
>+	 * whitelisted by default after probe/reset/restart
>+	 */
>+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, nonpriv_slots);

I would prefer that we fail if the registers overshoot the max slots for 
whitelisiting, but not sure why the overshoot is just a gt error log.

Also, max NONPRIV slots should be bumped up to 20 for Xe.

Umesh
> }
>
> /**
>-- 
>2.54.0
>
