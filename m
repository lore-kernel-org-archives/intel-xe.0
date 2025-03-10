Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E524C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 17:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDCB10E496;
	Mon, 10 Mar 2025 17:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHfxwMbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C9A10E496
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741626096; x=1773162096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jgv4Rc0bkE6oo4m8cMWpXCKIwyRCy7wTSExXHwMgHsA=;
 b=eHfxwMbZZpXux/zp6bV6OMnYaqu7O6SBLaMcAgf9wPjcUR6AIHrPNLyh
 vDw6WjpOt2vZ+gKzm1u2oTXQQD8JWt69nR0/DBtiL2DtkUGcw7+hYuzAX
 IajC+rc3IE0oeRpRJslpnvabwy7UZi7E1TB3eCzzKAMIB7dnx3DDtEnD6
 LEKjKYJqk/MOK41nQbxSJDBE8NzWJiUKeIPqG2oxnG2AJqmk10mWy6XIO
 eTUZydEThRKOMf1iQy/vv+Q0yVU4iyYAIE8Y6WgDG4YT8t6/JYiymZ89Y
 WJRQH5utr8HSJIBJjKccnKHJlTh+LUUab+fDG7l0/8nXFnVHuQXMBNDGK w==;
X-CSE-ConnectionGUID: /KzsGsWvRTagN44zN4B/xw==
X-CSE-MsgGUID: TimvA488QWCdnfnTvwJOZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46416921"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="46416921"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:01:36 -0700
X-CSE-ConnectionGUID: 3BpgnPVJTOapL0i4Ts2lyg==
X-CSE-MsgGUID: 9pYt3m+nRwCcl+kA8+e4uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="119978934"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:01:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 10:01:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 10:01:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:01:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkqb5TFyjGn8fc5c1SbPc8csw4xDJWoaC6Df5xQUbqGUxNVr7WCsYKutK91CJ0AyYFP1AjDghylxYtcyQyU3RDZ5P9aZf3qpQrARCya2MLaUA1Vpwvzn7tgBSoJBxf9197kyo+mtpiiC7ItodyjyM2LYtQ8YYrYW6Dl4FA8AWKM7eUThI2eu70HvV260nSXAbh+SRH9eIDsHr25nStvYqR6BPUhJzjGtZhu7ed4ogmL+xz1t8rx9XSZXcf0PVjsuup5FmiUi41uOdT5a+eaRHDBuclVFzANRtC3Hj85GpRI9DfQRLYcbeiAm0MLmR9gxud5QpfrT5nfETHDKxeho8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+214+FFav53uAFy9FTa6qfp6EaaKRZwB7j94WEAxQx4=;
 b=BHvfBGGufn1amSDdOk6hVjHKKnVlVRuZUjza+xEa+px3qdX7zoAjI+9eTM0cmKyOnAmHJUeOxs21gNxJdlFimLK0+fyyfIr5/3WckAiV9sVkTrcMyAv1Pky/feA8XlLhtfTPME+YWy/TRTqDr3qw2r3/rf1Q35SkBhLcGaWVUkm30y8KDV6YjekHK42CDxQEsTlRKycbMxwyGwxSx1ut2xKKMh2Jx2AcynWyLzDI8VuJLtkaT2zSAkdvDTQkkgtI/kvZhES5eI0hqsR1XkNa2Vgzu7pHtJIlUKvxeRET7wSDDsNs8cBEtbCQo3ig8Z8ookFVX5gRon7gZrxbPff4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 17:01:16 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:01:16 +0000
Date: Mon, 10 Mar 2025 13:01:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik Poosa <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z88a17Fr2f-8cuad@intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com> <Z8xsYAhf96iptwm2@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z8xsYAhf96iptwm2@black.fi.intel.com>
X-ClientProxiedBy: MW2PR16CA0042.namprd16.prod.outlook.com
 (2603:10b6:907:1::19) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b5914e-af54-428b-14fa-08dd5ff52b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SfGpuwE7RwLSTd6rUo4KFLMzPc8z1dEyAn0QH52iQBxH8wWi+vuZaog0OWhm?=
 =?us-ascii?Q?kiM1DMBcNKy1+x+eR2QnE2Zj0rBkaXX3ClktzxLaod66XtYd1sp4gbdKboOu?=
 =?us-ascii?Q?D0/uekI71gzhdyH4CfgcjMhZKSk6PieK1kPldA8G4bOyBUmzksZY/D/0eG5m?=
 =?us-ascii?Q?IA7tBOPe1UpU00JVypzeudRt6d/W6EMYS8UzKNFi1vVJ7BDo/0JsIulCSbi3?=
 =?us-ascii?Q?/UZXIjM95s5To8VyX3TKzgb959hWVQqqWL+I4hioxZUc9P3WmQpyVCaZe+pt?=
 =?us-ascii?Q?GD+CW2N6dcwUkgjqnTTJwzLKc92swMt+FJ1GM/ear+/Dnt+YcTa43z0RyL3N?=
 =?us-ascii?Q?1X9EBqlB3bG74OTvTBQHLc68V1srrR2ZDPDxngXKcBbObSdccYuEAnjrIpTU?=
 =?us-ascii?Q?OAxbH6JU3cO4cWT5GdkSVGFKcly6b8tEzEtKxIdFCOaJGd/QQZwytRMk5WnV?=
 =?us-ascii?Q?YRwLRcnrFCXP0AN27naQSIZ92+kjBsshq5Cy7MiPpR9U6s6C9GY8BEPqdOQ4?=
 =?us-ascii?Q?9Eq52TwhPSQINKTJHd+2dSUsc1p/8Sv5QB4vgooO1TlHBo8j5e6ZDc76rRTn?=
 =?us-ascii?Q?a6+r5O5EStrPneKl3YlTJeejrNt3V3ySuoCtzuzzbN5JhaXaolulseSP4W1/?=
 =?us-ascii?Q?KL9zdXFrPMDm/YV99oFaEMyjQJiFPBeLxEn8XWobXC/ZtWeKtomCAfamvhPx?=
 =?us-ascii?Q?3+Ou95l0ws6nZUHVcJJOguUVXdLFAf1Bo51sjXEHWOhU59v3A2y2vl1DAoBu?=
 =?us-ascii?Q?l8ZlVJMA4rZCV8Rxhxit6oqQs0DUD4nPGx67sSu1altqjKGKZJheqhvV2/4S?=
 =?us-ascii?Q?eishzUGQTBNdcVdMqn49CdmXrQyOZtNEYnpkdRwrzgfaVWyIjR80C2MfJdBr?=
 =?us-ascii?Q?xyt/HnJbH08/cFzexJSMH7/+35UFjHVyXWSeR0u/0Bj66zXIgIRMVKMV+bf1?=
 =?us-ascii?Q?z7XzpP5ZQqOYTnRrzryj4OzwdpfGyr6C/8HuTSow9zPWBA9EdRjo1w8u11Jc?=
 =?us-ascii?Q?4xVrWtbXdfvnIU0TdD6fuvj0K1qKweF0NZsvd2BPEDsyly2xV2vDLVQSse3d?=
 =?us-ascii?Q?OsePdevJrWnOg16yM45ef9aj+JxiiyEXKvt26xIZafNh0rg9oMWgVXbbgilx?=
 =?us-ascii?Q?OjpXGQLAv/0TGnGM4YRDj0Smy5qLH6a2pTMwbT3aGv/G9JCIP3xTOlMWpYO/?=
 =?us-ascii?Q?86EkfqYB8csIHIvW/5AvTnt8BdjDlt2oRoChHPD/HndvJ16KnqcIaCNG5zvZ?=
 =?us-ascii?Q?tDlVOV8HUyCU3FIZNI0CeP9t1sYJC+uxZyH8LSlYkD6dnSDFeymgUfPjuvpQ?=
 =?us-ascii?Q?3jwHJwnU5EmxfTGM5DuHByfsI0DugY4bcswg/D0T2yYJyOhqMPrbkRc3Nutm?=
 =?us-ascii?Q?TSHtQ4x99IRmeQf4O1mQmWnfz6aO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hieM+gVK2ZOEPaaSbCFcJq3ljFpGuO2feEix5lybiQcoOIDWpq7Qaf/8Ss9d?=
 =?us-ascii?Q?jGHKYrrtpbzF26xGo+KhpujkFE750DAifGKqJUtjRNM8ZE1d7n2WVBX0ePbO?=
 =?us-ascii?Q?vid8wYWSOOjaaO9WNv9y+GGclijiRLCci4cA8pxCpmx7HBEcodW7QOG9cBF4?=
 =?us-ascii?Q?KPt8TD5UnJK8JLMjrTSKYCjbjjgJc9WmUkjh4Hnk8Mb1ZE28TpStZ/fDIbKH?=
 =?us-ascii?Q?LRaFSckoFJlcPRGkCoMQV9Gsr1/sC9zhLsjaj9UXvc5nDp6a0W3Ok9othgAW?=
 =?us-ascii?Q?+B/pfncirrRJpEQC29orh/H6BwKwvoITiNm6wQ/KRmuXsBXfp1xtg1U+FWN/?=
 =?us-ascii?Q?1jgEoKJz5LQSiXIwYDyE3T3bAk1BDh2CWoNgYAM6vbInCHPt/8Hj259lw+SH?=
 =?us-ascii?Q?R0R4cwAV81iFI9ggSQ26z54m3Iu5RNGVGU/dJQiqO+7SQ/ccDbrresMFL3Rx?=
 =?us-ascii?Q?yw6nYV1tHlu5LH/3sk2bUKVkBiLK/vbZ+kwXcL2iQaG+Uf78lyBVWqmUf3ZE?=
 =?us-ascii?Q?ZVzRUR87xRw/Fc5okWLGcTJU9zeRw2ukgmW6Hz0QZLTE6d/bjZ2VT4yX0cXp?=
 =?us-ascii?Q?9S6xIa8gIF254EsmYpucqVO3CpVoIQ19ImlZ9DZljS6J55WxlBsIbC9/Kv/I?=
 =?us-ascii?Q?CceNCTC7D7TW80KHe233h1tING7kdrmV+ZUQJsCh7/+WQkaQZoua7n9nLGJY?=
 =?us-ascii?Q?JG1DKlGt8QVtnAoXix5fBiY0tPJfqi8DiY4r5SJZxWjwrGsR9EVzK2vnKM52?=
 =?us-ascii?Q?oeA0i2MICIpiXFQHLTI/EG//qydq/4g/LR9kR3uLOfYYHlbMDt2DbsDd161a?=
 =?us-ascii?Q?eFPpxM5Tl//Md68IA++0HReXka3Sz5NH+2pxu1wnFvs0kuWB2ueE8dcqnOtH?=
 =?us-ascii?Q?UsZI7ZqdAtzCacvbZs+kIempjFvE5BLB2G9uEW+4yAVQrGN16OmnTyLWbB7k?=
 =?us-ascii?Q?gppornzi6i9dx/O1LwpTzPT1vn7BPyrCBkS1G0XKgjoi3kd7P+DD2eQXOAFH?=
 =?us-ascii?Q?TWh1XuIvo+po1OlVJRNO+dr+jGTL5KiiJyAefvhGsQAoKpTdmJngkzUuAXGU?=
 =?us-ascii?Q?HoB0b5buLgn3lomaFq30zIATcuPhSrjQTeOG7VybRnMrqpElWP89UtPdhsbL?=
 =?us-ascii?Q?4Qgq3i6P/5PmjgRpOrJzTg7XzXfhY4ifOwopWr1sL5vnkN6tXuEFpMue5Kna?=
 =?us-ascii?Q?bV51ZEGNGnVN2WArnOA0pydzk070efsqdCoSgGBPIYNmXaNj9vxhgXkJes2y?=
 =?us-ascii?Q?zhSXV3G6fnOBuNlKUgdpoR+J0bSJ9IWjvwVKL/hdFDCSOqbLzrJwNnZewSdT?=
 =?us-ascii?Q?y3C/1I3/UcMW6FcM/OCnR4nQ5c82cHU3Qrn2dEzcPndO5sjn6xmmKH2lX2pd?=
 =?us-ascii?Q?mrlbWG2S3poQJUKvEVfxLyFFzTKw0RgYtsykCPQ2yXpIF9k8z8z8KXz05+Dx?=
 =?us-ascii?Q?tlms/wpJ66pA/p/rGN5I9r8wkBp3NOhcnDwBX+rZoc+SIjKKhkLe1zbYHYKP?=
 =?us-ascii?Q?//NHlGCddbGtCzxT3sXqQ4Po4zEqOcRk8cA/l232HGIpxC0a00ykRWyOMG6w?=
 =?us-ascii?Q?GpIvrN7LQijJGBDpjE/CtjqVFpPB7unq4+KvmFTbzH2qU0Z/rUdGk+pL4PEd?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b5914e-af54-428b-14fa-08dd5ff52b90
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 17:01:16.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6J2Nz4DVueTVZKv02ZWSKo81zrqpLBNrqiXYgxbPbhFJbw+aJaNYTgSPd16gRx37CBvv1bvUnjF3+p4Y03Azaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
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

On Sat, Mar 08, 2025 at 06:12:16PM +0200, Raag Jadav wrote:
> On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> > On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
> > >  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> > >  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> > >  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> > > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> > 
> > here as well... I believe we should not expose the fan files if !has_fan_control
> 
> I'm not sure if I'm following here. We'll still to define channel attributes
> to be able to let hwmon expose them at runtime based on has_fan_control flag.
> 
> One way I could think of is to do a manual sysfs_create_file(), but at that
> point it defeats the purpose of having hwmon.

Well, there might be a way. I don't believe we are the only hwmon users with this
case.

Ashutosh, Karthik, thoughts on this?

Have you guys seen around hwmon a way to avoid creating an entry based on the
platform? Like, in this case, avoid fan interfaces to appear at all on a platform
that doesn't support fan control?

> 
> Raag
