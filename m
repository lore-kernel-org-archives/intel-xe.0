Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D415CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 07:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E8F10E00E;
	Fri, 13 Oct 2023 07:59:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DFB10E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697183943; x=1728719943;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x3okrfq9To6lVpshUQpbPacfIh+ZID58INPbQOC0tpQ=;
 b=Rb9IiRiR46r9EzR0BuTyuzo128dsXiPAG10r2xEvVfBi6q0Taof75gLL
 OdtCu5kXYACiumcyjPfheE0Z+eQWMdQ2lWo+h3DidBSNkbC25JBEGtqgV
 29aa9Oq03vlowjpbJpaVG46UKEm6IMZQ1hfAuR79GcSs34Iz5DW4RHQ0B
 zWeDEyCNfqS5ZIhxmiM56Dce2JQ4qBzkLbJyFO91zjYO6Ns6zgUZmJRNW
 2hVVjyo7dBkrF64wJvG5ILUcC1KEpUudvG6On+LWqUr4Y1rZAUY0m2V38
 w10jFKGl81d3qp4eFrkkIsan68U1Wt9mj29U0FoeeOreHUxYwJ7WDt14W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375475375"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="375475375"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 00:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754617214"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="754617214"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 00:59:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 00:59:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 00:59:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 00:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxxUKmjw0ZjTJXz0BRuZG247CgHH+oKUxIz/BuxH6Rc/bKovh9USQngzTKmkyE7Sl/4msTkGXvaVcaLcRNwLDW+taffSpdOJcoEN+ROkfjBPw0Pm4fWr/KsjT39YtkNd+ZsG5hPdrJE0DfjXstIGAvMv7rlvqW3sMl2HvggMwEyC8qX1AV2lz3/dVkBRBTcvc0Ndh5AO5ibwTS93cC1joXMxylKP7xkU0NF3GGUq/OaD1fmKJsir4nnTyWRlWtM2JL4H6R6ysDFGXB95tVqq676yeBemYyO2ekFJX6Oh+IsefMbeAVnZPUjK+iflEqapiUAqRWKFgdWvpqBP+/7GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgVWxpzHc4g7jgOC11kPSYUbetbM4VdkQyE7QbnMV2g=;
 b=YP3mcVMI39iNtB1NN6uAFKxKxR5e79VhVaVJplgl0hlPl9Txz+l76zt1fjWBmT2rPQduUQPxWZI7NWQW3vY5QfxxQafiveTlPZWw346PumheHYuulEbk2dqRTFlvHrI009nn22+dXqkvIT5CE1lIfj50UYaCtfK4X9xMNI6Cr4eO47X2U1zEuotLq+VJfGuoytC4RfwJbPLAfP4mIQv70TVwdYE5IU4kEPgAqDQOoM+bBgVBqHJf+/Iw3pusX8YTQni1W5dCEzw63W/yxECX5xM0gefz4LMP7n9LS723Uj79xwjqfpajEdr6mAz2QNqj88+PrgigSr9zJ2QzroEtJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Fri, 13 Oct
 2023 07:58:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 07:58:55 +0000
Date: Fri, 13 Oct 2023 09:58:42 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZSj4sgz2UqeXea_c@fdugast-desk.home>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-5-francois.dugast@intel.com>
 <c64733c1-9472-4308-89c3-43feccc32976@intel.com>
 <7594e54cd6eaca370ec3b8e7ee6c0270d7cde3da.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7594e54cd6eaca370ec3b8e7ee6c0270d7cde3da.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: ead31f55-ba57-4add-8383-08dbcbc23f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Coo7lpNSmnDpVzbM5DIw49AO2kgJZx9bFMf7GTHTOI7NJBmzbNgGPU8r3k9BlWrg7wbgVvxiVRWtlJKfkqWgfYw7aLFfU+ZKYmIT5PmX/rWNqFrIikYVFcJp0SMIegQ4vs3wx78HetFAxZpMjghe7a57uI5ZqO7kmn3+MFzg7qP2+43krKEflFdIZhgsYWuKBArTNRWv4ytzYuHQNgzJW/rNBiK/SHgtVmnsWdHNauSunrqNRUK79WAQyP3pDLDlYe+PyCg2p1VO6UL6F0aViWqhM701yGJUOrlml9eSHIhnXenY/IsizqZKQ2slaXond8VLBtNn15SGGaPFRnKvD3aoU1x96sCiQ3hn4xYLJfORfYhCcry5fnstla/XCRUnBBRWMvDprGp5DDhNSG9KP1MyZlvyGz1nvxaNmtLV1Ie/boWFcecK+Z0Ax4lpvW/mJh4Ti1OE6EQEah1Y+6Kohb2DLSV5GVei+RymiZnzzAYX8RqVt8iB8D5l0wUThY7U6+bu+mXZrP7UjfFHVFvi/81zW7IaxZgGAoby8E3d4nHYAC1sFDF3mQbpiKq3J4F+7L+9wsSvKzxrqr1OwTXsvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(316002)(6506007)(6666004)(86362001)(4001150100001)(53546011)(36756003)(36916002)(6512007)(2906002)(9686003)(6486002)(966005)(41300700001)(44832011)(5660300002)(38100700002)(478600001)(107886003)(26005)(6862004)(8676002)(8936002)(4326008)(66946007)(66556008)(66476007)(6636002)(54906003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?l2PszRQ1ZGrklVrrt1N7gZVFN1+FJLock2HpotqHhxAdiniEJiQhK1OIqm?=
 =?iso-8859-1?Q?SrGdv3vrAjjP2PejZhsna3+AMv/19DK9mItW5IUebLyboSCaskwS59WdcA?=
 =?iso-8859-1?Q?npGpJnWUq2bcjFXtQbZw9pOVQ+hBMP1/FOSkcB80u2Gdt/0umPX8Za5WC9?=
 =?iso-8859-1?Q?w1D0LK3B0SbvuAaN5HcBUXCu5mybNYqOA3ATAK/N46CatTtDL5dzBN+sQB?=
 =?iso-8859-1?Q?diN8hSoOA48i4cI71ISch3rSWA8Ivb8r7v3JeXgIHJiYvYvdNYZX7lv63o?=
 =?iso-8859-1?Q?mtOQz8MZ/CsUqexU71ox20d+737hMBshSAro93mJdBbeeJf1bbxtywY6Qt?=
 =?iso-8859-1?Q?vxv/mj/ENDNpWP9y1X0itMkd47yFZsSiERq0BGRMiEIsFZwtQcMRvZJ1Y0?=
 =?iso-8859-1?Q?AupRdfBg1Mm3gJjC6DzTmRdFG2dVioyb57+D6kN4DdMHDHtoZUisFD76jU?=
 =?iso-8859-1?Q?zqtlKtGXg+abIUdaqycVsRz7zy2G0UESoRX9HPYTJqOkDqkZTB4Jno2MDZ?=
 =?iso-8859-1?Q?NpjIqwaiLme4atNHgddNMHXRn2fTfZHsBr//zrww8I94P2wl1H8lPSHUUk?=
 =?iso-8859-1?Q?CaVWMNqQxk8taE43EyeyfJVdaPJ/MXkPoJzz3T0lEf2BJuai97d5tcpSyp?=
 =?iso-8859-1?Q?cm5SySEeUJoCKfwgbRDOBDVqgknxQYhAOiLKAXW+iwDpGq35wglWgOH7Sy?=
 =?iso-8859-1?Q?9AKkNON/6u/uUA+G0xp6/qOyXFeycvYWMNZjkuq7SAkRqbYtQ4elYX4e7E?=
 =?iso-8859-1?Q?MZQLCZapqcHMEzvcKTu8SDDwtCHVwdHsh+UOFbi8G5QwHLiQ/p4Gi4L3tT?=
 =?iso-8859-1?Q?j455vZYDohePSenT549zHEQjSCJwmOBmW907WY/BI2U4FJf5lEm17EKOLG?=
 =?iso-8859-1?Q?ERXVXNkQPS4HoytqCb6DC62n0THq6DSWV7EwPJt5forwO3+4/drqPL3ngg?=
 =?iso-8859-1?Q?JoGt3dquQviZ6bykct7OZ6X70JmDSl8hWntN2hH4rwYByWCWzOlfYFZ5sU?=
 =?iso-8859-1?Q?3r7c2MxZZaf/A+miDneNQouZZxmYmxnn3e8jg5kMCENvrUnQDyCR9PexAY?=
 =?iso-8859-1?Q?D2L2eeNcNAWcPapmm55s1VAJ/drA2IbzxzI1mT/EEkIp7dbxW4wlAZADs7?=
 =?iso-8859-1?Q?bjJmpmSP8q77KWZXRK0u7+Vg/6JIrfwAnQrokTp0hrx4CYoCVqRNgBBVod?=
 =?iso-8859-1?Q?K7Y/+gaxUgRju3yiD8fNKuaiVtbjJhwyA4OsSRAt7L5u6OmLqV5Lg9Xc0h?=
 =?iso-8859-1?Q?p9aHFPdH+ErqzB3vaMu5VhtDikntoDIoB6VkLvWUZyqQ6wiS5Mj8ujs6/d?=
 =?iso-8859-1?Q?sFIgQarbXckQy2+ADuORjNYxsk1T+UDIs3/WowvpM4xyJTiLIVcoq10D8f?=
 =?iso-8859-1?Q?rfdWIeeuDOaw1Qh9rUMACni3re5j2DP5FKhEFGKEP+wOL4KiGhhGksd3Q5?=
 =?iso-8859-1?Q?cnUAfV/7wv8ujwC2dCdt9PLvUivcm94nm1InBMt17x38HDe6+XXTRbCow0?=
 =?iso-8859-1?Q?4ZsOQUmvoAMcjg+d69A+jlPCgwzg4bd1YI1KDG+npLInl4QhGnMBx0HO9v?=
 =?iso-8859-1?Q?mTa7lXYdK1BMj8qF0ZyTluYm3q2G56Sw0sZBEs0/E5xWkD86Bo1GAJoRik?=
 =?iso-8859-1?Q?foeFfJUk3Wmun1wQAkFJbH1+WmKYmXmJZfI2myXghcKRBfA+ACDA6OwA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ead31f55-ba57-4add-8383-08dbcbc23f3d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 07:58:54.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Um635mEjcwAyRe5K+y8vYaMrKyg8yB75wLvNhiEiDCZ8YJuu4jYWbKyszxZb5UgtHbW0pRYOJ7BjIQLuLDSC3F9D8zTLlT7AY0KPLGDM75U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 04/17] drm/xe: Add uAPI to query
 micro-controler firmware version
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 10:17:41PM +0200, Souza, Jose wrote:
> On Wed, 2023-10-11 at 13:07 -0700, John Harrison wrote:
> > On 10/11/2023 06:59, Francois Dugast wrote:
> > > From: José Roberto de Souza <jose.souza@intel.com>
> > > 
> > > Due to a bug in GuC firmware, Mesa can't enable by default the usage of
> > > compute engines in DG2 and newer.
> > > 
> > > A new GuC firmware fixed the issue but until now there was no way
> > > for Mesa to know if KMD was running with the fixed GuC version or not,
> > > so this uAPI is required.
> > > 
> > > It may be expanded in future to query other firmware versions too.
> > > 
> > > More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
> > > Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
> > > 
> > > v2:
> > > - changed to submission version
> > > - added branch version to be future proof
> > > - checking if pads and reserved are zero
> > > 
> > > v3:
> > > - add braces around case XE_QUERY_UC_TYPE_GUC to make CI happy
> > > 
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_query.c | 41 +++++++++++++++++++++++++++++++++++
> > >   include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++++
> > >   2 files changed, 72 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 10b9878ec95a..efbcf2ef436e 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -498,6 +498,46 @@ static int query_gt_topology(struct xe_device *xe,
> > >   	return 0;
> > >   }
> > >   
> > > +static int
> > > +query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> > > +{
> > > +	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
> > > +	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
> > > +	struct drm_xe_query_uc_fw_version resp;
> > > +
> > > +	if (query->size == 0) {
> > > +		query->size = size;
> > > +		return 0;
> > > +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (copy_from_user(&resp, query_ptr, size))
> > > +		return -EFAULT;
> > > +
> > > +	if (XE_IOCTL_DBG(xe, resp.pad || resp.pad2 || resp.reserved))
> > > +		return -EINVAL;
> > > +
> > > +	switch (resp.uc_type) {
> > > +	case XE_QUERY_UC_TYPE_GUC: {
> > > +		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
> > > +
> > > +		resp.major_ver = guc->submission_state.version.major;
> > > +		resp.minor_ver = guc->submission_state.version.minor;
> > > +		resp.patch_ver = guc->submission_state.version.patch;
> > > +		resp.branch_ver = 0;
> > > +		break;
> > > +	}
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (copy_to_user(query_ptr, &resp, size))
> > > +		return -EFAULT;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int (* const xe_query_funcs[])(struct xe_device *xe,
> > >   				      struct drm_xe_device_query *query) = {
> > >   	query_engines,
> > > @@ -507,6 +547,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> > >   	query_hwconfig,
> > >   	query_gt_topology,
> > >   	query_engine_cycles,
> > > +	query_uc_fw_version,
> > >   };
> > >   
> > >   int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 47d2d0468339..f7ca52aba79b 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -466,6 +466,36 @@ struct drm_xe_query_topology_mask {
> > >   	__u8 mask[];
> > >   };
> > >   
> > > +/**
> > > + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> > > + *
> > > + * Given a uc_type this will return the major, minor, patch and branch version
> > > + * of the micro-controller firmware.
> > > + */
> > > +struct drm_xe_query_uc_fw_version {
> > > +	/** @uc: The micro-controller type to query firmware version */
> > > +#define XE_QUERY_UC_TYPE_GUC 0
> > I thought it was agreed to use TYPE_GUC_SUBMISSION to differentiate from 
> > the file version which may need to be added at some point (e.g. for 
> > reporting status in a control panel or something).
> 
> It is being renamed in '[RFC v1 16/17] drm/xe/uapi: Be more specific around GuC Version Type'
> 
> In my opinion it should be squashed but up to Francois and Rodrigo.
> 
> > 
> > > +	__u16 uc_type;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u16 pad;
> > And wasn't there a comment about just using a u32 for the type? What is 
> > the advantage to splitting it into two u16 values?
> 
> yeah good point or rename to rsvd so it can be used in future.

Sure this will be in the next version.

Francois

> 
> 
> > 
> > John.
> > 
> > > +
> > > +	/* @major_ver: major uc fw version */
> > > +	__u32 major_ver;
> > > +	/* @minor_ver: minor uc fw version */
> > > +	__u32 minor_ver;
> > > +	/* @patch_ver: patch uc fw version */
> > > +	__u32 patch_ver;
> > > +	/* @branch_ver: branch uc fw version */
> > > +	__u32 branch_ver;
> > > +
> > > +	/** @pad2: MBZ */
> > > +	__u32 pad2;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved;
> > > +};
> > > +
> > >   /**
> > >    * struct drm_xe_device_query - main structure to query device information
> > >    *
> > > @@ -518,6 +548,7 @@ struct drm_xe_device_query {
> > >   #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> > >   #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> > >   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> > > +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
> > >   	/** @query: The type of data to query */
> > >   	__u32 query;
> > >   
> > 
> 
