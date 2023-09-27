Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A711E7F14B
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 01:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A41810E456;
	Wed, 27 Sep 2023 01:06:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8BC10E456
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 01:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695776768; x=1727312768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y8mzeMCv1t4sJaR770YlDfzIbs3LcGGOlHjHKsWlWdU=;
 b=O/MZZAycUQhsm4Nms6S+wHOpo65RpugMBiNt0xmUfmAe7SieZBED5+u0
 96azpZ0SDSt1sVcnyGmPN5GvQB80NSnogWl/ZZ/oBezDxEB0hICD0JFvx
 5SNmwOQfUoL4J0y5rbt/CtSMNPOTwJhODB+Octy8214NfHp/h4F0qn38S
 22exPdJdPsfdCOCgMLR0NPpilk1ltV70/FxKYYUvrdUz2L9A7yf7HevMP
 ru/MJmSG83x9HifMLyFULpoY9PqNRyPj0SnnEox9iP12fptiIXz5Ixk66
 CshhlWkRJTL7Oz18tLUn3fhByqv/SbWKpYJbhGhqMVKmWNd7RMp42kuf1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361083616"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361083616"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 18:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742528758"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="742528758"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 18:06:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 18:06:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 18:06:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 18:06:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 18:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtTM7kYH48bDdVBgEYadNd+izV8B7MxyVX0FcH6+/8gqffKXkFbBBEW8TLukHdJnFHQCafBkgvcHMMwBY4Tz188p+PptNxzPehV1vj5YUfwD2/BNmIMOMDYjwHzps3ZTSv8nG/uu0t712WNxKJFCa4ow+0h1rsm9ZDN3L3vVYmHV8Zf1T9WGMa5X9Qj2ZQO3gxnrVj97IhhS6s7AtkGGeDL2SsYHARkZWGyRfdkqapyuBZED0lB/QvO3FQKghbbfTuaPUtoNYmO5r8M+9wD1tYVSduCyiHGH7xFS821lUAoi/spegd9KrDOUBrrBURZ8RGd+9TB1BVjuWsziXYG+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGx2AtdvS/NXhfceVmbM+k/egqGHnhZJ+YcyOsNOzB4=;
 b=HubKReJR9HjVUdLA5f2aus9/vdg6o7tqh3r/ExL2t0OEKSzfBxE56TXgxHLGiN+3GgMc89JPqleE+NTTJEqNHglNNuW3ffnp3TWy3i0jXzkeOZVIiyUnbpoDAMv8NEKQi3i9evM154ZhoN9F5EmHfMUPfI1rtT4YioL2+ZsW5PkcmPwA9UjAvLPPnDkEFUeGuvHMFJVP+ubCCSvwXlh5JycUKspxKHSIKZK28adTIur0qS1y8grXPunIh1tQYb6Aur7EgRtbSf3/qzQKpHmRLCWkPL/MlyD8faM/YULXx3QWYbj+wxhdKt+rlEbAAf37uu1kMjNIjBHBl2uIcU3Org==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Wed, 27 Sep 2023 01:06:04 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 01:06:04 +0000
Date: Tue, 26 Sep 2023 18:05:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZRN/8lN/1nCuFwj+@unerlige-ril>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
 <ZRI1yPmabDfopQ77@unerlige-ril> <ZRMnbYcsX+GSEgA3@intel.com>
 <ZRMp8rRXkuybDH3E@unerlige-ril> <ZRMr6JXpSurNe90N@intel.com>
 <ZRM2avt22erTAimS@unerlige-ril> <ZRNQRSE3dxYTCaD3@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZRNQRSE3dxYTCaD3@intel.com>
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DM4PR11MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: be5fe281-3af2-426d-aca7-08dbbef5ebbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AyP4GxouieK2vyPCVRoS17VDaRjLKR7Sy36AaG/VJTqxa+Fs2Mgql9fjdn+NeKdxufHdyx4G8suNM+ASW+2rHGpsFWbV2xXlVqdreViveC7SFhF4yeVv+EkEAfLM9lo2qojoQE3IkEfmLFQwNEMpRxIZUiEfMsP0YGHcLPWLMJ6T5+22YlrlYcTqSRr7QtMTTxQAhHuBKJK5RaT8pEKz2i2ttehi28x5jdTwu0AGxPy6Pdayz9Nk1znzRB+FJijs6gKcZh5Kid84J97xX8x8EA6df+Qgs9DoT3h5ummsPd6QToC3EVXCDIQdHphAC0pfp7Rc79nZLGIieaHdszfCd5VKoJKcBkRshFgFvD7g5LFtKKAbVfi3JQdoyu5j9XaJL65jMZzivH+Wk4t3A6xqcaGDw1OwPkLbrAtbf4Bbf3uqkXF7rAEmAP6Vp5KqB8kDWz+r32PGtBXN1tqyY3/8b2KlbpCZqvUB8CPG7d7BQ/c/Zx2iSXvDgSPvNIcXRnEWLt9yHZUMAaSGCW/TBelpiE6e56/NzMdZgjhKr7jT6uRiwq/LeEXAFCu803A3MPdQV7zNUvcpqPRJWdd9I6YQ5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(26005)(66556008)(316002)(6862004)(8676002)(54906003)(8936002)(66476007)(6636002)(66946007)(6512007)(9686003)(4326008)(41300700001)(107886003)(5660300002)(6666004)(966005)(86362001)(6506007)(2906002)(82960400001)(38100700002)(478600001)(83380400001)(6486002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFUK3A0d09HK2FicEdad3V4UWZweWUyOCttUjFoWmlkQ01BblJBeFNkTEEz?=
 =?utf-8?B?cHI1YzB4WG5Qek14SWxOWVNVQmVNTkxZMzY0RlQ4N21WOW1IUWdvYjFmblZO?=
 =?utf-8?B?cVRFUi9jNWwwcmdrbkc0QmVRNnBORDh5RVUzRGlUb2hObjNwODcwVjZGSnBz?=
 =?utf-8?B?S25ia0tiT0Ntb2tKUkRoWVNKSDBUUHhsUHIweEpLc3ZlZU10YllzdGpXK2l1?=
 =?utf-8?B?eTYxY1NkcVBIWjFqcEdJbWlLS3llMW5wSzJhVE5COHFnbzYrNzQvcThsOVBr?=
 =?utf-8?B?L0VYUXhtNmhlZXBXT2U2ZFJkL0s2dm9pSjdtcTQwZTlMRnBIcDl1cUlQNVdi?=
 =?utf-8?B?a0JQWSsrMU1iNlFHUWR2TFA4VFArRGJUMUhyTUtlL3hlNHR5NFJ2cDR6bXo4?=
 =?utf-8?B?cWpEL0RQaE5aNStJZGI4b0dETFRoSmJsL29ucjk3S0t0aEtJTnBuY0J3d1Yw?=
 =?utf-8?B?RnFGUzFjVVp3SHh3eUp0ZkpCYUFDdzlVemMwc3c2RGFmdSs2QUJVakltZGd5?=
 =?utf-8?B?d1BZbDZLRGxpczdndXpYd3JTWWplQldwNEFOMVJUU0xjK1hxMmxVMVUwVmV0?=
 =?utf-8?B?bGUyS3p2UFVwY1B4dzVDYm9TNVBmd2E4a0wxZWdVK0xFNDg5c1NQTE1Lam5t?=
 =?utf-8?B?dFdaSVNFZ0lVRDlrNFY3NEo0eTgyM1cvQmdTdnhWY0I1blQ2M1doM2d0OHJ6?=
 =?utf-8?B?QVAvTXUxcFFEMVkwektqYzZ0Y1d6SDRwVlBHS3J3QUFnTUhLWU02VUdJUkZv?=
 =?utf-8?B?WVRwRnBnQUNzR204WThodTZLVFdnKzZqN1hqVTBoRTJsRTIzYWFHQmF3ZGVM?=
 =?utf-8?B?V01ERWtWMEFPd1E4OVhabm55MGZRMGR4dlhkK21rZUJNK3JxUHVJMW50UFhr?=
 =?utf-8?B?ZEhVY1NFdkNNMUhSWXFsWnFWVEsyRG5QZWpVcWpXc3NGcTViRFl0NStsVDFy?=
 =?utf-8?B?WU5BMEpEQ1g3V3VzanltTzhPSXMxZTRlMVV5MWNpZXZKaUtEdjFVMk1SOHBh?=
 =?utf-8?B?M0pWU2V1R1R2cWg3MkUxN0Z5MS90TTgxREVQalRSNHJWU0I2di9PeVA1OFhJ?=
 =?utf-8?B?K3Nib25VaE04cGc5dnlaOEc2ak55ZFZpUkU4bFU4OE1waVRSRjRsQUpYVmla?=
 =?utf-8?B?a21LdWdRcEJJelR1M01ORzBHNFYydjMwNG9LVEhnaC9Wa1Q0ME11M2NPK2pD?=
 =?utf-8?B?am5xaGdVeE1zZlI0OEk5ZGVUTngrUXM0YWsxaklhRWxacEYwQzJnQjR0LytT?=
 =?utf-8?B?eTVWcVpHQWFTVGhjbVZGNlNxMzF1ekI2eFRsbmltN2RZa2hzODVTc1crMzJM?=
 =?utf-8?B?V1dZVkkyTTk3bmFldWY3WTg5T0tnakl1Qm1lNjY2djZKUTI4UmlHWWxnemNH?=
 =?utf-8?B?MHpMRWxCb0VCbW8yVVBkd2xMSXMzYmtRU2ZqZHo3cXdrTjdyUXJEQ2hYTjdx?=
 =?utf-8?B?U0tQd3k3eGREY1ZIeTd0YjE2dGYybjlzMjZaSXkwUFRWZzJBSVpYUldwSkZ1?=
 =?utf-8?B?dVVldnVDK2UzV0ZoWWRJMEFFVFF6NG9VQTVEMUwzQWExTGpaZkY0dTBBb0Y1?=
 =?utf-8?B?ekwvRXUvSUdvNXVGSG4ySFZMbk8xa0hYVkdrV01tV3VoeFhhdnVZZ0J2QTBl?=
 =?utf-8?B?NTQvaEF2S0paOHR4dGpGRHRKU1lzSnhyakdKU25NTzZGckNQTE9NNnRNTzJP?=
 =?utf-8?B?MWhIa3A5aE82eGVrRzBLNEpCaGVGUjd3VFhpWCtaenRsY25iR01GdGQ5eE5U?=
 =?utf-8?B?dFBzOTZzdjlSTWhKRFNMN0FrV0gyYkJJdjBMSUYrV0hGVVVIWGxnaVdOVHhL?=
 =?utf-8?B?TVJOckoxY1hzSlVBcTNHUzh1eSs2RXhLcWRjdVRoRHg0Uis2T3BhY05KTmVB?=
 =?utf-8?B?Zm5oMzVsSmFWTml2RVhEWG1Sd0d2OTFZUU5MK2tucVgveEtwbVJNQkRTRE9t?=
 =?utf-8?B?YVlyQnJ2RFpRUk93eDNqSkw0bWZLcGUwOFJ3aWNzL0FJWXZRZ0JuWjY4T3pV?=
 =?utf-8?B?RUtWakhsZFQ0ZmdQOStBVUJkeXJiWU5QbzBQMlNKRUh3a3hGYU5UeVlqSi8y?=
 =?utf-8?B?bjc1WmcvSlhpTENOMFgxYWgrbklxcHRheWNobTlqdDVuaXIwZmZ2Z05OdXp1?=
 =?utf-8?B?b3NZTGlTQnZqUGJiekk4VFdyd1YwbXBMeTVUeHBlSUZTRFR0UzdUQWNYbHFw?=
 =?utf-8?Q?r4Bh9SRv1Ld7YL4O+2E8n5Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be5fe281-3af2-426d-aca7-08dbbef5ebbb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 01:06:03.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lA9cOSQsYJS6DOV/zvk+nWQWawhCxJYVIPoDMqX8jFECF3w2XlW6jTXXBBcrn3yvr8gjJQ7DsRCZ7CoiQofCP9i3E/fvwg9iSDwPoeGsPOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 05:42:29PM -0400, Rodrigo Vivi wrote:
>On Tue, Sep 26, 2023 at 12:52:10PM -0700, Umesh Nerlige Ramappa wrote:
>> On Tue, Sep 26, 2023 at 03:07:20PM -0400, Rodrigo Vivi wrote:
>> > On Tue, Sep 26, 2023 at 11:58:58AM -0700, Umesh Nerlige Ramappa wrote:
>> > > On Tue, Sep 26, 2023 at 02:48:13PM -0400, Rodrigo Vivi wrote:
>> > > > On Mon, Sep 25, 2023 at 06:37:12PM -0700, Umesh Nerlige Ramappa wrote:
>> > > > > On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
>> > > > > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > > >
>> > > > > > Perf measurements rely on CPU and engine timestamps to correlate
>> > > > > > events of interest across these time domains. Current mechanisms get
>> > > > > > these timestamps separately and the calculated delta between these
>> > > > > > timestamps lack enough accuracy.
>> > > > > >
>> > > > > > To improve the accuracy of these time measurements to within a few us,
>> > > > > > add a query that returns the engine and cpu timestamps captured as
>> > > > > > close to each other as possible.
>> > > > > >
>> > > > > > Prior work: https://patchwork.freedesktop.org/series/87552/
>> > > > > >
>> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > > > ---
>> > > > >
>> > > > > Should already have an R-b from Jose based on this -
>> > > > > https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1
>> > > >
>> > > > While incorporating that and fixing IGT, I noticed the inconsistency
>> > > > present on the v2 that was not part of v1.
>> > > >
>> > > > Why we have the struct name as engine_cycles now but the query itself
>> > > > is still cs_cycles? Which one is correct? why do we need both and
>> > > > cannot align in a single name?
>> > >
>> > > Jose had commented that XE does not have the concept of CS and asked for a
>> > > rename to engine. In the latest revision of this series, I had replaces cs
>> > > with engine everywhere.
>> > >
>> > > We should use engine.
>> > >
>> > > Latest series - https://patchwork.freedesktop.org/series/122440/
>> >
>> > yeap, I got from there...
>> > I still see
>> > +#define DRM_XE_QUERY_CS_CYCLES		6
>> > there
>> > ;)
>> >
>> > I can do the renaming locally if this is the right thing to do...
>>
>> oh, I think I missed that. It should be changed to
>> DRM_XE_QUERY_ENGINE_CYCLES.
>
>while finishing the rename here and looking to this query, I got
>myself thinking, why isn't this already doing the gpu_timestamp
>calculation and showing that directly instead of sending the cycles
>and the crystal clock reference for umd to calculate?
>
>the gpu_timestamp directly would align better with the other fields
>in the struct. and by itself already avoid the gt reference clock
>duplication in the uapi.

Depends on what the user is using the GPU time/ticks for. In OA, the 
user space tool compares the cs_cycles directly to the timestamp field 
in the OA reports (which is also in cycles). Providing both ref clock 
and cycles gives the user flexibility to use it in different scenarios.

Thanks,
Umesh


>
>>
>> Thanks,
>> Umesh
>> >
>> > >
>> > > Thanks,
>> > > Umesh
>> > > >
>> > > > >
>> > > > > Thanks,
>> > > > > Umesh
