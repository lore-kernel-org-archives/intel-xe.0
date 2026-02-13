Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB30EF99E3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE2710E84A;
	Fri, 13 Feb 2026 22:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5IxE3A3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125010E87E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771022747; x=1802558747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rmQfckl4uPDcnzAIXbQniTbaFVMQHWFA+e5x51gn+xE=;
 b=T5IxE3A3i7S22vaknJEN9InOo7KQUbVPhlWrSBJ8YVRSbyJKLdQZP7kK
 vMZ6UfVvchslW1ZfOB4fDke0TODLVzXReGxzxn5kvSSnc9yacXxhlHo3R
 VvPuuST0EYsk8o6hM5Zf3wW9vmXdxW1fr2mm3RESoeVoGYe+S+yoSCIgc
 kucDRF4/LSXPQcPTm4vhyyTePAzmNWhOjsG1Gmb8til1dVT62YaxMefYS
 kExiZynBxKx0HHblBe7qsQAwQcIrjUBSuUBvTlh3y6WyjyM95svtOc+PL
 VENwPewmHPFMdiwPsK7c1UDwCN652HwtK0OH1OpLVDxvm+sJqBWCn1QFm g==;
X-CSE-ConnectionGUID: bb0b/9/nQBC04sQbJNdJPQ==
X-CSE-MsgGUID: EeszPnCXTxmz8Ed9YQHVYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72114713"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="72114713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:45:47 -0800
X-CSE-ConnectionGUID: 7MMh19iOSK2zILAJZeo1dg==
X-CSE-MsgGUID: iwpWh+ZOSo6305qhFZoZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="243640083"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:45:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 14:45:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 14:45:46 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 14:45:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFx7x8JCFbML1dgvg8Kt26VOPFVTJ0+sNlPX8z7foiMofzCiw5G5iB/+rzcCYZ88YrZEE7MaTyRGhcte1Ys+0uitUMSWFf+FcjtB9buFG6iY42cn1TFvqZSmue+rqN0VOhYMKTQicSdBy8w+oVi6AKZVVsIzWJYAbKtbCkiRVkNr7lmjkadytyydBQHFoVEDfBGnUdkRCZlo7B77mN051bZaHfUCx7WyiHiK0YHGLo0qPgV/wSpx6W4Aw1bmWesKcWKEptGml3kegx4/vqfnHoHtjLWdeWfdx0TilUmmoKABXD22xLeoZNGoKl7ar3vqgofvt28ckkNaPxT9cC/tqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJBymZGDuLW+zdB9W0cSfBhrea7dsBvkBw1144C+HwY=;
 b=XmCpLEfJns/p9nPirQyxcW8dGtdOVACIok3wmyj2cOA7tMT374NuZ2FK4X5ExUM+5HeVZU4ZZcqBgE2i2kyUDzOREB/irRVu/pmjk1xuIP/ebuzyxAvULmIIJtWX0vrjTTScQ1LFao06reJBSn+gRzdv8caaVEBOSwhddKf9gLuxZHIYsNKzIISOXU0L5nBht1zCd+o3YgMFypYDsWvvt758nBxJD6YXwnzYu7L3tEYjhGCWpdjSUPs8TuXnTcXTl8AKQNZRZsiPXawqxsuM6c8wSpxXp+Z3UkVKQsEP3dSmVEKBQ2agNG1SH7DrEU1MuRqOkuLZ7YK8bDuQL8siXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 22:45:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 22:45:39 +0000
Date: Fri, 13 Feb 2026 14:45:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe?= =?utf-8?Q?=3A?= remove unnecessary struct
 dram_info forward declaration
Message-ID: <20260213224537.GR4694@mdroper-desk1.amr.corp.intel.com>
References: <20260212131206.1804113-1-jani.nikula@intel.com>
 <177100389877.253304.1767254569501104327@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177100389877.253304.1767254569501104327@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 255ea2fb-e2a6-4478-0169-08de6b519c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e5tuEc/dzPNoYZCmFhtLZsTgQRDoq3E7l6+wBk8zGeBctDN+r03u1Ovyz3Za?=
 =?us-ascii?Q?vnTiMMBe7vy+oRYgNoJ8BPzcY82jNm3iDbR3J8goDrMk1f3fcSSBdI5HfaaL?=
 =?us-ascii?Q?rlq4qKHG8ShNMX+vuhFV0UATQvh1ig98ZRb+DPUEqN6JQvMDQUXnMt2Wvm9f?=
 =?us-ascii?Q?AqKM4DfXCpmlAdWo9LoPaPyOK0KTESyCYiW31jdr4MZYtxm4dphqIwVP5Kxo?=
 =?us-ascii?Q?Ve4D+kykey8Cq5FbNMKOMkKV6fogcYeum0RSd3yYdPPLfgsVLepDPEEWdOr2?=
 =?us-ascii?Q?g6dzwJUuK5Ikl4tnS+z3WACg0tDkcmpWgO0iRDtO4tvp16JNZNAgIxEu2d3l?=
 =?us-ascii?Q?aHCKLxTbyGLtIOoJAGwdU0Sr02E8jHEWSTmBItwAATe0G+1uA3aUr5lDBlsX?=
 =?us-ascii?Q?caXOwVHGKbUpdrAqKz/9P1CI/aUE6k5vRit5K4f+XLMCiGu6uGAwWdGIaMeE?=
 =?us-ascii?Q?S6AdAK9texKfgYmZ5NwciYXFeWHXBMSZ7cKtGN+VhqwsWkH1161K/ShqJOUJ?=
 =?us-ascii?Q?6DC6yxmDWG3agBEL/Zddt5lswwuj40Bp9DX8fyGO7hHKyPtHie3xvSMuipNB?=
 =?us-ascii?Q?crg67a9MekXmTtxJcQfKuuSn9DCCLvZzEoyokpHX1rKiBpm4rrIE1pWbdqzc?=
 =?us-ascii?Q?iNWb4vJk1czrSbR9CDcXbDUpDJXO4SSG93sefDjnNwsdUzFpLlG4sptwdOnU?=
 =?us-ascii?Q?jMcUg/WbE3tqPkixBVsFdDpDwL+Fp5QfwOe6ZZ+laD+Y9BjLwsF3eIcVi8QP?=
 =?us-ascii?Q?hnXOfe1h4e6Ryw+C1lkaODBQHwq8HJNC+rQIyBe/fZ7gTHVv/VS9uQ+UjgOZ?=
 =?us-ascii?Q?LxCJkNCwLovVAI63sL6Zv53ZRXvQiU7j+sn1rdQBJtPj7VT/uCXyhRo+iCoq?=
 =?us-ascii?Q?OZr14PlxK+NsulTKwllIIaxJejSKZWCMjkzauABayoPbI0MNpuWnZzOf4gSd?=
 =?us-ascii?Q?4kRlsQzt8c9BZbotHk+sYTUf/Ut17vXE6Bo1jSqxMKHGrtK5me3DerYJClLB?=
 =?us-ascii?Q?2vBMnZk+/jNqcUqo7URecywbys6p02eSf5WnEB/2rC7i+LJPVjz78E7nddNC?=
 =?us-ascii?Q?6o+wbMWdms43LxafWMSDXFWu1ydWPOOzu5Xg1OBjoZk7Ip0TkUr7EYvtXOWI?=
 =?us-ascii?Q?0y/XjXuIgsGJcarFvawh/cxHBG93k8qrGqDbgpQ5V2HzJW0ziqY5WyEJSQnl?=
 =?us-ascii?Q?JlL3tWJ/vNlM4DVr5fdJaigk+sT7KoHtt8CYL7O5SjnctilVfSlEA6Ju4naW?=
 =?us-ascii?Q?YCesoK4/31l+2MTX6/dpW3qoJtJ2kwS85Uj69jMaKeNp1KS+hEovdkggrbpS?=
 =?us-ascii?Q?YdK2wjkLx7nn5PjNOFRjDXGcBw8ya7+frGKN/nASQiPsGltAwgQuqzBQYVKH?=
 =?us-ascii?Q?E3t8IThEvUwkS283k1tlGLoWs4legsn5t2j4Q+33o6ZKyMLzvH8lXObw9Vl7?=
 =?us-ascii?Q?WNgTjz+QPLDcOhfuKLzu2wxswz5Mtno1CevW6P4yiItDyV86SOL50joDG13G?=
 =?us-ascii?Q?9DvzzuavOgnJ5PI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Reck/UkBnDa07RNoaFbtkGoiqQ+Ym2ZDX6lqk96200o1zwOoExr4+UDVdNHC?=
 =?us-ascii?Q?km9EzPN53hIETI/W3TTpn3HJSxAcdIikKbbyzmPgvD/Na2ruJRJotM/ywNB4?=
 =?us-ascii?Q?3O84j1gjCmmyl+i3aS9PaJRa6OzakZlw6W8hlCv+cWhXy0dKj1XUPG41l9Gy?=
 =?us-ascii?Q?yDCXYOW/ejl0WYH5wEy3ysFZd9mPzEd+Llg74X/1wKBP0VIy41I+IufEoR7y?=
 =?us-ascii?Q?sXlA4HMg7KhMYOYtLNJFRjQWOOvrHeLxxaVzEdkeuXSTryO7dnNWSFWramC0?=
 =?us-ascii?Q?au1Llrfqrexa0yng8Nsc8EqKXdi/r//mkgRYpGjbaa51OijRjCmAvuJkfnxt?=
 =?us-ascii?Q?iaATJF9GCBtKWbhpeqlNl7BZBe5EN7u1W2W5HLyRbu/1HU6Vq7VuoXYuSjbc?=
 =?us-ascii?Q?K9oVevj6X9H/5lGuXsgQezeYNrzgQyMWiw4IMgF5oJ2vIbsRxWs90vQwx0Hq?=
 =?us-ascii?Q?C/w+tJIBZeVwE/8gji7eWXZOCBvnO/u9Rcfvo+sfjF/6ygyKkWmsovxiuJQt?=
 =?us-ascii?Q?4AHKiORhZKRtjZfil82eYkqSjcHK99+jeVXlsdnvnLZ/85Ya/kevOtW01ubJ?=
 =?us-ascii?Q?bFwX79yauI03rY9uYR4SaJO0PMCGvxuXzq+PcMp+3UBEMpOOnb4k1lx39llF?=
 =?us-ascii?Q?Dwd147UBHnLpd12XxKyTqzCPXo8xQM0vwDTofp5LmZ8LHNg5GdzQr0b/KjLc?=
 =?us-ascii?Q?AzCtHHt3oLil5bmWVMElwNXIGOWAt+5U2nSucJiT1n1Bk91HB4D4544qqcqu?=
 =?us-ascii?Q?Gi29M4U5rqa31whEoOk35l7sxnrUlU9BGaRBqGSCxRI7rXINZuiPxCM4ZbZ8?=
 =?us-ascii?Q?LPLG4IwrjbOFiNT1qGBNfppPXSi/3isXwNqr6kkHb9oUqTj97JKyQa6Sciq9?=
 =?us-ascii?Q?MqJP635g7c7Oenft5bbnAL/g7N7goU4j0gj9Cq3V2usjF0dUr2z1GXCz+m57?=
 =?us-ascii?Q?dPLjuNyFc+sw8wFArCC5QYm+ZlWAwp8eFEA/VleO9IkucsB858Lf6N6Vyay+?=
 =?us-ascii?Q?ucJNkSW+39EjOvDNiVrEmCE+9/bWOYO2cC9MO9dS8BSiRwgINVijhXFpcvbM?=
 =?us-ascii?Q?w32WwnWzMl7yZRCPEQWwTounxHM8zsf6n5Z2V8cpzaMhjQmouJiPuDD+LiuG?=
 =?us-ascii?Q?pJL6AyHJPWFygp3WWAZygcqmpjRA2W5TuCIM4BMFQMGAQUhjsEJ5xQVxpsd9?=
 =?us-ascii?Q?wkl/Ejwr2Uk8a1i+2Ebi+QdExZ4SzsJ1L/JwMVsnwVlEOwb234+2SzWqJD/X?=
 =?us-ascii?Q?LdHChUnbEbTyrCVhR0Ht7NV+gGJQAo0cKb7jTAncmON+1tN/YAeg43kGjw9G?=
 =?us-ascii?Q?7GtN5lxXZeDGKl3BH94cLdMFcX51Rrps5MfCZnX6abGoTEFhFQfZxXnrxysR?=
 =?us-ascii?Q?p7xbplZenpBYOvPDgUzybaFfSI4IT1lGS8wakHP94ktTrNuds1eA+zQ/fb0q?=
 =?us-ascii?Q?vVGLSmEKiaPse4bYeTc6BWwMobWFG2mrHzsHFRn5APIJltxkvArEjPSFP1JU?=
 =?us-ascii?Q?yHm0Wzy1Jy7zdmyfFdg/itF28O6PailmogdkoT19g5nwKaFqYZaNWuXcTNVM?=
 =?us-ascii?Q?YX+upKX+59B9i842gO2LIQYBWCizPKiykWoSWiBuiVGTLMvOnLcAE9ib8B75?=
 =?us-ascii?Q?3sFyxHdI5c7jHWjpOkI3oaP+Be+BPFSWgF1L2rnIDI+7FpuaFZ2/SVEi0KEV?=
 =?us-ascii?Q?V2uWqYNPJtZ148Ozt0Xl0i3ITsKR+TkdK/HjLrPu/rVv8XQmBZyFROqV3vNi?=
 =?us-ascii?Q?KA0zMHN9J13iGiqKkYIdtirvSlmyZ2E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 255ea2fb-e2a6-4478-0169-08de6b519c47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:45:39.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyB9SkPpSeHuIRVeMpZ+TdnM7Dp6TgQwK+T4Q57qV0QHlKmRbpaZgH3HDNSm84lBIu0byf2Oq8ZXhXf/QW4csag9kdPDvkgBiYW4j6YA1Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
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

On Fri, Feb 13, 2026 at 05:31:38PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: remove unnecessary struct dram_info forward declaration
> URL   : https://patchwork.freedesktop.org/series/161550/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92_FULL -> xe-pw-161550v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161550v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161550v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161550v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-9/igt@core_hotunplug@hotunbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:
>     - shard-bmg:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-d-dp-2.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-d-dp-2.html

This patch has no runtime impact, so these three are all false
positives.  Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161550v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3718] / [Intel XE#6078])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>     - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#3718])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#6078])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +4 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +6 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2328])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1467])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1477])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +10 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#373]) +5 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +6 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3278])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6973])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#3304]) +2 other tests fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2341])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#6707])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2321]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2320]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#309]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2286])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
>     - shard-bmg:          [PASS][39] -> [ABORT][40] ([Intel XE#2705] / [Intel XE#4760] / [Intel XE#7169])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-10/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-10/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4302])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1340])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1138])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1138])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7178]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7178]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#352])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7061]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#651]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +9 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6312]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#656]) +13 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +28 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7061]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2350])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2313]) +22 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1503])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6911])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6900])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2501])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2486])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7130]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7111]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3:
>     - shard-bmg:          [PASS][67] -> [ABORT][68] ([Intel XE#5545] / [Intel XE#6652])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#599])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-4/igt@kms_plane_lowres@tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2393])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#6886]) +9 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2938])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#3309])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1439] / [Intel XE#3141])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#4609])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406]) +2 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1127])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2330])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2413])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1435])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#6503]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@kms_sharpness_filter@filter-formats.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2168])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#4459]) +1 other test fail
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#2142]) +1 other test fail
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2504])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug@basic-vm-access:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#4837])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@xe_eudebug@basic-vm-access.html
> 
>   * igt@xe_eudebug@vm-bind-clear:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4837]) +7 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html
> 
>   * igt@xe_eudebug_online@preempt-breakpoint:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-2/igt@xe_eudebug_online@preempt-breakpoint.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#688]) +5 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_evict@evict-small-multi-queue-priority-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#7140]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority-cm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2322]) +6 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1392]) +5 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#7136]) +8 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#7136]) +4 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6874]) +23 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#6874]) +11 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#7138]) +5 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#7138]) +8 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#6964])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#6964]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2245])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2236])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2284])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#584])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@xe_pm_residency@cpg-basic.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4733]) +3 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#944]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-10/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          [PASS][115] -> [FAIL][116] ([Intel XE#6569])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-up:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#6376])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-2/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [FAIL][118] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-lnl:          [FAIL][120] ([Intel XE#5993]) -> [PASS][121] +3 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-bmg:          [SKIP][122] ([Intel XE#367]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][124] ([Intel XE#7084]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>     - shard-bmg:          [INCOMPLETE][126] -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>     - shard-bmg:          [INCOMPLETE][128] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][130] ([Intel XE#718]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][132] ([Intel XE#6321]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [FAIL][134] ([Intel XE#5625]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset:
>     - shard-lnl:          [ABORT][136] ([Intel XE#5466]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new-race-nomemset.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-bmg:          [ABORT][138] ([Intel XE#7169]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-10/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_pm@d3hot-mocs:
>     - shard-lnl:          [DMESG-FAIL][140] -> [PASS][141] +1 other test pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-2/igt@xe_pm@d3hot-mocs.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-3/igt@xe_pm@d3hot-mocs.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [ABORT][142] ([Intel XE#7169]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-6/igt@xe_pm@s4-mocs.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-5/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm_residency@aspm_link_residency:
>     - shard-bmg:          [SKIP][144] -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-4/igt@xe_pm_residency@aspm_link_residency.html
> 
>   * igt@xe_pm_residency@gt-c6-on-idle:
>     - shard-lnl:          [FAIL][146] -> [PASS][147] +2 other tests pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-4/igt@xe_pm_residency@gt-c6-on-idle.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-lnl:          [SKIP][148] ([Intel XE#7130] / [Intel XE#7250]) -> [SKIP][149] ([Intel XE#7250]) +12 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          [SKIP][150] ([Intel XE#7130] / [Intel XE#7131] / [Intel XE#7250]) -> [SKIP][151] ([Intel XE#7250]) +11 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          [SKIP][152] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131]) -> [SKIP][153] ([Intel XE#7111]) +8 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
>     - shard-bmg:          [SKIP][154] ([Intel XE#7111] / [Intel XE#7130]) -> [SKIP][155] ([Intel XE#7111]) +9 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][156] ([Intel XE#2426]) -> [SKIP][157] ([Intel XE#2509])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6973]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8752 -> IGT_8753
>   * Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -> xe-pw-161550v1
> 
>   IGT_8752: 8752
>   IGT_8753: 8753
>   xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92
>   xe-pw-161550v1: 161550v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161550v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
