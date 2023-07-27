Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E2EC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6D410E5A1;
	Thu, 27 Jul 2023 14:52:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9E10E5A1
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469574; x=1722005574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rrkVjdVQ+SSuJY37usexawVB3GRN7zUYqelFU+Ta0VE=;
 b=WtCihE3wuk5yZJSmC1qJxgfRt1KXhfnFR4HE2l5Q/mFOnrodao0C0jrw
 IBk376NWXd3l5dM2vY1E2ys1MwVJi/Yzi+hKTEoEwBhaZbYu62D7AbIyM
 7uFogG6VNwgkL8AT+H8dAMEGOvxTQNtrAbWQ9s7qLBl+8sgedURCkZRYA
 vrvJu7Hvw6D40qCY2v/8FUwCJKZtgg+uGJq/TGR70v599P54zHSNykQRe
 2+N48VwhOGXWLcT4wyEG5Yf/ANw+VYakhLEn3uJh64aPKdzQUfjugXc7P
 mdzdoi5nD+sJLYofKZKrJ9JAOrvquRGNUwm50AOQ5/pljb5BbV9hOaAIE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432141754"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="432141754"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817121360"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="817121360"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 07:52:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:52:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:52:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:52:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3watnpZrJF1zJRRA1IXTBPmf67zrxXgzh5i+I1NAHPwvWqaJ6RN4QOsHK4hJ3OLrOVh5IsWYIxy0QATacwluxJ2gY/LgLe12plseFLmJjLuaYXXYIw3bixPzOoSF2n24mGqJpZG3JEHUbk3BR0AG8VJM9hWiTDVetqtubPWB/tTW3JgCJ+6OiNnD9j1imupaOR7bHqHbXFhhNoURcOkRHnYe92/pZF4ypGT3aO5nt+zseknAwFItPpzFjfTGve9bipJBxXwRrcf+hN21rHopCAU7uUQxWrQlrQnlEmm5DSLCBEgxAaKqIZ2u8H5F25dODxUvjrRqtlhuRgdrjsXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/6BAQNCFnfOa9Ad1qvHppIR5x8vKzAqX8P7NrZfE3g=;
 b=ZIdJl15PW+eSzLwcqShWMGEbQuMmDjTYtP4guSxjX1N+Q+6KtRNakObeJWaJzO6SUw4ewKqO2gkUGQQw9ag3HLJrzD8CNF7PrJVTzqxESOzblS0yBc9VGtGqmMkaZFze1Wf0CPxhnIRswa62cdN/BckUh2DIH5m+mBwYBvto5lb6ZKegJjhctze7k/CPTx9JMYlf43b/INcZdtFbZkGWZ3nmOzWaOtpr7eyDYvPVLKhTsCcwKz9UnLWE0NyZr9gL5ZbGpCvyBjyAmvfmSXQBkEOs/piCmUze56qKGqFbwimdkHVAc3D74I2DstpW3Al4Ut9xxc2Xvc+x3gY6mkoXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:52:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:52:50 +0000
Date: Thu, 27 Jul 2023 14:52:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMKElDAM3326/Njm@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-5-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727082235.905240-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: e77408ca-a0c4-4a00-90a7-08db8eb12658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GcOEl1+YN/aAbc/oBsl6BTZ8o8txF9kD+X6yttmla5kzdHCaGN0IpCcdsGlkTdbV8QbKihDF245ey5dvtUndRlNjwWS6BzJxKfmOiprXZar6hPD1NWPgjcrkwBwPH7+ubvh3pSoJVLO+Yi/H/yaZTrc0rcTpBqpALBydtGCzV2+nbEWX+ham9DsoBYq+HGeNZxRBFJyScr/bA6hgVGfvS1vtPOPyj6PqruGqUDzpofijvCo1b+sUAQsDHu9/+rez8JN5Jaz2STA6fsDSL9A8r/vqEKk/bL2pbsf6NlKtnrjirWI2FNSzV/31kSgmyfJ2GEhcItRgeUT1GAL1wT9RmH7HkaUKLMDqjZ4ebfXmnDlrb+ZjIfld/0MKTp6VIarffZCIEph205q1orQsmdgcECToX83s+czKfqvbKaikEVdr5mbo3hAh3LwTkq5Kf5jk0z59ME3h01C3kRgWnDg9NZmNaljWQ5Y03soyTFniYbWapVqQScRZDWN6NCglL4weLa23406oY5L8GokJzvzpHf2d5JCbiK+X/zWQ/+xb5RAtK7Vc8fs1aGG4l+lQLK76
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(82960400001)(6666004)(6486002)(478600001)(83380400001)(26005)(6506007)(107886003)(6512007)(38100700002)(66476007)(66556008)(66946007)(6636002)(4326008)(186003)(5660300002)(44832011)(41300700001)(316002)(2906002)(8936002)(8676002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iHoCqxeCRtr3lRTiMUGjCZS2HuWG8t7O3XPOhsMvumjf5ap4xYv1us7oQAmf?=
 =?us-ascii?Q?hqtzsSmFDB4jdNr3gJAjZN7meSBzWVshrqYYIzdKk/GM2mAItLV6JBdoLFZN?=
 =?us-ascii?Q?EuMOXKv+oWjmUI2+NTYxi0yoMy4TWrRPnSkxH6d+u1Y3H2ydbQWvYWpO3IkX?=
 =?us-ascii?Q?C27RbrTwoQpVdgm36oUunGShamJUn5kAj+ZdiS2P6gncg05g45aeZ5uiU0Wi?=
 =?us-ascii?Q?d+pgXdJHgXkCXf8mlvhNFg8rfEdYZuzJ4CO6cxamCcLV1Iq/UpsYwa3xK9bZ?=
 =?us-ascii?Q?MxxglnJxcPdkvCkzCbU+kVTOSG9+gGGVlgV3QJFcuc+EaDvTuxHNQuLNHiNl?=
 =?us-ascii?Q?dfI7LIUxvBXW9ubzabvHKXSoWNzQVWbm3kmEhmkcPuuancje/Mf6aJTMtI2y?=
 =?us-ascii?Q?zpLj9m6ApAzz+ieXtCut8hGh9Aw9z+fdxaiMArL8/f8nPQbcVeuUnzZvr6OO?=
 =?us-ascii?Q?GASEBcKQcQ/vSCGciksMZ++j1ronNXxMrG5gh5pwln7iRGtwnJGUHYQ4aNLm?=
 =?us-ascii?Q?r9jduSNWbeEKS3UwqM4ItgkormG/L0lTIHDNrTvwxVejJW+pg6lNrJ4ktaB/?=
 =?us-ascii?Q?7AjUomQZEmR5x/UGwsM068URbPwzRmwAJsdyles5qdAxDiDMX7IoGbM5fQe6?=
 =?us-ascii?Q?s3RLCOagp1omopSvCQQjXacukg+CBHH40AUKK3aLSAMwJjcJULZgKCQb7zpB?=
 =?us-ascii?Q?9dps/+oW86loE3nqDh5RkgKA7ZHjT5FWwGPXQ1pUz342LoExgpIXfM9pkEPg?=
 =?us-ascii?Q?S/vsMseFvJs2B68UGkulTMyCfeCoCnuG4OBARE2HWYioEY5FuZxAntARVMti?=
 =?us-ascii?Q?NYoUgm3hhBGulP3wLGsZjaKRuIIRawtnksUgFyNdTFCXpNG4lhnBON9dEzdh?=
 =?us-ascii?Q?jAd3e8mHMBuwRb3uV0gU3jXrHmn+irz94NrlL3cRhcQK8Vf1yIcTwCx2sQP8?=
 =?us-ascii?Q?/Y4eCTGRmwYPWdS3rn9W4iEm4CS205ZMdZkqU1slMEQLNIx/jurktifeuxFx?=
 =?us-ascii?Q?EYx+K1w9nXCDZSIT/VFZaQH+zNl62Ll9zlYqmTYq62bLBz8PW1uRORm7/L+v?=
 =?us-ascii?Q?tBUOvAL757Z6g56b2HEZZV66/Zpk/7EDm/bAm7lV4c1iT5K3asCby3BMuuBf?=
 =?us-ascii?Q?csimaiQ3ZNp2/JUZHCc6o211qvMCa2W5brcSt21s4eVNjIS2C0w5etOWCKe6?=
 =?us-ascii?Q?WYnQmyMQliDcsoNQk5B8iFYgCZBeyMA55h20MeaOmC2ViiNOZ7KMjPR2w8H6?=
 =?us-ascii?Q?4luIvGNs0ITxhSZtIi4O4311JZnOfNooVVXnXjrRbvIlvVmpxFyX33/hSf7I?=
 =?us-ascii?Q?hFmVahi0itlFyQ4aN7IzHGIgvARwAP+aZ8VxVw4gSSrYoGPS7RNEvhutx8GX?=
 =?us-ascii?Q?FEL7l75xGzK3+V9tQpqJFPcYUvwyW/D0UEgNnCzJGG1OcCLFKGFg+h31cEHV?=
 =?us-ascii?Q?SPCs1pI/8i13x5jIXUYZHqERotDlrqhkNAJr4z6i75Z1kfOyT/oEIKVgzxlE?=
 =?us-ascii?Q?23hz2d2s7SEX4paAWS09pyaqpz0MOswZrVsD9vMJbhtqor8/xpeYoVXdPQfV?=
 =?us-ascii?Q?fQA+PdEXsBqNO7tOzww96NHVyuscSBWOYV1qcySUqBfllKi30vqRGABs4nd5?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e77408ca-a0c4-4a00-90a7-08db8eb12658
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:52:50.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HiOqx0DcKgdKOApnxs4gXYeAnmmxqI84OUqVrCKjA1EhqNiaeIWE2KXUIvZo6oap+rFpvK6K3LFDam4OuXcWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 4/6] drm/xe: Add timeslice duration engine
 property to sysfs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 01:52:33PM +0530, Tejas Upadhyay wrote:
> Timeslices between multiple context is supported via
> guc scheduling. Add sysfs entry to provide user defined
> timeslice duration to guc scheduling.
> 
> The timeslice duration can be adjusted per-engine class using,
> 
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/timeslice_duration_us
> 
> V7:
>   - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> V6:
>   - Remove duration validation, not relevant - Niranjana
> V5:
>   - Rebase to replace hw engine with eclass interface
> V4:
>   - Rebase to per class engine props interface
> V3:
>   - Rebase
>   - Update commit messge to add tile
> V2:
>   - Rebase
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 5e2dba0be8eb..b1c13d27bcf4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -78,6 +78,35 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute job_timeout_def =
>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>  
> +static ssize_t timeslice_duration_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
> +}
> +
> +static struct kobj_attribute timeslice_duration_attr =
> +	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
> +	       timeslice_duration_store);
> +
>  static ssize_t timeslice_default(struct kobject *kobj,
>  				 struct kobj_attribute *attr, char *buf)
>  {
> @@ -110,6 +139,7 @@ static const struct attribute *defaults[] = {
>  
>  static const struct attribute *files[] = {
>  	&job_timeout_attr.attr,
> +	&timeslice_duration_attr.attr,
>  	NULL
>  };
>  
> -- 
> 2.25.1
> 
