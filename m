Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA00CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A003810E886;
	Wed, 27 Aug 2025 18:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSPP5jXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C8D10E886
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756319280; x=1787855280;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9HwZxg3YAHOH/hRxBEUks5vAemc8JIH/luCDJha+Vg4=;
 b=SSPP5jXOoORfk3EDf/HLPlE1TkLZF5GFPHD3qvmkFWf4vis171OpCzO1
 V7dmKITS+EiFS2FwkSKhX4l5f50W14BZ6+aMS/hAJi7mxM+l5JNTDS61u
 IvK99XMUNl1zmORSuxGm5ABQuBKCJiNkfuBPtuSzqfg3yPQ/SDx2oeHSm
 9FIX5xYYNG1m665ec2xo0+K+BnfLUksgnHkNhiMWsTGIkMD4b+Y9G0zeb
 cV5LroDjI4zUSq41h2NECCHGaVTypL6bOoNQ1jIiFxGPIwfwob2hLklhe
 PltooW+mtymIbDUvjI8yQSa9FcQFEiVyLatyhpiGzMO6WdAJ0ELtau/+U A==;
X-CSE-ConnectionGUID: 360FvIqDTv6KM8hfkl28yA==
X-CSE-MsgGUID: lK1FUXCtQZmmw1hV6vxaVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="83985253"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="83985253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:27:59 -0700
X-CSE-ConnectionGUID: xPIixKJPQ7GmohgWjCAEIA==
X-CSE-MsgGUID: yPeIsyoaQoC/dNHV+XrrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170727445"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:27:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 11:27:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 11:27:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 11:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOAV56mnXStuh2mc5lxAn04LELUDEta9QszXcLFXWzIf53Y19rtQ0PnpST2JltMDviklMaOjl/iOl0dtBxG3mPr+aHWhD/wi8d73Rjw++jkhjaDR7eB4hpeu07NkFbdlKmX31hfpFl6ATA853u/NSOUMQQiglup9Z0cBCS7a/NgnJ/1JZ2F/XvMxnj+N5Pw0SJRroJ0J/ffDDmuJ0ADyx6faKi6fH8qi+U5F47e5erZbk1s46elMu4yE9Fhn3lAgLqxjBdTK1QILM9YC9fpHbRB8052PKTPbPuTaqNgIXOzJ3DIM8ZKirOTRL6vD8F+7VebGjMjnsaFufiFllh17QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VMQpRHOxKwsVE1uRDzqiJyb6jPvlkXvr9ckT/E8rBE=;
 b=q0PVVNHkiU/dQfLRfHXlHr5RgZu70oOr4j5LQfgiqFt1si218N7j7axqAFtdzAzbd8mahw6jo7q8R37uMy6JHGqfQfGmly8Z71gy2QQEXkdGdi0hkwcD5YlQciwuwcs6GIY68qfolxxTLoZ4VOsnX+oO1Xk9GzBSw+xcKJQhbu4NJa1QQb9nJJdb3AZscgW1PhlG1QBY+P6pxaV1Hx8Ji5mQ02/g72e4K0kZB9sWYRf5Lb5jTJaSENviPavTVP958zGrHbMbUM9F/QPyayz3kL1qP8gSeaBMky6VPGqqUDTZsq40ixWsZdF+XXIFUXxUAnk9tb6ZuvX5xAvlYAC+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 27 Aug
 2025 18:27:53 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 18:27:53 +0000
Date: Wed, 27 Aug 2025 11:27:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Xe.CI.Full: failure for Add TLB invalidation abstraction (rev12)
Message-ID: <aK9OJgGPzhY1IOcb@lstrano-desk.jf.intel.com>
References: <20250826182911.392550-1-stuart.summers@intel.com>
 <175631500151.275222.11845350823378680006@1538d3639d33>
 <7595861f10e908cb29e01186bf3255f4d39c914a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7595861f10e908cb29e01186bf3255f4d39c914a.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cebb2d-bd65-432a-5e1d-08dde5976f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yPBBqXJGYckJb/O7De+isfroZ+hC5MySY/n1zw+goREdZ84Img+pwiHpoE?=
 =?iso-8859-1?Q?ziwaiX6eY6GeP/oX+TJm3fZMVBVLN5jUWD293ZUPXwasRmfOfTIKxzOyiA?=
 =?iso-8859-1?Q?lUSzcv0UKuUNV/Qod3Yf8YKEAqnlpsCl/bZO0q7IFRF5z9s7x215AWpcrB?=
 =?iso-8859-1?Q?Oz1FLjisaddsgqRN2qO27lFmzxSYS5BHUx/PF17iu+QYG4R1iz7WBmkz15?=
 =?iso-8859-1?Q?iRn2oaK6/9MbciZ0sQ4UPQi0G3z/yTxeZwE6iv5yG+V5xpWxAA3rAULf0d?=
 =?iso-8859-1?Q?pnXgd9TD63FLypLRNxpZ6emuMtS8MAf2EJS03QdWsV2a8+LAw9LSkTVRN+?=
 =?iso-8859-1?Q?ouAd805zAcUghEjmeC3V6svxMOfhfSXifZR9fhEHhcMLe4cw7ADOc/Ll50?=
 =?iso-8859-1?Q?yABn3rQWpt4S8RnVZ72i+yZ9RfNzJNz8hQXGMfAw1djpX+Gndlq0ap4yO2?=
 =?iso-8859-1?Q?DIrUTH3PjCeDSim4yZOeonlpK36ANQkPxyIeK/JbydU7IyOhss/xk1LhVw?=
 =?iso-8859-1?Q?OzrkVHcXYdeSvlDB1yVbljpQNCAYekRfWd1wWM0agg79Yj+1cnkmYsOOtJ?=
 =?iso-8859-1?Q?NLbq95l1I9k5qHiCHMsjqmoyEP0g1Z45HGWPXhvCvWmMlbS7knll7cB6fJ?=
 =?iso-8859-1?Q?rrCwdE7UT9GuOmshLWAth2ojRB5KQEGi/Ai1VhE05aUxTGr/Wkf3HrJfA+?=
 =?iso-8859-1?Q?e4jBxf35GqTrin3Ob57ZaPx4OC+pL5kkxeXnCevaLohDiY9qiImn8oUqyq?=
 =?iso-8859-1?Q?/jGKw4lt6OXgi5J81FilZvAuLTFDwfzGXnxHnohrTKG6k5D0h2shE9id7c?=
 =?iso-8859-1?Q?EowIhWa80p8uy9ubiVFd/CRlLUMN9rCovMNs3BGKgpU3tqwwjZBpyZ2E3S?=
 =?iso-8859-1?Q?X2szywN0K9OnZho6LTACeiUAI2Wnj3AU66Sf4yKqxecYH5tAyjdZmMIJJe?=
 =?iso-8859-1?Q?U/sGCowERw4GNUe+7Jd9RlFngFpu1AdnhtyTa4fxxlJVJelebGvckGeENq?=
 =?iso-8859-1?Q?M7V7ZKM4T5gr2bVtXMOWoFLHYIADscfRyB91uZtk8RFmfaj3caFu1cehBR?=
 =?iso-8859-1?Q?FA1SFc/raqBSLleO/gtobBMnmU2Z5T60/HNLQ96Bde0YOJ3A+CJyyGZbtu?=
 =?iso-8859-1?Q?I2mKVAlSt86JaVCUksQk9dBe6iVMDDH6O7CEdKs13PqDOxQ1i4SSVfGzjw?=
 =?iso-8859-1?Q?FDS4h/HIhCJHAvkxXj2Ub2+s/UrnHGfkEQiGFd5LAQgm51zLvqsSuCEeeI?=
 =?iso-8859-1?Q?S/yxgLeGGsQKMzKJEc7tvcwAms321v+lVuOvykPCEvs2J56QXEXeOiJF2l?=
 =?iso-8859-1?Q?axrDur66XjwtoC3GWBcNXbjXkZNIuJEvBtQuvfD+/jIC1RndWiCZOwW3g7?=
 =?iso-8859-1?Q?MjSeKXX9loRYLkFd4etR8+mnhL/NLvX9R091cWoow/P7eNVhWdRGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0bUErxMgMpdBAilX6NumxBxCdk1UyxDVVhZ/Fr1SB47QL9U56d8LFPLsYG?=
 =?iso-8859-1?Q?nleQSD0gjxlpIbk5o8vuolbQgPe1FVZm+eDFu9ByyVTZWUGvEwR0qgOmWZ?=
 =?iso-8859-1?Q?EOtpcX7n0xMaPgrzbANZJfKrwyFnAT6663VIOXuUKB/Fk39JEfW6dkMp4B?=
 =?iso-8859-1?Q?GSBRqiUe96EeQ75NBwEYILcGCrgHwsmpXsGzTaENkjsiXDq4DfOke/PZva?=
 =?iso-8859-1?Q?9zNHhqH4RctPcAoqP3LLc+0rsg7cN/Mw8zSDz21s/Bpz5ECnWJUvsHYImM?=
 =?iso-8859-1?Q?N+HLJ6AdXjPbkSb6JPTliRW9hAqOndfF/Klmg1vm2WrvceVLkrsI6xmUfo?=
 =?iso-8859-1?Q?7pIFZMiRMee0xls1EyLxYzQ4wmitNswELJ/7q3esGYZhdWR4UwbDOD2au5?=
 =?iso-8859-1?Q?LkDBXUPfrUivy9gAM7pLEyhMe6sD+ckVPjZg+vBq7m+gCwKmyMpyBs3plp?=
 =?iso-8859-1?Q?2xd/9Env0DtW5RbpskDBk8ZJx6sJ030Iw3HAmFcWTbHMZ080OP39Iq3Zjx?=
 =?iso-8859-1?Q?VTyayIXStR7wQyqwgyEXBlWYWiYM/HVVs3/N3RXBhs1RBFfhWDEUGx+5Yp?=
 =?iso-8859-1?Q?xR/URFr9hjY6hxZDr88oFArNCsw2MXf+Bb1cN/zNinvCU2PLjXZMLjAFBL?=
 =?iso-8859-1?Q?i7SxHGcYjvsR9KSRFyJJLD5nCyn7wls+TVKTKlN00Xic2+tthEMA5PxMMk?=
 =?iso-8859-1?Q?Ms1CEKbsZ/HtSlzwbl21xYMTvG2ThmCE6Sa+9JtmdgbPwGIJiOMXSbx47p?=
 =?iso-8859-1?Q?euVl819SLN9TprwsrDszjKW0Vs0XDBy7FTqBD7xQ/XwQ2b291wm7lLa2Co?=
 =?iso-8859-1?Q?dW2CsUaejHQF/dzGe1ZvNFrZgB4gf6J7yxQT7LGmEYpvkJrc7XV4OlzWef?=
 =?iso-8859-1?Q?u8NY9963SadlHojgCWEQZWK6nR0gQSLMtW5WTWdoHeP1sw2ID7xIdAEWm/?=
 =?iso-8859-1?Q?ypDinVN20BobmpfRavEYw8PFYjujShBdGmqQAsQVcdCMd4V1XJNll3p3fP?=
 =?iso-8859-1?Q?c40onUaKGk2Doh0372DeqIcnxertdpC3+C3Y47Jdx0Ar1bbF+zeAseNQHY?=
 =?iso-8859-1?Q?U5lbCslvtOqlG1GSp9BjYvxSId1SED6MhQkI1fcFpYcNfqDn16LUpkg8B8?=
 =?iso-8859-1?Q?crx8ipolW+EJx7CS6LxgN/y74bIrWJhn2jDnVD9DKnxZfyVk/45cJC77Ve?=
 =?iso-8859-1?Q?R0p/qRlRfywvQkOBPZ9Tx4wBKVKn8khHqQbS9oRihUGUsTg3B00c8vFm2E?=
 =?iso-8859-1?Q?jWhdiAlzA4ZcBwiM21wGNk0wYllymsztC+65CH0m0nvdnT36ZN90RVky/s?=
 =?iso-8859-1?Q?2HQ8sDkrKJlRnu9MxepMnqt0ph7sI4LqDkhjOKv7XiO0ENAPm1ispsndJ7?=
 =?iso-8859-1?Q?eAQZnIHMXJUEy8OxyAiLVl7ssY/aL9qRt6Ch/LrkYlPXg68R9++YMg8BLK?=
 =?iso-8859-1?Q?/m8qii4qEzAVhwa+3EnptzF/GljwKVyfw9jeBBhNO2Ya6kW05S8tSN50P3?=
 =?iso-8859-1?Q?8igcNxXwhGxNPikXcfUue+6c1f80xaZnFFM0hG12UCel0QXpiVCheEAQ4I?=
 =?iso-8859-1?Q?ru5fH1OjX96x17NQpJdR36SlAWKrx/wuKtqZhnZUR54CkkLwsm44xEeuhW?=
 =?iso-8859-1?Q?+/252SQzLMSKs6ez2Ku6iqnRDwHAZISUHCheHKcH0ctjRFH6dLOa7p6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cebb2d-bd65-432a-5e1d-08dde5976f82
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 18:27:53.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ymK+gx63XRrgkk2i6FI5yLKRJkQYgnMv1Id8C0JTcnLBcsB3jjHBP/z6TNcksqllZcIXjjth1GjEzTcxi60fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
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

On Wed, Aug 27, 2025 at 12:03:44PM -0600, Summers, Stuart wrote:
> On Wed, 2025-08-27 at 17:16 +0000, Patchwork wrote:
> > Patch Details
> > Series: Add TLB invalidation abstraction (rev12) URL:
> > https://patchwork.freedesktop.org/series/152022/ State: failure
> > Details:
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152022v12/index.html 
> > CI Bug Log - changes from xe-3623-
> > 3a2760f3080e5188b19cdb4640cec5eb0926d578_FULL -> xe-pw-
> > 152022v12_FULLSummaryFAILURE
> > Serious unknown changes coming with xe-pw-152022v12_FULL absolutely
> > need to be
> >  verified manually.
> > If you think the reported changes have nothing to do with the changes
> >  introduced in xe-pw-152022v12_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> >  to document this new failure mode, which will reduce false positives
> > in CI.
> > Participating hosts (4 -> 4)No changes in participating hosts
> > Possible new issuesHere are the unknown changes that may have been
> > introduced in xe-pw-152022v12_FULL:
> > IGT changesPossible regressions *
> > igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs
> > @vf-random:shard-bmg: PASS -> FAIL +2 other tests fail
> 
> This looks like the BAR configuration here doesn't support SRIOV. I
> assume the BIOS here just needs to be updated. As such I don't think
> this is related at all.
> 
> I did also glance through the logs of that other. It doesn't seem to be
> reproducing on a re-run. I don't see how that could be directly related
> here either, although from the logs alone it's a little hard to see
> what is causing that. We try an allocation through the core mm code
> which returns EBUSY - that could be either the pages being pinned
> (unlikely) or the resource still in use I think. But the xe code there
> just retries in that case, but in the test result it just hangs there.
> Hopefully we'll get that reproducing in CI where we can more easily
> identify the reproduction patterns.
> 
> Anyway IMO we should be good to move forward with this one.

I agree. I'll merge this shortly.

Matt

> 
> Thanks,
> Stuart
> 
> > Known issuesHere are the changes found in xe-pw-152022v12_FULL that
> > come from known issues:
> > IGT changesIssues hit * igt@fbdev@unaligned-write:shard-dg2-set2:
> > PASS -> SKIP (Intel XE#2134)
> >  *
> > igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pi
> > pe-c-edp-1:shard-lnl: NOTRUN -> FAIL (Intel XE#911) +3 other tests
> > fail
> >  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-
> > hdmi-a-1-y:shard-adlp: NOTRUN -> DMESG-WARN (Intel XE#4543) +13 other
> > tests dmesg-warn
> >  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:shard-adlp: PASS ->
> > FAIL (Intel XE#3884)
> >  * igt@kms_async_flips@test-cursor:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#664)
> >  * igt@kms_atomic_transition@plane-all-modeset-transition:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#3279)
> >  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#316) +3 other tests skipshard-lnl: NOTRUN -> SKIP
> > (Intel XE#1407) +3 other tests skip
> >  *
> > igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:shar
> > d-adlp: NOTRUN -> SKIP (Intel XE#1124) +14 other tests skip
> >  *
> > igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> > :shard-lnl: NOTRUN -> SKIP (Intel XE#3658)
> >  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:shard-bmg: NOTRUN -> SKIP
> > (Intel XE#2327)
> >  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:shard-adlp: NOTRUN -> DMESG-
> > FAIL (Intel XE#4543) +1 other test dmesg-fail
> >  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#316) +5 other tests skip
> >  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:shard-bmg: NOTRUN -> SKIP
> > (Intel XE#1124) +1 other test skip
> >  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#1124) +2 other tests skip
> >  * igt@kms_big_fb@y-tiled-addfb-size-overflow:shard-dg2-set2: NOTRUN
> > -> SKIP (Intel XE#610)shard-lnl: NOTRUN -> SKIP (Intel XE#1428)
> >  *
> > igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:shar
> > d-adlp: PASS -> DMESG-FAIL (Intel XE#4543) +11 other tests dmesg-fail
> >  *
> > igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#1124) +8 other tests skip
> >  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#2191) +2 other tests skip
> >  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:shard-
> > adlp: NOTRUN -> SKIP (Intel XE#2191) +2 other tests skipshard-bmg:
> > PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
> >  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:shard-
> > bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)shard-dg2-set2:
> > NOTRUN -> SKIP (Intel XE#2191) +1 other test skip
> >  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:shard-bmg: NOTRUN -
> > > SKIP (Intel XE#367)shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367)
> >  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:shard-adlp: NOTRUN
> > -> SKIP (Intel XE#367) +2 other tests skipshard-lnl: NOTRUN -> SKIP
> > (Intel XE#1512)
> >  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#2887) +13 other tests skip
> >  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-
> > 1:shard-adlp: NOTRUN -> SKIP (Intel XE#787) +53 other tests skip
> >  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:shard-bmg: NOTRUN
> > -> SKIP (Intel XE#2887) +4 other tests skip
> >  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:shard-dg2-
> > set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +37 other tests
> > skip
> >  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:shard-dg2-
> > set2: NOTRUN -> SKIP (Intel XE#2907)
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:shard-adlp: NOTRUN
> > -> SKIP (Intel XE#3442)
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:shard-adlp:
> > NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +35 other tests skip
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:shard-bmg:
> > NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
> >  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-adlp:
> > NOTRUN -> SKIP (Intel XE#2907) +2 other tests skip
> >  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-
> > hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +216 other
> > tests skip
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-
> > 6:shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1727 / Intel XE#3113
> > / Intel XE#3124)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:shard-bmg:
> > NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +12 other tests skip
> >  * igt@kms_cdclk@mode-transition:shard-adlp: NOTRUN -> SKIP (Intel
> > XE#4417 / Intel XE#455)
> >  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:shard-adlp: NOTRUN -
> > > SKIP (Intel XE#4417) +2 other tests skip
> >  * igt@kms_chamelium_audio@hdmi-audio-edid:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#373) +10 other tests skip
> >  * igt@kms_chamelium_color@ctm-max:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#306)shard-adlp: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
> >  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:shard-dg2-
> > set2: NOTRUN -> SKIP (Intel XE#373) +4 other tests skip
> >  * igt@kms_chamelium_frames@hdmi-aspect-ratio:shard-bmg: NOTRUN ->
> > SKIP (Intel XE#2252) +3 other tests skip
> >  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#373) +7 other tests skip
> >  * igt@kms_content_protection@content-type-change:shard-bmg: NOTRUN -
> > > SKIP (Intel XE#2341)shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
> >  * igt@kms_content_protection@dp-mst-lic-type-0:shard-dg2-set2:
> > NOTRUN -> SKIP (Intel XE#307) +1 other test skip
> >  * igt@kms_content_protection@dp-mst-type-1:shard-bmg: NOTRUN -> SKIP
> > (Intel XE#2390)shard-adlp: NOTRUN -> SKIP (Intel XE#307) +1 other
> > test skipshard-lnl: NOTRUN -> SKIP (Intel XE#307)
> >  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:shard-bmg:
> > NOTRUN -> FAIL (Intel XE#1178)
> >  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:shard-dg2-set2:
> > NOTRUN -> FAIL (Intel XE#3304)
> >  * igt@kms_content_protection@srm@pipe-a-dp-4:shard-dg2-set2: NOTRUN
> > -> FAIL (Intel XE#1178) +2 other tests fail
> >  * igt@kms_cursor_crc@cursor-onscreen-512x170:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#2321) +1 other test skipshard-adlp: NOTRUN -> SKIP
> > (Intel XE#308) +1 other test skip
> >  * igt@kms_cursor_crc@cursor-onscreen-64x64:shard-dg2-set2: PASS ->
> > SKIP (Intel XE#4208 / i915#2575) +84 other tests skip
> >  * igt@kms_cursor_crc@cursor-random-128x42:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#1424) +2 other tests skip
> >  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:shard-bmg: NOTRUN -
> > > SKIP (Intel XE#2320)
> >  * igt@kms_cursor_crc@cursor-sliding-512x512:shard-dg2-set2: NOTRUN -
> > > SKIP (Intel XE#308) +1 other test skip
> >  * igt@kms_cursor_edge_walk@128x128-right-edge:shard-dg2-set2: NOTRUN
> > -> SKIP (Intel XE#4208 / i915#2575) +60 other tests skip
> >  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:shard-lnl: NOTRUN -
> > > SKIP (Intel XE#309) +5 other tests skip
> >  *
> > igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size
> > :shard-bmg: PASS -> DMESG-WARN (Intel XE#5354)
> >  *
> > igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size
> > :shard-adlp: NOTRUN -> SKIP (Intel XE#309) +8 other tests skip
> >  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:shard-bmg: PASS ->
> > SKIP (Intel XE#2291)
> >  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:shard-bmg: PASS ->
> > FAIL (Intel XE#1475)
> >  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:shard-bmg: NOTRUN -> SKIP (Intel
> > XE#1508)
> >  * igt@kms_dp_aux_dev:shard-bmg: PASS -> SKIP (Intel XE#3009)
> >  * igt@kms_dp_linktrain_fallback@dp-fallback:shard-adlp: NOTRUN ->
> > SKIP (Intel XE#4331) +1 other test skipshard-lnl: NOTRUN -> SKIP
> > (Intel XE#4294)
> >  * igt@kms_dp_linktrain_fallback@dsc-fallback:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#4331)
> >  * igt@kms_feature_discovery@chamelium:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#701)
> >  * igt@kms_feature_discovery@display-4x:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#1138)shard-lnl: NOTRUN -> SKIP (Intel XE#1138)
> >  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:shard-adlp:
> > NOTRUN -> SKIP (Intel XE#310) +6 other tests skip
> >  * igt@kms_flip@2x-flip-vs-suspend-interruptible:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#1421) +4 other tests skip
> >  * igt@kms_flip@2x-modeset-vs-vblank-race:shard-bmg: PASS -> SKIP
> > (Intel XE#2316) +4 other tests skip
> >  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:shard-adlp: PASS
> > -> DMESG-WARN (Intel XE#4543) +14 other tests dmesg-warn
> >  * igt@kms_flip@flip-vs-suspend-interruptible:shard-adlp: PASS ->
> > DMESG-WARN (Intel XE#2953 / Intel XE#4173) +4 other tests dmesg-warn
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:s
> > hard-dg2-set2: PASS -> SKIP (Intel XE#2351 / Intel XE#4208) +14 other
> > tests skip
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@p
> > ipe-a-default-mode:shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +2 other
> > tests skip
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> > shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@
> > pipe-a-valid-mode:shard-bmg: NOTRUN -> SKIP (Intel XE#2293)
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
> > :shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +2 other
> > tests skip
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:s
> > hard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745)
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@p
> > ipe-a-default-mode:shard-lnl: NOTRUN -> SKIP (Intel XE#1397)
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> > :shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +13 other tests skip
> >  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-
> > x:shard-adlp: PASS -> FAIL (Intel XE#1874)
> >  *
> > igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:s
> > hard-bmg: NOTRUN -> SKIP (Intel XE#2311) +5 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:shard-
> > dg2-set2: NOTRUN -> SKIP (Intel XE#2351 / Intel XE#4208) +10 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:shard
> > -lnl: NOTRUN -> SKIP (Intel XE#656) +38 other tests skip
> >  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:shard-bmg: NOTRUN
> > -> SKIP (Intel XE#5390) +4 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render
> > :shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +16 other tests skip
> >  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:shard-lnl:
> > NOTRUN -> SKIP (Intel XE#651) +13 other tests skip
> >  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:shard-
> > adlp: NOTRUN -> SKIP (Intel XE#651) +17 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:shar
> > d-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +16 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:sh
> > ard-bmg: NOTRUN -> SKIP (Intel XE#2313) +8 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:shar
> > d-adlp: NOTRUN -> SKIP (Intel XE#656) +46 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:shard-
> > adlp: NOTRUN -> SKIP (Intel XE#653) +14 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:s
> > hard-bmg: NOTRUN -> SKIP (Intel XE#2312)
> >  * igt@kms_hdr@static-swap:shard-bmg: NOTRUN -> SKIP (Intel XE#1503)
> > +1 other test skip
> >  * igt@kms_joiner@basic-force-ultra-joiner:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#2925)
> >  * igt@kms_joiner@invalid-modeset-big-joiner:shard-adlp: NOTRUN ->
> > SKIP (Intel XE#346)shard-bmg: NOTRUN -> SKIP (Intel XE#346)shard-dg2-
> > set2: NOTRUN -> SKIP (Intel XE#346)shard-lnl: NOTRUN -> SKIP (Intel
> > XE#346)
> >  * igt@kms_joiner@invalid-modeset-force-big-joiner:shard-adlp: NOTRUN
> > -> SKIP (Intel XE#3012)
> >  * igt@kms_panel_fitting@legacy:shard-adlp: NOTRUN -> SKIP (Intel
> > XE#455) +26 other tests skip
> >  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:shard-dg2-
> > set2: NOTRUN -> FAIL (Intel XE#616) +2 other tests fail
> >  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#599) +7 other tests skip
> >  *
> > igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pi
> > pe-c:shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +7 other tests skip
> >  * igt@kms_pm_backlight@basic-brightness:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#870)
> >  * igt@kms_pm_backlight@brightness-with-dpms:shard-bmg: NOTRUN ->
> > SKIP (Intel XE#2938)
> >  * igt@kms_pm_backlight@fade-with-dpms:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#870) +1 other test skip
> >  * igt@kms_pm_dc@dc5-retention-flops:shard-dg2-set2: NOTRUN -> SKIP
> > (Intel XE#3309)shard-lnl: NOTRUN -> SKIP (Intel XE#3309)shard-adlp:
> > NOTRUN -> SKIP (Intel XE#3309)
> >  * igt@kms_pm_dc@dc6-psr:shard-lnl: PASS -> FAIL (Intel XE#718)shard-
> > dg2-set2: NOTRUN -> SKIP (Intel XE#1129)
> >  * igt@kms_pm_dc@dc9-dpms:shard-adlp: NOTRUN -> SKIP (Intel XE#734)
> >  *
> > igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:shard-
> > bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +4 other tests
> > skip
> >  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel XE#4608)
> > +1 other test skip
> >  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-
> > a-edp-1:shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +2
> > other tests skip
> >  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:shard-dg2-set2: NOTRUN -
> > > SKIP (Intel XE#1406 / Intel XE#1489) +3 other tests skip
> >  *
> > igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:shar
> > d-adlp: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +8 other tests
> > skip
> >  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#1406 / Intel XE#2893) +3 other tests skip
> >  * igt@kms_psr2_su@page_flip-xrgb8888:shard-dg2-set2: NOTRUN -> SKIP
> > (Intel XE#1122 / Intel XE#1406)
> >  * igt@kms_psr@fbc-psr-sprite-plane-onoff:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#1406 / Intel XE#2850 / Intel XE#929) +4 other tests
> > skip
> >  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#1406 / Intel XE#4208) +5 other tests skip
> >  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#1406) +5 other tests skip
> >  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#1406 / Intel XE#4609)
> >  * igt@kms_psr@pr-primary-page-flip:shard-adlp: NOTRUN -> SKIP (Intel
> > XE#1406 / Intel XE#2850 / Intel XE#929) +14 other tests skip
> >  * igt@kms_psr@pr-primary-render:shard-bmg: NOTRUN -> SKIP (Intel
> > XE#1406 / Intel XE#2234 / Intel XE#2850) +3 other tests skip
> >  * igt@kms_psr@pr-sprite-plane-onoff:shard-dg2-set2: NOTRUN -> SKIP
> > (Intel XE#1406 / Intel XE#2351 / Intel XE#4208) +1 other test skip
> >  * igt@kms_rotation_crc@primary-rotation-270:shard-adlp: NOTRUN ->
> > SKIP (Intel XE#3414)shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel
> > XE#3904)
> >  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-adlp:
> > NOTRUN -> SKIP (Intel XE#1127)shard-lnl: NOTRUN -> SKIP (Intel
> > XE#1127)
> >  * igt@xe_ccs@block-copy-compressed-inc-dimension:shard-adlp: NOTRUN
> > -> SKIP (Intel XE#455 / Intel XE#488 / Intel XE#5607) +1 other test
> > skip
> >  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-
> > drm_xe_engine_class_compute:shard-dg2-set2: NOTRUN -> FAIL (Intel
> > XE#5890)
> >  * igt@xe_copy_basic@mem-copy-linear-0xfffe:shard-adlp: NOTRUN ->
> > SKIP (Intel XE#1123)
> >  * igt@xe_copy_basic@mem-set-linear-0xfd:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#1126)
> >  * igt@xe_eu_stall@non-blocking-re-enable:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#5626)shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5626)
> >  * igt@xe_eudebug_online@basic-breakpoint:shard-bmg: NOTRUN -> SKIP
> > (Intel XE#4837) +3 other tests skip
> >  * igt@xe_eudebug_online@interrupt-other:shard-dg2-set2: NOTRUN ->
> > SKIP (Intel XE#4837) +3 other tests skip
> >  * igt@xe_eudebug_online@single-step-one:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#4837 / Intel XE#5565) +14 other tests skip
> >  * igt@xe_eudebug_sriov@deny-eudebug:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#4519)
> >  * igt@xe_evict@evict-beng-large-cm:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#688) +2 other tests skipshard-adlp: NOTRUN -> SKIP (Intel XE#261 /
> > Intel XE#5564) +1 other test skip
> >  * igt@xe_evict@evict-small-external-cm:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#261 / Intel XE#5564 / Intel XE#688) +1 other test skip
> >  *
> > igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:shard
> > -adlp: NOTRUN -> SKIP (Intel XE#5563 / Intel XE#688)
> >  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:shard-dg2-set2:
> > PASS -> SKIP (Intel XE#1392) +3 other tests skip
> >  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#1392) +7 other tests skip
> >  *
> > igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:shar
> > d-adlp: NOTRUN -> SKIP (Intel XE#1392 / Intel XE#5575) +8 other tests
> > skipshard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
> >  * igt@xe_exec_fault_mode@once-userptr-invalidate:shard-adlp: NOTRUN
> > -> SKIP (Intel XE#288 / Intel XE#5561) +31 other tests skip
> >  * igt@xe_exec_fault_mode@twice-userptr-prefetch:shard-dg2-set2:
> > NOTRUN -> SKIP (Intel XE#288) +11 other tests skip
> >  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:shard-dg2-set2:
> > NOTRUN -> SKIP (Intel XE#4208) +284 other tests skip
> >  * igt@xe_exec_reset@parallel-gt-reset:shard-bmg: PASS -> DMESG-WARN
> > (Intel XE#3876) +1 other test dmesg-warn
> >  * igt@xe_exec_sip_eudebug@breakpoint-writesip:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#4837) +11 other tests skip
> >  * igt@xe_exec_system_allocator@process-many-execqueues-free:shard-
> > adlp: NOTRUN -> SKIP (Intel XE#4915) +285 other tests skip
> >  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:shard-
> > lnl: NOTRUN -> SKIP (Intel XE#4943) +14 other tests skip
> >  *
> > igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge
> > :shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +2 other tests skip
> >  * igt@xe_exec_system_allocator@twice-malloc-fork-read:shard-dg2-
> > set2: NOTRUN -> SKIP (Intel XE#4915) +112 other tests skip
> >  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:shard-
> > lnl: NOTRUN -> ABORT (Intel XE#4917 / Intel XE#5466)shard-adlp:
> > NOTRUN -> ABORT (Intel XE#4917 / Intel XE#5530)
> >  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:shard-
> > lnl: NOTRUN -> ABORT (Intel XE#4757)
> >  * igt@xe_live_ktest@xe_bo:shard-dg2-set2: NOTRUN -> SKIP (Intel
> > XE#2229 / Intel XE#455) +1 other test skipshard-adlp: NOTRUN -> SKIP
> > (Intel XE#2229 / Intel XE#455) +1 other test skip
> >  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:shard-lnl: NOTRUN ->
> > SKIP (Intel XE#2229) +1 other test skip
> >  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:shard-dg2-set2:
> > NOTRUN -> SKIP (Intel XE#2229)shard-adlp: NOTRUN -> SKIP (Intel
> > XE#2229)
> >  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:shard-adlp:
> > NOTRUN -> SKIP (Intel XE#2229 / Intel XE#5488)
> >  * igt@xe_mmap@pci-membarrier-bad-object:shard-adlp: NOTRUN -> SKIP
> > (Intel XE#5100) +1 other test skipshard-lnl: NOTRUN -> SKIP (Intel
> > XE#5100)
> >  * igt@xe_module_load@reload:shard-dg2-set2: PASS -> FAIL (Intel
> > XE#4208) +1 other test fail
> >  * igt@xe_module_load@reload-no-display:shard-dg2-set2: NOTRUN ->
> > FAIL (Intel XE#4208)
> >  * igt@xe_noexec_ping_pong:shard-adlp: NOTRUN -> SKIP (Intel XE#379 /
> > Intel XE#5613)shard-lnl: NOTRUN -> SKIP (Intel XE#379)
> >  * igt@xe_oa@buffer-size:shard-adlp: NOTRUN -> SKIP (Intel XE#5103)
> >  * igt@xe_oa@non-zero-reason:shard-dg2-set2: NOTRUN -> SKIP (Intel
> > XE#3573) +2 other tests skip
> >  * igt@xe_oa@syncs-syncobj-cfg:shard-adlp: NOTRUN -> SKIP (Intel
> > XE#3573) +5 other tests skip
> >  * igt@xe_pat@pat-index-xe2:shard-adlp: NOTRUN -> SKIP (Intel XE#977)
> >  * igt@xe_pat@pat-index-xelpg:shard-adlp: NOTRUN -> SKIP (Intel
> > XE#979)shard-lnl: NOTRUN -> SKIP (Intel XE#979)
> >  * igt@xe_pm@d3cold-i2c:shard-adlp: NOTRUN -> SKIP (Intel XE#5694)
> >  * igt@xe_pm@d3hot-i2c:shard-dg2-set2: NOTRUN -> SKIP (Intel
> > XE#5742)shard-lnl: NOTRUN -> SKIP (Intel XE#5742)shard-adlp: NOTRUN -
> > > SKIP (Intel XE#5742)
> >  * igt@xe_pm@d3hot-mmap-vram:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#1948)
> >  * igt@xe_pm@s3-exec-after:shard-lnl: NOTRUN -> SKIP (Intel XE#584)
> >  * igt@xe_pm@s4-d3cold-basic-exec:shard-lnl: NOTRUN -> SKIP (Intel
> > XE#2284 / Intel XE#366)shard-adlp: NOTRUN -> SKIP (Intel XE#2284 /
> > Intel XE#366)
> >  * igt@xe_pm@vram-d3cold-threshold:shard-dg2-set2: NOTRUN -> SKIP
> > (Intel XE#579)
> >  * igt@xe_pmu@engine-activity-idle:shard-bmg: PASS -> DMESG-WARN
> > (Intel XE#5213) +1 other test dmesg-warn
> >  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:shard-dg2-set2:
> > NOTRUN -> SKIP (Intel XE#4733) +2 other tests skip
> >  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:shard-adlp: NOTRUN -
> > > SKIP (Intel XE#4733 / Intel XE#5594) +1 other test skip
> >  * igt@xe_query@multigpu-query-pxp-status:shard-lnl: NOTRUN -> SKIP
> > (Intel XE#944) +4 other tests skip
> >  * igt@xe_query@multigpu-query-uc-fw-version-huc:shard-adlp: NOTRUN -
> > > SKIP (Intel XE#944) +5 other tests skipshard-bmg: NOTRUN -> SKIP
> > (Intel XE#944)
> >  *
> > igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:sh
> > ard-lnl: NOTRUN -> SKIP (Intel XE#4130) +1 other test skip
> >  * igt@xe_sriov_flr@flr-vf1-clear:shard-dg2-set2: NOTRUN -> SKIP
> > (Intel XE#3342)
> >  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:shard-dg2-
> > set2: PASS -> SKIP (Intel XE#4208) +180 other tests skip
> > Possible fixes * igt@core_getversion@all-cards:shard-dg2-set2: FAIL
> > (Intel XE#4208) -> PASS +2 other tests pass
> >  * igt@fbdev@nullptr:shard-dg2-set2: SKIP (Intel XE#2134) -> PASS +1
> > other test pass
> >  * igt@kms_async_flips@async-flip-suspend-resume:shard-adlp: DMESG-
> > WARN (Intel XE#2953 / Intel XE#4173) -> PASS +2 other tests pass
> >  *
> > igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:shar
> > d-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> PASS +112 other tests
> > pass
> >  *
> > igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> > :shard-adlp: DMESG-FAIL (Intel XE#4543) -> PASS +4 other tests pass
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:shard-dg2-set2:
> > INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel XE#3113 / Intel
> > XE#4212 / Intel XE#4345 / Intel XE#4522) -> PASS
> >  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:shard-bmg: SKIP
> > (Intel XE#2291) -> PASS +2 other tests pass
> >  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:shard-bmg:
> > INCOMPLETE (Intel XE#2049 / Intel XE#2597) -> PASS +3 other tests
> > pass
> >  * igt@kms_flip@2x-nonexisting-fb:shard-bmg: SKIP (Intel XE#2316) ->
> > PASS +7 other tests pass
> >  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:shard-adlp: DMESG-WARN
> > (Intel XE#4543) -> PASS +8 other tests pass
> >  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:shard-lnl: FAIL (Intel
> > XE#301) -> PASS +2 other tests pass
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:s
> > hard-adlp: DMESG-FAIL (Intel XE#4543 / Intel XE#4921) -> PASS +1
> > other test pass
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:shard-
> > dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> PASS +7 other tests
> > pass
> >  * igt@kms_hdr@static-toggle-suspend:shard-bmg: SKIP (Intel XE#1503)
> > -> PASS
> >  * igt@kms_joiner@invalid-modeset-force-big-joiner:shard-bmg: SKIP
> > (Intel XE#3012) -> PASS
> >  * igt@kms_plane_multiple@2x-tiling-4:shard-bmg: SKIP (Intel XE#4596)
> > -> PASS
> >  * igt@kms_pm_dc@dc5-dpms:shard-lnl: FAIL (Intel XE#718) -> PASS
> >  * igt@kms_setmode@invalid-clone-single-crtc:shard-bmg: SKIP (Intel
> > XE#1435) -> PASS
> >  * igt@kms_vrr@cmrr@pipe-a-edp-1:shard-lnl: FAIL (Intel XE#4459) ->
> > PASS +1 other test pass
> >  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:shard-lnl:
> > FAIL (Intel XE#2142) -> PASS +1 other test pass
> >  * igt@xe_exec_balancer@once-parallel-rebind:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> PASS +255 other tests pass
> >  * igt@xe_module_load@load:shard-lnl: (SKIP, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, ABORT, ABORT, ABORT, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#378)
> > -> (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS)shard-bmg: (PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#2457)
> > -> (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS)shard-dg2-set2: (PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, SKIP, PASS, PASS, PASS) (Intel XE#378) -> (PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS)
> >  * igt@xe_vm@bind-array-enobufs:shard-dg2-set2: DMESG-FAIL (Intel
> > XE#3876) -> PASS
> > Warnings * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:shard-
> > dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#623)
> >  * igt@kms_big_fb@linear-64bpp-rotate-270:shard-dg2-set2: SKIP (Intel
> > XE#2351 / Intel XE#4208) -> SKIP (Intel XE#316) +1 other test skip
> >  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:shard-dg2-set2: SKIP (Intel
> > XE#316) -> SKIP (Intel XE#4208)
> >  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#316) +3 other tests skip
> >  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:shard-dg2-set2: SKIP (Intel
> > XE#316) -> SKIP (Intel XE#2351 / Intel XE#4208) +1 other test skip
> >  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:shard-dg2-set2: SKIP
> > (Intel XE#1124) -> SKIP (Intel XE#2351 / Intel XE#4208) +3 other
> > tests skip
> >  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#1124) +8 other
> > tests skip
> >  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#610)
> >  *
> > igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> > :shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1124) +7
> > other tests skip
> >  *
> > igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
> > :shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#4208) +9
> > other tests skip
> >  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:shard-
> > dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#2191)
> >  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:shard-dg2-set2:
> > SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#367) +4 other
> > tests skip
> >  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:shard-dg2-set2:
> > SKIP (Intel XE#367) -> SKIP (Intel XE#4208 / i915#2575) +1 other test
> > skip
> >  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel XE#2351 / Intel
> > XE#4208) +1 other test skip
> >  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:shard-dg2-set2: SKIP
> > (Intel XE#2907) -> SKIP (Intel XE#4208) +2 other tests skip
> >  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#455 / Intel
> > XE#787) +2 other tests skip
> >  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#455 / Intel XE#787) +14 other
> > tests skip
> >  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:shard-dg2-set2:
> > SKIP (Intel XE#3442) -> SKIP (Intel XE#4208)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#2351 / Intel XE#4208) -> INCOMPLETE (Intel XE#1727 /
> > Intel XE#3113 / Intel XE#3124 / Intel XE#4345)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:shard-dg2-set2:
> > INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel XE#3124) ->
> > INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel XE#3113 / Intel
> > XE#4212)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-
> > 6:shard-dg2-set2: DMESG-WARN (Intel XE#1727 / Intel XE#3113) ->
> > INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel XE#3113 / Intel
> > XE#4212)
> >  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#2907) +1 other test skip
> >  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:shard-dg2-set2:
> > SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel XE#4208) +7 other
> > tests skip
> >  * igt@kms_cdclk@mode-transition-all-outputs:shard-dg2-set2: SKIP
> > (Intel XE#4418) -> SKIP (Intel XE#2351 / Intel XE#4208)
> >  * igt@kms_chamelium_color@ctm-0-75:shard-dg2-set2: SKIP (Intel
> > XE#306) -> SKIP (Intel XE#4208 / i915#2575) +1 other test skip
> >  * igt@kms_chamelium_color@gamma:shard-dg2-set2: SKIP (Intel XE#4208
> > / i915#2575) -> SKIP (Intel XE#306) +3 other tests skip
> >  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:shard-dg2-
> > set2: SKIP (Intel XE#373) -> SKIP (Intel XE#4208 / i915#2575) +7
> > other tests skip
> >  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:shard-dg2-set2:
> > SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#373) +11 other
> > tests skip
> >  * igt@kms_content_protection@atomic:shard-dg2-set2: FAIL (Intel
> > XE#1178) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_content_protection@atomic-dpms:shard-bmg: FAIL (Intel
> > XE#1178) -> SKIP (Intel XE#2341)
> >  * igt@kms_content_protection@lic-type-0:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> FAIL (Intel XE#1178) +2 other tests
> > failshard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1178)
> >  * igt@kms_content_protection@uevent:shard-bmg: FAIL (Intel XE#1188)
> > -> SKIP (Intel XE#2341)
> >  * igt@kms_cursor_crc@cursor-offscreen-512x170:shard-dg2-set2: SKIP
> > (Intel XE#308) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_cursor_crc@cursor-onscreen-512x512:shard-dg2-set2: SKIP
> > (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#308) +3 other tests
> > skip
> >  * igt@kms_dp_link_training@uhbr-sst:shard-dg2-set2: SKIP (Intel
> > XE#4356) -> SKIP (Intel XE#4208)
> >  * igt@kms_dsc@dsc-with-bpc-formats:shard-dg2-set2: SKIP (Intel
> > XE#455) -> SKIP (Intel XE#2351 / Intel XE#4208)
> >  * igt@kms_dsc@dsc-with-output-formats-with-bpc:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#455) +5 other tests skip
> >  *
> > igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:shard-
> > dg2-set2: SKIP (Intel XE#4422) -> SKIP (Intel XE#4208) +1 other test
> > skip
> >  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:shard-
> > dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4422)
> >  * igt@kms_fbcon_fbt@psr-suspend:shard-dg2-set2: SKIP (Intel XE#776)
> > -> SKIP (Intel XE#4208)
> >  * igt@kms_feature_discovery@chamelium:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> SKIP (Intel XE#701)
> >  * igt@kms_feature_discovery@dp-mst:shard-dg2-set2: SKIP (Intel
> > XE#1137) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_feature_discovery@psr2:shard-dg2-set2: SKIP (Intel
> > XE#1135) -> SKIP (Intel XE#4208 / i915#2575)
> >  *
> > igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> > shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#4208) +1 other
> > test skip
> >  *
> > igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> > :shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel
> > XE#455) +4 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:shard-
> > dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#651) +24 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:shard-
> > dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#4208) +26 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> > shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +11 other
> > tests skip
> >  * igt@kms_frontbuffer_tracking@drrs-suspend:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#651) +14 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:sh
> > ard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312) +3 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:shard-
> > bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390) +3 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:shar
> > d-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2351 / Intel
> > XE#4208) +10 other tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:sha
> > rd-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +9 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:sh
> > ard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#653) +28 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:sh
> > ard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +16 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:shard
> > -dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#4208) +26 other
> > tests skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:sh
> > ard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +8 other tests
> > skip
> >  *
> > igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:sh
> > ard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2351 / Intel
> > XE#4208) +6 other tests skip
> >  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:shard-dg2-set2: SKIP
> > (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#658)
> >  *
> > igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:shard-
> > dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#653)
> > +5 other tests skip
> >  * igt@kms_hdr@brightness-with-hdr:shard-bmg: SKIP (Intel XE#3374 /
> > Intel XE#3544) -> SKIP (Intel XE#3544)
> >  * igt@kms_hdr@invalid-hdr:shard-dg2-set2: SKIP (Intel XE#4208 /
> > i915#2575) -> SKIP (Intel XE#455) +9 other tests skip
> >  * igt@kms_joiner@basic-force-ultra-joiner:shard-dg2-set2: SKIP
> > (Intel XE#2925) -> SKIP (Intel XE#4208)
> >  * igt@kms_joiner@basic-max-non-joiner:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#4298)
> >  * igt@kms_joiner@basic-ultra-joiner:shard-dg2-set2: SKIP (Intel
> > XE#2927) -> SKIP (Intel XE#4208)
> >  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#2925)
> >  * igt@kms_joiner@invalid-modeset-ultra-joiner:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#2927)
> >  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:shard-dg2-set2: SKIP
> > (Intel XE#4359) -> SKIP (Intel XE#4208)
> >  * igt@kms_plane_cursor@primary:shard-dg2-set2: SKIP (Intel XE#4208 /
> > i915#2575) -> FAIL (Intel XE#616)
> >  * igt@kms_plane_multiple@2x-tiling-y:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> SKIP (Intel XE#5021)
> >  * igt@kms_pm_backlight@brightness-with-dpms:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#2938)
> >  * igt@kms_pm_backlight@fade:shard-dg2-set2: SKIP (Intel XE#870) ->
> > SKIP (Intel XE#4208)
> >  * igt@kms_pm_dc@dc3co-vpb-simulation:shard-dg2-set2: SKIP (Intel
> > XE#1122) -> SKIP (Intel XE#2351 / Intel XE#4208)
> >  * igt@kms_pm_dc@dc5-psr:shard-dg2-set2: SKIP (Intel XE#1129) -> SKIP
> > (Intel XE#4208)
> >  * igt@kms_pm_dc@deep-pkgc:shard-dg2-set2: SKIP (Intel XE#4208) ->
> > SKIP (Intel XE#908)
> >  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:shard-dg2-set2: SKIP
> > (Intel XE#1406 / Intel XE#4208) -> SKIP (Intel XE#1406 / Intel
> > XE#1489) +9 other tests skip
> >  *
> > igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
> > :shard-dg2-set2: SKIP (Intel XE#1406 / Intel XE#1489) -> SKIP (Intel
> > XE#1406 / Intel XE#4208) +8 other tests skip
> >  * igt@kms_psr2_su@page_flip-nv12:shard-dg2-set2: SKIP (Intel XE#1406
> > / Intel XE#4208) -> SKIP (Intel XE#1122 / Intel XE#1406)
> >  * igt@kms_psr@fbc-pr-cursor-plane-move:shard-dg2-set2: SKIP (Intel
> > XE#1406 / Intel XE#2850 / Intel XE#929) -> SKIP (Intel XE#1406 /
> > Intel XE#4208) +9 other tests skip
> >  * igt@kms_psr@fbc-pr-sprite-render:shard-dg2-set2: SKIP (Intel
> > XE#1406 / Intel XE#2850 / Intel XE#929) -> SKIP (Intel XE#1406 /
> > Intel XE#2351 / Intel XE#4208) +3 other tests skip
> >  * igt@kms_psr@fbc-psr-no-drrs:shard-dg2-set2: SKIP (Intel XE#1406 /
> > Intel XE#2351 / Intel XE#4208) -> SKIP (Intel XE#1406 / Intel XE#2850
> > / Intel XE#929) +6 other tests skip
> >  * igt@kms_psr@fbc-psr2-no-drrs:shard-dg2-set2: SKIP (Intel XE#1406 /
> > Intel XE#4208) -> SKIP (Intel XE#1406 / Intel XE#2850 / Intel XE#929)
> > +7 other tests skip
> >  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:shard-dg2-
> > set2: SKIP (Intel XE#1406 / Intel XE#4208) -> SKIP (Intel XE#1406 /
> > Intel XE#2939)
> >  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:shard-dg2-set2:
> > SKIP (Intel XE#1127) -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:shard-dg2-set2:
> > SKIP (Intel XE#3414) -> SKIP (Intel XE#4208 / i915#2575) +3 other
> > tests skip
> >  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:shard-dg2-set2:
> > SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel XE#1127)
> >  * igt@kms_tiled_display@basic-test-pattern:shard-bmg: SKIP (Intel
> > XE#2426) -> FAIL (Intel XE#1729)shard-dg2-set2: FAIL (Intel XE#1729)
> > -> SKIP (Intel XE#4208 / i915#2575)
> >  * igt@kms_tv_load_detect@load-detect:shard-dg2-set2: SKIP (Intel
> > XE#4208 / i915#2575) -> SKIP (Intel XE#330)
> >  * igt@kms_vrr@flipline:shard-dg2-set2: SKIP (Intel XE#455) -> SKIP
> > (Intel XE#4208 / i915#2575) +7 other tests skip
> >  * igt@kms_vrr@lobf:shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575)
> > -> SKIP (Intel XE#2168)
> >  * igt@xe_compute_preempt@compute-preempt-many-all-ram:shard-dg2-
> > set2: SKIP (Intel XE#4208) -> FAIL (Intel XE#5890)
> >  * igt@xe_compute_preempt@compute-threadgroup-preempt:shard-dg2-set2:
> > SKIP (Intel XE#1280 / Intel XE#455) -> SKIP (Intel XE#4208)
> >  * igt@xe_configfs@survivability-mode:shard-dg2-set2: SKIP -> SKIP
> > (Intel XE#4208)
> >  * igt@xe_copy_basic@mem-set-linear-0xfd:shard-dg2-set2: SKIP (Intel
> > XE#1126) -> SKIP (Intel XE#4208) +1 other test skip
> >  * igt@xe_copy_basic@mem-set-linear-0xfffe:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#1126)
> >  * igt@xe_eu_stall@invalid-sampling-rate:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#5626)
> >  * igt@xe_eudebug@sysfs-toggle:shard-dg2-set2: SKIP (Intel XE#4208) -
> > > SKIP (Intel XE#4837) +15 other tests skip
> >  * igt@xe_eudebug@vm-bind-clear-faultable:shard-dg2-set2: SKIP (Intel
> > XE#4837) -> SKIP (Intel XE#4208) +12 other tests skip
> >  *
> > igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:s
> > hard-dg2-set2: SKIP (Intel XE#1392) -> SKIP (Intel XE#4208) +2 other
> > tests skip
> >  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#1392)
> >  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#288) +34 other tests skip
> >  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:shard-dg2-
> > set2: SKIP (Intel XE#288) -> SKIP (Intel XE#4208) +29 other tests
> > skip
> >  * igt@xe_exec_reset@parallel-gt-reset:shard-dg2-set2: DMESG-WARN
> > (Intel XE#3876) -> SKIP (Intel XE#4208)
> >  *
> > igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset
> > :shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4915) +323
> > other tests skip
> >  *
> > igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck
> > :shard-dg2-set2: SKIP (Intel XE#4915) -> SKIP (Intel XE#4208) +270
> > other tests skip
> >  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:shard-
> > dg2-set2: SKIP (Intel XE#4208) -> ABORT (Intel XE#4917)
> >  * igt@xe_huc_copy@huc_copy:shard-dg2-set2: SKIP (Intel XE#4208) ->
> > SKIP (Intel XE#255)
> >  * igt@xe_module_load@load:shard-adlp: (PASS, PASS, SKIP, PASS, PASS,
> > PASS, PASS, PASS, ABORT, ABORT, ABORT, ABORT, ABORT, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
> > (Intel XE#378 / Intel XE#5612) -> (PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> > PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, SKIP) (Intel
> > XE#378 / Intel XE#5612)
> >  * igt@xe_oa@closed-fd-and-unmapped-access:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#3573) +9 other tests skip
> >  * igt@xe_oa@mmio-triggered-reports-read:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#5103)
> >  * igt@xe_oa@polling-small-buf:shard-dg2-set2: SKIP (Intel XE#3573) -
> > > SKIP (Intel XE#4208) +9 other tests skip
> >  * igt@xe_pat@pat-index-xe2:shard-dg2-set2: SKIP (Intel XE#4208) ->
> > SKIP (Intel XE#977)
> >  * igt@xe_pat@pat-index-xelpg:shard-dg2-set2: SKIP (Intel XE#979) ->
> > SKIP (Intel XE#4208)
> >  * igt@xe_pm@d3cold-basic:shard-dg2-set2: SKIP (Intel XE#2284 / Intel
> > XE#366) -> SKIP (Intel XE#4208)
> >  * igt@xe_pm@d3cold-mocs:shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP
> > (Intel XE#2284)
> >  * igt@xe_pm@d3cold-multiple-execs:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#2284 / Intel XE#366)
> >  * igt@xe_pmu@fn-engine-activity-load:shard-dg2-set2: SKIP (Intel
> > XE#4650) -> SKIP (Intel XE#4208)
> >  * igt@xe_pxp@display-pxp-fb:shard-dg2-set2: SKIP (Intel XE#4733) ->
> > SKIP (Intel XE#4208) +2 other tests skip
> >  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:shard-dg2-set2: SKIP (Intel
> > XE#4208) -> SKIP (Intel XE#4733) +2 other tests skip
> >  * igt@xe_query@multigpu-query-invalid-cs-cycles:shard-dg2-set2: SKIP
> > (Intel XE#4208) -> SKIP (Intel XE#944) +2 other tests skip
> >  * igt@xe_query@multigpu-query-invalid-extension:shard-dg2-set2: SKIP
> > (Intel XE#944) -> SKIP (Intel XE#4208) +2 other tests skip
> >  * igt@xe_render_copy@render-stress-2-copies:shard-dg2-set2: SKIP
> > (Intel XE#4814) -> SKIP (Intel XE#4208)
> >  * igt@xe_sriov_auto_provisioning@fair-allocation:shard-dg2-set2:
> > SKIP (Intel XE#4208) -> SKIP (Intel XE#4130)
> >  * igt@xe_sriov_auto_provisioning@selfconfig-basic:shard-dg2-set2:
> > SKIP (Intel XE#4130) -> SKIP (Intel XE#4208)
> > {name}: This element is suppressed. This means it is ignored when
> > computing
> >  the status of the difference (SUCCESS, WARNING, or FAILURE).
> > Build changes * IGT: IGT_8511 -> IGT_8512
> >  * Linux: xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578 -> xe-pw-
> > 152022v12
> > IGT_8511: 8511
> >  IGT_8512: 8512
> >  xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578:
> > 3a2760f3080e5188b19cdb4640cec5eb0926d578
> >  xe-pw-152022v12: 152022v12
> 
