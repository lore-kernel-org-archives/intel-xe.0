Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE80C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 15:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADD610E029;
	Tue,  7 Nov 2023 15:24:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065FE10E029
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699370697; x=1730906697;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ncvCG9cp5SyupcR0odj9hJ/Zw0J4xfpqV1Mvseiz12A=;
 b=b1Xl1GMfWEKGBw37HOnL7aKWpD8Z9Woo6OAAxcXbHudPAV4dAM62aPle
 hGVQyl4CApucUtdt/73BFSM7GrQaQj0pHdeFH6R2CQ4d5uoXMzwlpV7yf
 3nVP/ZqM15Y5Bbeof58LaYct5I+DwYfpNp8Sp20EctlMo4cLK3Ku2nXYI
 q8rcjxJ+DCxPczGKmKMIxCz/XaHZ4FkaRjnterjMHVFbODVQwNSi37F+x
 ejo0X1KCZ8WoT1LA9C6IaMYeZukisN1bWDEM1bPnV3tJ1fbo2aIV/SvpZ
 JI2vmBkW3TAzQB86ancuDBgt9ai536P+fSSVAp79k+oeRJbIsVIgkJd3A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="379928151"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="379928151"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 07:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936180141"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="936180141"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 07:24:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 07:24:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 07:24:55 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 07:24:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih7y1TBpiE5IF6g3BGOFK88RXV6gb8R9Ct8ULjhQaec1lQaGnSCSF9PLBmnKq0ueG9iTM7dO+qsVbz8uQKPrMBXJvIfXVaBuMqRVg/ZfJ9lhxR/T+npNFWUAWlIjs75d4XQyonKFzJNHT+JiJDvaaMAC6woclLaafTGQnkybKyJRE6n30bZ3TMWqbbJ6+tQXWQ5pfCdDt8JzU2Ru90R4HuegjwygWlFJ0sLmtY4QEQOBkE0aQTzT1SfoJyua3xgv4TihIxiVxjSekzeZHdDmUssnQE3guKJpJwfGJ4fJz21MEMbrQEtgthGVat48h0KIThGkJFyfB2CKW4XE3xrMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4rTozvoZ0Nt1H3JcqhCqa1bifAll3Z9sOrYqMcPniU=;
 b=IAbwiZntLlRBfYHskmSQ2w3P3oIdG/+RZDf5V5z/4ux6XA4PV8kNtftxPPBrOXb1TI6yCrrYJtWDImC1uYKpCfbl10waKDpOUOKcntF/lGbk731fTGYANo7L3Qd3VisvhzqBs4bQIqe5x6507/pa1rFYckHJNE8+hJuqhTu/wIDouHQaiqG0vbsPtGXOQ/mrfHGa9g9xXtu+SbpVpqGA0JI/yz0sdpyEa8r/j5UU1PdRKuP5SvTjq39ijkp3FP5J6f5Blvw6fAB2bNjNNMIgoFXlAkLglBL03JRyrRbAjNWW2H1uQkF45OiDifWwYAT3G4jXsTP9RrnrEMf5db0PKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 15:24:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 15:24:52 +0000
Date: Tue, 7 Nov 2023 08:24:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dani Liberman <dliberman@habana.ai>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZUn0KKfkh1VZg+dL@DUT025-TGLU.fm.intel.com>
References: <PR1PR02MB4761814952E677B0354DDF0BAFA7A@PR1PR02MB4761.eurprd02.prod.outlook.com>
 <a1698202-65c1-a307-8b5f-01389180c36c@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a1698202-65c1-a307-8b5f-01389180c36c@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7f7eef-e1ec-4fb9-c785-08dbdfa5b068
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWctgm9XDo5x+2PPf+kHjSzltQngnoEoWN5DSBLhrGt595BWESwT2FZeccB4VwFnV6HWRmv86eUqWc5F8iX3ymEA/p3hR7cBBYEB59A0p4Yf/6eMxClLwkHj31NVulo1mIkrx0FGj2HeASQkNzUPb92u4I54QGT6uT69dqZ45kJh/0Wy0sCTeo4MT2P8soPEqVKdo1pi20FwkT0a34ubqtHPg0x78mZaicxUP+7pDfM3EYsC9yJtjStB1dtEaT7yS0zpUDoGK+Su7rOwjlwOt9I8TPwkZWiApw+6AuqSdAzV0nH5uIlzG5ofdQgYs8WjhjjyAfsHocHe5R376iH0CeIzo1IeO9Z97STIIb8kcwceNmh3imZHFz9cBvLIWWzbvFP19b3NTXBxcqDcrazjfZ3+JpCG6/sRN7GWAnMnZZ8cX8FmGaK5YxOdHGTHPvPtIDzDDSkBhaVan/o5Tm+offj8AQPZvG1IEld46mUsBXLkq6SqUDIK7d6Alt8BAk3AeZ3glgYdRAD0DLb6OFYMfxcut573Tudmx72Tf+s/LTmkw8DHSjvEfRLeqstebywPytMA47iEc9z6HH2mZLPvWC7nTkvizUY2ZWVklh7M7qY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(53546011)(6666004)(6512007)(6506007)(82960400001)(26005)(6486002)(478600001)(38100700002)(66556008)(66476007)(66946007)(8936002)(316002)(44832011)(5660300002)(86362001)(2906002)(41300700001)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w6gzJKianuv1PhszzVQiod2SMYuNCcc+UHk82n1p3MSv7Ahqha+WPyb0qtLu?=
 =?us-ascii?Q?gjdp21SEccrWh1D5mr8cR5wqKYki45hsczzWDSC+sD/efTmMtau7XGDFuECe?=
 =?us-ascii?Q?3k21DhHcbncLDmwWE6Hpj76GMdRc519KlmGSTX9xNU+I5+rufhhE/qRjsNvY?=
 =?us-ascii?Q?V9h4wZiKHRyn6xj1sY8nEt6kJkP/WBlbhf5yXIA1GWn7lvBbZjyTLslwPfmR?=
 =?us-ascii?Q?6vyGMq50048eLFDEAHf+tYQGRGn3goOPHDNH+tha9E/inwwQ277TS3YSSO/z?=
 =?us-ascii?Q?oZYv0AJVxO1omjd+oOqx+HY+CCbOmu85Hta6lCH3CIgrV0otAhdEnORhpIHW?=
 =?us-ascii?Q?3GmQL2jQZWfEO7t5jQShEmLkYUx7Gpukz7Q28vt063Q24ELSSsFsaJx3nWjf?=
 =?us-ascii?Q?FTt/vgvYIcEdwpFmEDfs0KEALpK8tdVn0uVOHOFpm17SUgm8FEl3BlWA2vpB?=
 =?us-ascii?Q?8lFJ0a/AP5/WyvZYGDGC1nbBddEgojya7cCrxqjT3oOdCNp0GNfvQ6+YUH45?=
 =?us-ascii?Q?IbZKbeiw/mjpvkQ8gyAoHY1c31VcsUQuOCfIgJZ6JxHB5mUG7C0+SxheZ4mO?=
 =?us-ascii?Q?+U4f7bTjJRU3dU+JZdPgW1aR+P4GQlm3Gh2wboTYyoWmResvwP6271sFhVHg?=
 =?us-ascii?Q?UuEoexejdLBqp2CJBVAm5lQ+BIGurnBawJfjezlwRkapCZbV5+pFDHjkca7o?=
 =?us-ascii?Q?dx1MNFiurVSA9MFuj35AFiR+rCroaGq2O5ko8AcANa+9OysiAUry3RsRknnu?=
 =?us-ascii?Q?dF6BNR7IUeEZpQKB+3q7c966xJe52VI+Dt8H0K/kRn2IdSW4w9SnXFwnp3kr?=
 =?us-ascii?Q?5EC18Ya9g/rUaL7plsIzKks8boo8/cCVrPPLKyd3zwP/oZQvd5Zi1IEer6kv?=
 =?us-ascii?Q?Yx4WEnqIhfcL3KJ1riQYvPChFE9OynewQuX9lFGXM0S6kT6AwTw++RpLmQwB?=
 =?us-ascii?Q?ZfrKM8U/a8mxx4Mpv1y+UDdOmd0cDQKtgwsXo1jDtWtZj8Jo9P703uu/RHpU?=
 =?us-ascii?Q?zgUPBssUIobf4+mLAsZ13xh+f7rC5CnfkL1VU7DN8FrGfXjXb2TTHccHEU6M?=
 =?us-ascii?Q?2JkcbB+/BX+X8RSHhp9J4kC4De42wYuoS2lzbreLe8KkMGMdzrzjUfq0DOwB?=
 =?us-ascii?Q?Nwj76tMcSjj98DgyYvQyOfTJwJu7RVvw5CwX42ks1IhMvg6lydnKA0Yd8QUH?=
 =?us-ascii?Q?KJrjmjGQ96GcpiWH+lElecwAa9+FumzhEj1HG2L+T2Gx+xpdQZZaM/CJYGWK?=
 =?us-ascii?Q?j9OJrDlRuf+MAdPIg+mY8AuWEvBDD2jkddqQepMdu+46kVwhQBN+kZRyExY3?=
 =?us-ascii?Q?BXrt3wg8H54kAGiYYn3C7MQNL5IRzGFXth5gfexfkULKgG/ObT5uflyPOmaa?=
 =?us-ascii?Q?uH3u2Dke3Wrns5YRm7d1Dgk2621KMW1CUz9NskZan16ODahelPbGo/GWOg3p?=
 =?us-ascii?Q?IQEvvhJpZrblNLeTekb1HMJ5z8ea4xWcG9NTBHkgAg7XBC+G6BS60bnRqfKL?=
 =?us-ascii?Q?K+DJiB6gNVHez5kEgimKqEVOLML8oA2WZV6n6SzlGigzc7jfpmkoIEfZTnaM?=
 =?us-ascii?Q?39VWtw1pAcj30dATNggJnhaoeIRKQoE66mwev4DnQnbGql12f5Vbp+V+0+C9?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f7eef-e1ec-4fb9-c785-08dbdfa5b068
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 15:24:52.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEC6EzIP2YLfdngV9ewQB2UiP6wE6vOd1UKonXoPvJUG2DQDRj9J9619TJW2110TDSewz28NIRI0v1nbO7PtPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] XE sched review
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

On Thu, Nov 02, 2023 at 10:40:38AM +0000, Dani Liberman wrote:
> On 01/11/2023 17:33, Dani Liberman wrote:
> Hi,
> 
> As part of the upstream review of the Xe driver, I reviewed the XE code which relates to the DRM scheduler. Here are the issues/questions:
> 
> guc exec queue states:
> 1. Please elaborate on the states as they are very fundamental part of the guc submission (banned, destroyed, etc..).

A lot of states are to track the state of a exec queue (resolves to
guc_id) in the GuC firmware to send the proper H2G to interact with the
GuC firmware. I can take an AR to post a patch explaining these states.
Also will post a kernel doc patch for GuC submission in general.

> 2. guc state is an atomic variable but there is no locking in the sched related code and the state can be changed right after getting it. Why not change it to non atomic variable?

The only reason this is atomic as these bits are in a single field (e.g.
if each state was a bool this would work too). Another option we
introduce a lock too. I can scrub this as part of writing the kernel doc
and write up an explaination on this.

> 
> guc_exec_queue_run_job():
> 1. if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)): in case this condition is false, and the job is not submitted. Why still returning fence instead of NULL?

The TDR is used to flush out all jobs + signal fences when the exec
queue is in a killed_or_banned state. We return the fence here which the
TDR will signal.

> 2. I think that register_engine() shouldn't be part of run_job:
>    - It is part of the init procedure so I think it is more appropriate to put it in guc_exec_queue_init().
>    - Not sure if it's possible but the guc status updates asynchronously and if exec_queue got unregistered (after g2h XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE) while in the middle of run_job, we might register it again.

After a GT reset we'd have to potentially register anyways so we'd
always need this code path regardless if we registered this in
guc_exec_queue_init(). I'd prefer just to leave it as is.

BTW, s/register_engine/register_exec_queue. A few other instances of
inconsistent naming in this xe_guc_submit.c too. Will take an AR to post
a patch to fix this.

> 3. LR: AFAIU LR exec_queue will use the drm sched only once and we don't care about the result (from drm POV). Maybe in LR mode, it's better to move the submit_exec_queue() right after emit_job() in xe_exec_ioctl() and
>        not using drm sched at all.
>

This is true but for simplicity I'd still have everything routed through
DRM scheduler even for LR jobs.

> guc_exec_queue_start(): using deprecated function drm_sched_resubmit_jobs().
>

I am aware of this. I forwarded you an email chain about
drm_sched_resubmit_jobs(). A few other drivers want to use this as well
so I believe this in fact is not being deprecated. Will keep on eye on
this though.

Matt

> Thanks,
> Dani
> 
