Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF65CD6115
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 17:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B0E10E0BA;
	Mon,  9 Oct 2023 17:43:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046F810E0BA
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696873426; x=1728409426;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g+bebu9QiHvWMqSGQ4PPnZk62OvktO7I5sko4hs8qyo=;
 b=DOzhPWuPY9HSTtfxu3w6r+3zeq7GM07rQpnhRq8+zX5VF3jNXY4+Jc6r
 RUOSjtBGGszHEk6SKbZtJJ8eGx1XwDf6rTonD6uB1ON9Rqqkan1EGPJWU
 uGCony8a7AT6gUKJ5RVZwkIcEknOxM6eK8QjN581unDHKbQK27ZSahuuE
 WsMTKAXvSVK3pTZr/vbI1cPOfFDOgqHgJAwtrxwOEevtwcvp4Lg0/DoVW
 CU9cySpUvbbw8JpryL7fJtp8o7hG0P/ERLfBTigQa6hX9QbeiPWf630ps
 acGZ4Uz8IPsOSbM32APxgh3Cqj6NvofmeR0n1RJso8sMF+24r6ALhrQD1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364497123"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="364497123"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 10:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823413616"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="823413616"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 10:43:46 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 10:43:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 10:43:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 10:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMzz/94oEDwciNN1oxh2olrrl6U63dTcMVy11jdeebJpOabOSw66bSzZC7THXZA+/JSIlkVGQb1gbLSVL+8vV1Id3MCu12lcT4P/gD92PqY4SBf6ZgCh53r6ht9nMFMMVM5+SLT4ow9lZsD6AfDZm5DUK5xfgH6IGifl8xhHByiGKKJw0BgMHW0nOXoNExUEIIMxaH3Hpy5oVR/V6lphwd7yxPpeQehIgjYVTc1VFkbMq2QoliDcdsWRLtgGlvkYnyxPm7zCgtsparmy8kSdflgdN0wQ4/5fsI+1rRV+GGcn6IK/jxIRpfNHP2L3cxY0yMg5sBpa6CZOD4gUjQ7b9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYDnhBDNyLRaipXafDfYUck8QkQGFOKH9E6VC3njwI4=;
 b=Ub7IQ6IAgqW7l7qnpIlpwcCZr/JfXnKDR1Dr5EKvaozfvPlqP5VDELnxCVwR8LTM6pRocPpR3WLduW8E8hBSjbUiBDQwQ7BPI40LKoamMDZQm+7dAs0me4c+EpfKlXIZIFh6SGEsQuodtPEV3UgOtNuwk6LAOT6yo0QgTGxVTNNekNfkadtB7/SKpFktLiQmBuL1zj9+WS4QJU9JUJtVOrmhZJlZAYEWio0UlMg/FERfemuPEzk0ZnY3B06Izvi0tFtPE7hLn8Q14ogzoOeZJ+xPFLqltyNg2pyTNCNOr32I/tFOFTVEze5Y3lf4BCFBD8TuLw5kdUxU+DlklcS51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 17:43:42 +0000
Received: from IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::a35e:550e:d46c:c777]) by IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::a35e:550e:d46c:c777%7]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 17:43:42 +0000
Date: Mon, 9 Oct 2023 19:43:37 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Zhang, Carl" <carl.zhang@intel.com>
Message-ID: <ZSQ7yX7cGT4-qqto@fdugast-desk.home>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-11-rodrigo.vivi@intel.com>
 <PH0PR11MB5579234460182325F9DA50E987C8A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5579234460182325F9DA50E987C8A@PH0PR11MB5579.namprd11.prod.outlook.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7838:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2ab8ac-3708-4819-0e75-08dbc8ef473b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKhnpVDeYQHv0svWuTIj4d8joHLtlFova7n3Qe0V0RnSuUc/c9K76djGd7g3Q0LYNghX740X2wkSy/yZeThIslFEnkuSDCeSqpckZ870fZl4cF1idHIZo/qTQc0vFZrSiB64KPUG2leh6I1Y4A4UjO+/iKIwqf6ygjrsT5soMnK3YRFe3UFwtcaa9Mxt1vRRBNENLeoPQzt1uxmChQcx5qTDosBzW9PpCT8M3Ohjue+Q4SM+K474QicLLUaJEa0N3+VPiBkMt9aCjUPsk6dHx9lHLd8tzKlEKgsKEQOSoyDrpy0OexuyDdmnsso+QE+HvRjwgld25zZJ3NJ2PobUD9IuKgcSEpyYHWwO7oKoQsdxthyM6vcK+fvCNB6T+XdagGbvPjMzwIlbmNK9tI5zaIcjMi1si2uWmYGaySp3cSj+TDKsadp0ptXhdkBIHwXpeH5grYOwGp2Bq9ZYgtWDBQdBus7lQ+Vuy5YtB7CnCdxcOGF+0XMncz4VAljwC5Ts3Q6bVrA8VxlTUOGoukVfrNSwtoszm5gvQ8PFQKcwZVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7838.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(53546011)(36916002)(107886003)(6506007)(9686003)(6512007)(41300700001)(316002)(478600001)(44832011)(83380400001)(966005)(2906002)(6486002)(66476007)(66556008)(5660300002)(6636002)(66946007)(54906003)(8936002)(4326008)(6862004)(26005)(8676002)(82960400001)(38100700002)(36756003)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JuKV4bvouesojuV5uV2+ZDiqQntLdSOIXF8qXcHC34+A1R7apSnEX75mfWDX?=
 =?us-ascii?Q?+QQR821XdEiPcbc9N8nWMnsFG5REbqVBHrFT5iCj54ZeE07d07lkLdSgwA8Y?=
 =?us-ascii?Q?R0VTzDf5jCt2TFWbIV73lK+p4+LAlSa7/19tclwtc91E99U+AbIARJxDIu3i?=
 =?us-ascii?Q?91D6EFN+hXfMmdHHf53oPuuVKy1TiKy355iIQsmblsxvIzjO15IL7/nNVdJZ?=
 =?us-ascii?Q?hp2Oc/BG0Rx+Hx+X8TW53ZrxQ5uQTmfb4TlFQm9lXwxvvzQeDabmF7v5xe8E?=
 =?us-ascii?Q?jiM4tE1U9Pem7H+DGZAAAFgQ+lhGxY4eqsE53wKuxlZh2+wlVrmUyYTG4kuD?=
 =?us-ascii?Q?iDAOCQJVoLunrxiQPmvGfWGQlOneqvgykg6i4PbBzn6zc0iPNgkxxYSyEasc?=
 =?us-ascii?Q?+6OtdVnWosq6il4PwzYzQ5SrNYoIlumvpYrZVlJ6+h0ernxp997ua9IhbgTg?=
 =?us-ascii?Q?sCgfWJ78Rmt9sF/j8mZlzMEyST8Gg/GTJ5h1HHOo8YgUaENkrVojnVs9gvOl?=
 =?us-ascii?Q?Zvv18SmdzCLfi4PX9VOoZTWdIsJXtHpQ80nfm7mP6cwP9zpXNRxzMsMco81Z?=
 =?us-ascii?Q?1/5+ydOhOy7tFCoqBrqri2shlN0QNJFAuqitiV4BU7HTUI024wh1b6hGoCIW?=
 =?us-ascii?Q?tuBilDBcmTZ744mzxTSCvkmtL3/GW0zitg4RCyF95F1ElEhRPo29T1CoYVHN?=
 =?us-ascii?Q?dbRK8ttjdcPHqb83wyC3UidEvtPNz1/Yi5u1zIJC1mkxZjROXW6SMPjXE6Lg?=
 =?us-ascii?Q?VuKanofmFR2xcfRWmXpiHKyM+Rp0Dk05m2mQe9TGA71ZrlH8RhRVmSImUJh4?=
 =?us-ascii?Q?HOEA0sjSF90KxtqXQT18MLHCQV7+0EciCG1aqjUv3BUXUgB+qr17DhVGVtd4?=
 =?us-ascii?Q?ef+wU/WwB+4GuUP+vhDvsxP+DXOrPqszELgNjodvkyGEOpibXcHp3alW4ewN?=
 =?us-ascii?Q?06HFx/pBDxx7gB6/u5Ytke6XxouVPJsGB2VOfhWJK3A3RyE4KYK7oXu8Qv7m?=
 =?us-ascii?Q?rvcbE9dC9dt5BJ4JNPyp+2XdzYL79yZPVMcTpjntTOzDmffbegcMAP+OiJvo?=
 =?us-ascii?Q?eiwuWCgkeCQ9IEb2sCHBzZUDToQicmwXB/Q+DaRcMtJvA6aLoT5WIB0/iMFi?=
 =?us-ascii?Q?Q6wn+2AdWPHV0hMUrFLn2bqLwv3sHDYqBZ9YDsjlOJbJcpEn929/1sTPaFS6?=
 =?us-ascii?Q?X1St8AA3VExiQftPtgPhslRbwSufQDSUN5prAu3sRwZ18YpzqikxEmx2x50L?=
 =?us-ascii?Q?r3EojNfmsonlKydMaVrjaojpMuP+LTBcIMYreroSF2ja81uECf8jHv+CqlUs?=
 =?us-ascii?Q?3+LyiUb3v1DRUue4M+XYdPOz68p+dUL1t9t1a9TWE23FYI9UHxj/0PDg9CBy?=
 =?us-ascii?Q?5eHPdDDUSiDR8nUwbJE6SG07EO21I/OxpRgs90BfLu8gYWnOrqod+NMfUeFR?=
 =?us-ascii?Q?xES/tTsxbH5t4cRltw+ngDvu7WFwijM9qFjNRyfzhtvRdYHoNb87qlmkVZte?=
 =?us-ascii?Q?djc8oDCBnvMx6hFk2YdyXb1is4nq07lgr1sHwvN+M922iolUNbAG3ZjFMjJh?=
 =?us-ascii?Q?A00Trs+N5/rjDE9b/TsZmc8/wxNwLYYy5pTQSo99VTTS//gFI5GuToVjHqF0?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2ab8ac-3708-4819-0e75-08dbc8ef473b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 17:43:42.2063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVBz49iZXOerwoMJ+Dt2oyRN6/co82H6i45w2Etw2B0nhUGDAz0Zw8b4v8RS0pTN3Ndnr7D3UVoUjOuhJkFjX5xJMtaHW2/KN3Y3iqBI2iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/17] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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
Cc: "Kopryk, Kamil" <kamil.kopryk@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "Chaberek,
 Jakub" <jakub.chaberek@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Oct 07, 2023 at 08:20:39AM +0000, Zhang, Carl wrote:
> Hi Rodrigo,
> Is there detail descriptions for these properties?
> 
> Thanks
> Carl

Hi Carl,

I think there is not but this is a good idea for uAPI take 2.

In the meantime, when using those properties leads to setting
a value in exec queue, it can be helpful to check the comments
in the matching member of struct xe_exec_queue [1], for example
XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER and acc_trigger.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_exec_queue_types.h#L29-162

Francois

> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Tuesday, September 19, 2023 10:25 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Hazubski, Filip <filip.hazubski@intel.com>; Kopryk, Kamil
> > <kamil.kopryk@intel.com>; Chaberek, Jakub <jakub.chaberek@intel.com>;
> > Dunajski, Bartosz <bartosz.dunajski@intel.com>; Souza, Jose
> > <jose.souza@intel.com>; Yu, Effie <effie.yu@intel.com>; Zhang, Carl
> > <carl.zhang@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Vivi,
> > Rodrigo <rodrigo.vivi@intel.com>
> > Subject: [PATCH 10/17] drm/xe: Remove
> > XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> > 
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> > deprecated in a previous patch, drop from uAPI. The property is just simply
> > inherented from the VM.
> > 
> > v2:
> >  - Update commit message (Niranjana)
> > 
> > Reviewed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
> >  include/uapi/drm/xe_drm.h          | 19 ++++++-------------
> >  2 files changed, 6 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 170d9d9c48d2..f70332986c73 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct
> > xe_device *xe,
> >  	return q->ops->set_preempt_timeout(q, value);  }
> > 
> > -static int exec_queue_set_compute_mode(struct xe_device *xe, struct
> > xe_exec_queue *q,
> > -				       u64 value, bool create)
> > -{
> > -	return 0;
> > -}
> > -
> >  static int exec_queue_set_persistence(struct xe_device *xe, struct
> > xe_exec_queue *q,
> >  				      u64 value, bool create)
> >  {
> > @@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn
> > exec_queue_set_property_funcs[] = {
> >  	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] =
> > exec_queue_set_priority,
> >  	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] =
> > exec_queue_set_timeslice,
> >  	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] =
> > exec_queue_set_preemption_timeout,
> > -	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] =
> > exec_queue_set_compute_mode,
> >  	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] =
> > exec_queue_set_persistence,
> >  	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] =
> > exec_queue_set_job_timeout,
> >  	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] =
> > exec_queue_set_acc_trigger, diff --git a/include/uapi/drm/xe_drm.h
> > b/include/uapi/drm/xe_drm.h index e39d66a65c89..fb7c3a8ac572 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -784,21 +784,14 @@ struct drm_xe_exec_queue_set_property {
> >  	/** @exec_queue_id: Exec queue ID */
> >  	__u32 exec_queue_id;
> > 
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > -	/*
> > -	 * Long running or ULLS engine mode. DMA fences not allowed in this
> > -	 * mode. Must match the value of
> > DRM_XE_VM_CREATE_COMPUTE_MODE, serves
> > -	 * as a sanity check the UMD knows what it is doing. Can only be set at
> > -	 * engine create time.
> > -	 */
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> >  	/** @property: property to set */
> >  	__u32 property;
> > 
> > --
> > 2.41.0
> 
