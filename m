Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4261FC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 23:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC0510E0DF;
	Mon, 17 Jun 2024 23:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSiTipuj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230310E0DF
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718667090; x=1750203090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cmg4i1djpj68tFTiRCYCpXtCRWcwBQnduaHEYUicxNU=;
 b=FSiTipujjZ3MUITAewpq4d63/zm6wLgD8KydQrb1f66psyqNYKUQcCK8
 0/JRzGGfj1DB/KAFpE7mBcplQrg21fuJHe2Ej8Xxs04YxAEutdZruZ7wY
 bRUmypHowV49lmvGnVfrWYtpAh+w1hwAIlr9ohc5B37oJURI2BU5ZgYed
 /Pwk/Ty2lgG/mFj6OoFGLLqaneAbZKq1EriZclO/TSNlAWzeKwo9Qecur
 tqTP0p62PKgBOZdni7PwO1Ev3/VYr9EKwG8ui98TGxaG5+JV/m1rX/WeZ
 AURNTXCtCh6XkZc5N4n7TuSx/iXKt1fsVAHxM7kWzTgNzeubZJTKVUSu3 w==;
X-CSE-ConnectionGUID: SGrYxPgeSGWrneMv7aNJOA==
X-CSE-MsgGUID: gZ2HSBFKQVCNNOGdKrPUsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15349800"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15349800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 16:31:30 -0700
X-CSE-ConnectionGUID: y2/Y7vCWS8GGKLNqGuDulw==
X-CSE-MsgGUID: lNUnPzJYR4uu/Q2MGYnuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41213341"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 16:31:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 16:31:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 16:31:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 16:31:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 16:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7Dc/dwKK5R/xkTHCLV/dPw+H7S1LCMHtq0eDbNUhPZC7aLWMqKp/IaNbB4pdM9fT7a/nzH2d4erg0TuLAnjmCntTBELF6Rj0VJdC/hpXYmZmjvIQb0cu1wvO/8ob6xYp5dkVXV4Z91XBz1PztIOl2PsSlKeIX9pbzFGnyQy6dXRxtG0UAnHZzhc+sJFdcIaBr+5y195AqsUs0/+Z8BX+3LDTYkHl88aE4ve0dKMgYrrvodCGzDiEupwfdaf/zS+znrEW46g19MyU7QXJJ39LhynObQ8w3kM2Jq6tljT4+m4NAv/waWjAhSl3SWrK1ofmDX7RWa46jzIflURc89sZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9cmYAuTF3QDGD6aCmCzL1zeidOBunMFfdyfTxdQtts=;
 b=j2wnb2yXVGEIhG/Mu4T2zCuns3zynN3VoXcMW2AT8pJjPzZSWYl4i2j4GQ7fSrA/X5DDyIJ4ZlURPa8jUIDNbn8Q0ugXJ/pVmRlecHPFM98EC9Gbsx+a/skf8uu6QO2GstYAHCQxVEKPLoci15Rs+vw/Y6TUqL0jyEjmoTloe55UmCwC1XsTwTFM7UOn37t8DhVemvApx4ak863Tx3hssUeq/AxWX+DlNbZGmwcIMZUNttXZRSvxle6Ja3U8ENizmtqGzlvvKgtYaiaU64NB3pv4N4AH34khlyXVhwykFCw7hod6UXQ6O/Qu1ixZyTgOu6kBVHCE4Q+oQUvDBEzvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 23:31:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Mon, 17 Jun 2024
 23:31:14 +0000
Date: Mon, 17 Jun 2024 23:30:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnDHIba3eBe1+p8y@DUT025-TGLU>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
 <ZnB51-d3XtwUfPfT@intel.com>
 <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d2f2afa7-8fd2-466d-9044-11814183a819@intel.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1730f4-32ff-4b2d-2e73-08dc8f259408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sNTIao2rDAgcbtKWjC7QZ4uFPPz4M/eIRW3hK2pA+jKypY0ZxwiJ/bNR+Yj3?=
 =?us-ascii?Q?exFwgbnUuzPDnyTL+AvyPYqobhn+cBzmgmTdV1mfmZvIEx4BKSeCi4K/b/OG?=
 =?us-ascii?Q?2PI4zxivTIoxpCbku3VIgxAUIKLYMXEZkP4OVoO9QxDlRNhDgxnfn0EOmIX5?=
 =?us-ascii?Q?Bv4/DdXQVeJaaN6hkl21ZmysZduuPh6ec+8gnDt32QXIUo7mhWTSSt8o5diO?=
 =?us-ascii?Q?VAXD1A7Z83ToBN0JzfDU6qXFznXBZbtTN8Y9xXyJr/4cjTwsKhlAtFcoTew4?=
 =?us-ascii?Q?07g4k/+8Flz2hG8VSxomLPtxoqsqfHuoumWe5LB+5VLXffwZZxUCwr8/Bmwy?=
 =?us-ascii?Q?l3xbSuPaDtELCgI2YFW4Rng9VE/cIdtpCICAjv91wfBzH9Yyx/BzlTX/hzXY?=
 =?us-ascii?Q?goB4NlSKuP2oQh1o5XU0DoFbWLNNZKnHnF7rIZ0zGwaEN5yDKQ/5zryDV+PL?=
 =?us-ascii?Q?GeAoCinFzf443V6fSzWMUTAuYHdX+YRWEQ2hF5hcdrJAD8Y6U2GYilpgo3MR?=
 =?us-ascii?Q?vae31IC1wBs+9fIzXZjTyvbMc54NWZkI8cWOIInUlMl9kgUZ0APFKd2vi+us?=
 =?us-ascii?Q?EEaJSiu7FFa20XLFQo7cVATBsIt9SQfh4+wMcgAb0Bvm/lLf+f2d8T/jZyxd?=
 =?us-ascii?Q?Hrmt/CEIndMrsqOFefoHSBecZ8egjpY2irwfAWNle0BSR71DFAbSXRu4f/pz?=
 =?us-ascii?Q?OV2nh7wb28PgR/plDxD6JXlZNGvyaNDlgcC61sTsjCIzKB2TfFg43Ab8XJBN?=
 =?us-ascii?Q?wl8rtEIGfKif29HA7QvX0xrYQGwagKjFkX6klmFoMWLvZ8ENmLSjfw8nu28S?=
 =?us-ascii?Q?zExojbOisid9N4/4CLo1hhbi2Jkxhje7nW9n7Nm3NyL2+zgJdTWfoAfZayHj?=
 =?us-ascii?Q?kh8CR1eE336qPx2Rkn8sfaEO2SeJrBlsBkRLaluEAsQTfkuJb60L+Y9qo8Qn?=
 =?us-ascii?Q?R5dLZW2Lx03GZ4j1NNEzV0nS68F5qJ9HB0RCcUXbRCjknfydiDNzX7u/PilD?=
 =?us-ascii?Q?gkfCIAfpQeGPbxRUFu5rbmST8GQSPrXAeiXQSMR3b6oGJLDXVB6uPA0LF3Ho?=
 =?us-ascii?Q?NmF/D1tZYpIZw7Acptv9YLI/DBXlDt7ce0DQ1LHMYzZcDuz7JXSCXdyiRjJE?=
 =?us-ascii?Q?3ZlPPA3ugqkiWihSSV3DS/JoYe41rDeDwbUEsgDAF9MaSGNTWqWY9TLub1gN?=
 =?us-ascii?Q?mEY+5KEBzBL4ANNbzHRSaJcAH1cRPGqV2HFr1qqRaHLetjfVm715G8WPPhI0?=
 =?us-ascii?Q?1Ku+j7JQk+L7yS14OilZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vqgss4CNXjL4iqz/iK+aqfirbdDWBDR7KMLOI/JIjOoHlHRLGYWbCJLujKIs?=
 =?us-ascii?Q?gVZOhPDTfFp6+aH/LBL1rU8MjJZrznmHAZP664CZctpXLh9oqjCu5Sc/Z7uv?=
 =?us-ascii?Q?48QEd9Og2KQOAJ5IXkMkdq7/8dfZravSCoocqeQlDkd8JIKBvvRIWCmRtGtK?=
 =?us-ascii?Q?OigkGF9FizRIl741Eli3Y0jk3TsYuZTSY2q2Zqep5wv9zDgBUJGwrUyeQ0vg?=
 =?us-ascii?Q?aCFqtS816/a4GyKWZG1nbxvOUsC8E2BnA/fZVi7xDOaD4AawtJrraJQIgxU8?=
 =?us-ascii?Q?s9ETw3GpK61GmixCVq/H4adkJReMtnzjj1fClHmj9HYjsGJJ0GOIGocP19EE?=
 =?us-ascii?Q?tLS7Ww9HYCTbOJK6ZPFNLCrOgx34ugLxN73F4NHzxMASmIXGD1SncxBCY2Mk?=
 =?us-ascii?Q?uYqYdilZqOf54Lqjk/EPQu9q8m7HlVO3Ph+MHWf6mTbmVniTuIXp67nTkd8Q?=
 =?us-ascii?Q?2sDQSpkTnYe07p9RG+zw4dF4GqRz4izNmK+ViODIBeKEfunpGi8iTsYvTtKm?=
 =?us-ascii?Q?UgI9vzmH+b2ilgezJZqvp3yspuEireXKOQVYJepOytj3M6JLQFRwRbbSvUYr?=
 =?us-ascii?Q?tngZ6WhhnXWcCfT+y5JPYDwyo2RAGP87EJi/PiE0B07/UHSTI370bBtMcHRI?=
 =?us-ascii?Q?AidzCH8cuLknE3PUP/enpahuPfdRMw5hF0RL11DsQLeh+AGkfzG4UYduCbmH?=
 =?us-ascii?Q?3jRZvqZogzF+7PooOZq1TdqxACftHhrufh/ZmbEVcT5DPl8RvjVBvJUF9v+B?=
 =?us-ascii?Q?FfosdnnHfvwKPnr0vb1dlIaco3K/3Yp+BNZhblYqkPF6eQyscqfwU1+pvalA?=
 =?us-ascii?Q?/p4K9kJrN09Nc47Xe16qL11TmXv8L7XMWTZcdJQN4lgF/crK83yeFa8dZHE8?=
 =?us-ascii?Q?X6spbTsPFYlKr5z1Pdl9BYvlXTLu/vE2Fw4t+bveOFeIn2p7WfR6sMMGrb34?=
 =?us-ascii?Q?8uPZtNRHLf7BCeWPT/PsytDqZC3dwrc4raX0C83a2sz2oCC4sX5b+PJijMC3?=
 =?us-ascii?Q?8wMNrdM0DLUok0eZHh30Ks6e3XadlroOKcqTiVq5JCNkA7f4dlXNZaXpVUnr?=
 =?us-ascii?Q?MrvswLeG7xpd+xmNwgJ7Ds6xH5ly6vIXqq3X59drWfkHY+03cecOo2NrukTW?=
 =?us-ascii?Q?XbwVbTkI+lFxGtsXwjsjSbuPqGfvqnvcumTVZwMNMHlWetKHXtf1xAy2QPbF?=
 =?us-ascii?Q?YxJtQmbJm3hgdYa6XaWY0zLqh3ueZlqymWkzwkhFEFPJG4Nt7mfwl4FV4KEq?=
 =?us-ascii?Q?kCLcMGnHj1W9r5hp+VLR8w2/CEvLDqzUaumkn1Jee82y/Ok+aKD5ER4zHJkl?=
 =?us-ascii?Q?3BlXT2j8CyrD8eQc8hJuaRXRiLJs/qsMQpHUjY0YW/RZ06/AD6wKjevZ1RJx?=
 =?us-ascii?Q?4/i82joCn28CULHDk+8ta5hLUyx8ZFk8W+lWupkQL4o7PbVYCuMrJxpUzUat?=
 =?us-ascii?Q?P1tNEEc/kyZdOh4II0oNMtayGYtrAHzAd+inLP118HDDR1FiIW25xLUg56Iy?=
 =?us-ascii?Q?ItcI6hEzayfCMQSrKTlaPRJNGrafns44nmvucKUXkKJG1bP9D3mc+Ey+/QYe?=
 =?us-ascii?Q?ZURY9IOKb3GTTmdJgijJYTB7QOxQSPhp660VmPjoeO02P82UR6YeCaz4Ki4l?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1730f4-32ff-4b2d-2e73-08dc8f259408
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 23:31:14.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvHiO39RbpCyfQCtuv8K+TW2Epxt6TBlJNwq6YKAvcs3CFsPMBXsHbfHdzbep18ZxZHITms+0bUcFPGHa2p0zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
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

On Mon, Jun 17, 2024 at 09:24:42PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 17.06.2024 20:00, Rodrigo Vivi wrote:
> > On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
> >> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> >>> There is support for 'classes' with constructor and destructor
> >>> semantics that can be used for any scope-based resource management,
> >>> like device force-wake management.
> >>>
> >>> Add necessary definitions explicitly, since existing macros from
> >>> linux/cleanup.h can't deal with our specific requirements yet.
> >>>
> >>> This should allow us to use:
> >>>
> >>> 	scoped_guard(xe_fw, fw, XE_FW_GT)
> >>> 		foo();
> >>> or
> >>> 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> >>>
> >>> without any concern of leaking the force-wake references.
> >>>
> >>> Note: this is preliminary code as right now it's unclear how to
> >>> correctly handle errors from the force-wake functions.
> >>>
> >>
> >> I'm personally don't like this at all. IMO it obfuscate the code with
> >> little real benefit. This is just an opinion though, others opinions may
> >> differ from mine.
> 
> except that is more robust than hand-crafted code that is error prone,
> like this snippet from wedged_mode_set():
> 
> 	xe_pm_runtime_get(xe);
> 	for_each_gt(gt, xe, id) {
> 		ret = xe_guc_ads(...);
> 		if (ret) {
> 			xe_gt_err(gt, "...");
> 			return -EIO;
> 		}
> 	}
> 	xe_pm_runtime_put(xe);
> 
> and thanks to PM guard class we could avoid such mistakes for free:
> 
> 	scoped_guard(xe_pm, xe) {
> 		for_each_gt(gt, xe, id) {
> 			ret = xe_guc_ads(...);
> 			if (ret) {
> 				xe_gt_err(gt, "...");
> 				return -EIO;

Just responding with a question here - haven't looked at the rest of the
comments.

How is this not still a bug? Looking at scoped_guard, it appears to be a
magic macro for loop which acquires / releases a lock or in your
purposed case a PM or FW ref. Doesn't the 'return -EIO' skip the release
step? I see coding patterns like above in the kernel [1] so I do assume
this works, just confused how it works.

With that, any code which isn't easily understandable IMO is a negative
ROI as it just creates confusion in the long / makes problems harder to
understand. Again this is just my opinion.

Matt

[1] https://elixir.bootlin.com/linux/latest/source/drivers/iio/imu/bmi323/bmi323_core.c#L1544

> 			}
> 		}
> 	}
> 
> > 
> > Well, on the positive side, it is not adding a driver only thing like
> > i915's with_runtime_pm() macro.
> > 
> > But I'm also not sure if I like the overall idea anyway:
> > 
> > - I don't like adding C++isms in a pure C code. Specially something not
> > so standard and common that will decrease the ramp-up time for newcomers.
> 
> does it mean that the use of other guard patterns seen elsewhere in the
> tree is now prohibited on the Xe driver ? like:
> 
> 	scoped_guard(mutex, &lock)
> 		foo();
> 
> 	scoped_guard(spinlock, &lock)
> 		foo();
> 	...
> 
> > - It looks like and extra overhead on the object creation destruction.
> 
> from cleanup.h doc is sounds there is none:
> 
>  "And through the magic of value-propagation and dead-code-elimination,
> it eliminates the actual cleanup call and compiles into:"
> 
> 
> > - It looks not flexible for handling different cases... like forcewake for
> > instance where we might want to ignore the ack timeout in some cases.
> 
> there is scoped_cond_guard() that likely will be able to deal with it,
> but I guess we first need to cleanup existing force_wake api as expected
> flow is not clear and there are different approaches in the driver how
> to deal with errors
> 
> > 
> >>
> >> Matt
> >>
> >>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>
> >>> Michal Wajdeczko (3):
> >>>   drm/xe: Introduce force-wake guard class
> >>>   drm/xe: Use new FW guard in xe_mocs.c
> >>>   drm/xe: Use new FW guard in xe_pat.c
> >>>
> >>>  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
> >>>  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> >>>  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> >>>  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
> >>>  4 files changed, 82 insertions(+), 50 deletions(-)
> >>>
> >>> -- 
> >>> 2.43.0
> >>>
