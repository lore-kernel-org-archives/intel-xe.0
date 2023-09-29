Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9143E728C4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 16:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA1910E13E;
	Fri, 29 Sep 2023 16:04:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE5010E13E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696003440; x=1727539440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ons3fzEraKvv7luS6qXl6IqZ2ZZlsyS/45zgbG8kCNg=;
 b=BC/WRR97sGPzCBQLoJRcwmN97IUp0F4JjpBhKNApLbnF0xm1dfxGf0yQ
 /8JhcLGvLrNhBz+OPdR02vygmkfaMLZpTNghWky+z6GLaz5VIl4SElE/s
 ttPJkI2YU7k0+hrTeCQeDszScinglMSQdJa1zlNoutpwPb5y/XPyU6QLk
 9WGQSx8YOy99VFLLrexAbtVHB2hXNubYa6XY8oCh4ekT77XDM/n57raMi
 B9+BdnDtCAVzVDfrTMpAUUVshoA69K8zfxgeRZ8zy3m9p8cCkfwzSRPr2
 fQ3ptg1jFj/eoX470xk1nS/5vkC5uV2S/ofP/wQLuOlZHq404Ezj06Age g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="468614386"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="468614386"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 09:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893461250"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="893461250"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 08:59:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:01:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 09:01:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 09:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S++XQJVlpFttxBnWwHrgyQ/mjr9a6yKqkJ7jPks6WfmndMkGgO2LKuakVxTXLEZWB8khEhgl2sjzFk5v6Vu3PUTfwzkarfZj1XldYV3uHmuAfyUh6ey3o0hdsNR/uyWjbEMM60x/O/FpTSS7N825UTIwKkMMml+400gmWB27wJR8CV7bIlZNXy5cJeC2YhVxiBR7lORI+YM8zrR4XzlxWtFipcd0nEtbBh+Ltnn6ta2ClSYi+BPXQSdWt7uK8QvcLN7IwB5ZzjHO7Wrc+TwzxSYqd8khm83HRwhfK9f+zrU8QM7LstsxnrPsJocEV46PaHI1N/hGEK0RwgO4xu6rSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH/MXiwaQoPNy+hlI3n0xlYU6qCOhVA1/FURKpsOt8c=;
 b=P+zOC3jKXrdLj1C2T8ASfWjIcirgL+hrmTVvgloNeODvvCXSrKlNrWB1bu08ZldNhr0jNYwBdmhpCiwletdtMrY8gTLHVoAu+s7mXR2TdOculIHyh7QzC4ipe31kcJMmOjZ1S3ajeHnBXjs2tLjd+3hGDkyKFP4748h5mbPrmee7L/X37PxjaKIq9TDc9M5kaEq55b/tWaFJG6n5GKRugeFEaAycMvk/73/fuQSCF9Mi3/1hE9FCi3FzKmSGxKVz1xegQz4MwTsp1PdFA53a7R8UpH+wmup9jZTZQrP2rVZAFEeFDXnwowmMUwoYFyvClinPnxUJwXZltf2Wyt4e5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.26; Fri, 29 Sep 2023 16:01:07 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 16:01:06 +0000
Date: Fri, 29 Sep 2023 09:00:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZRb0uavwuieKeqVy@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
 <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
X-ClientProxiedBy: MW4PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:303:87::29) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 959dfad8-f6e4-4546-1b2f-08dbc1054a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRnHykpv8le3vv9n5i8KXhB35aSmqxnGDSicqpRwqXqEaINIaCqcE5y4mav2moYxYl+CDJ8mE41CC5tWqAs5ggyP7aq2tCT5kIZI1AGIFLzRULC9xZMCizpxCh0pn7AxclHCIAYzHY4g6dQZ4Ld54ON5zY78+Y43/Tuz5ZO7CqBfhJ3da5Fol73wgb4pFemRBNuc+1ZTn95pmFTRQes7lu6Qv4abItAguBwLI0bXPDnXNLgASpzlSyv2JkBeAZZpSV5amkt1MfYIBdgB4xW5HYsswUhbjtUoIdf+QUWvgkJ1A68MTNMBKuU6tfbP5tx796+4ANlcsIybYCXwgARPC7Mw5e6gXoanKNDGS8Q846mZV1cNYu8fQVbu1R88tx5EidswVgMlN8QQl9cKS/liTwjaFxL4Umxbxxg59xYj/3Xey8n1W1MxLg1/40QYxKwMZvreU1/YJDbN2gm1QVgs9NKgYvTaZ7rxCB/6QZHf76xEMrbTRNxjLL2G+pTqUorxlHE8S5rFysG3Z7mmVU+mJmzpXwAut1duFJOErbe8W4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(6506007)(9686003)(6512007)(6666004)(478600001)(966005)(83380400001)(26005)(2906002)(33716001)(5660300002)(66946007)(6636002)(316002)(6862004)(8936002)(66556008)(66476007)(41300700001)(8676002)(4326008)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3Vta3hoTktmVzYxcW85RTN0ajBxMkpWVDl6RDVLZDFKTno4Z3JFNEZScnpE?=
 =?utf-8?B?OGloNFBTYSt3eEtqcXZmTTZwMnhxYUdrYnJ5V0JoZ1RiUGlzVE1oamwyU25T?=
 =?utf-8?B?RnE1SUxJUklXRWI2RVJJSmo2NEtJQmpSSlR0S1JnVFJXVE1GWktxOEYvNCta?=
 =?utf-8?B?Zk9HOTBwcVNFRnRucmRFR1c0MnAxQ1NYSGpDb0VvMDdET2NGQmIvcGdUem94?=
 =?utf-8?B?eHJ3VTFzOFd2ZVRvZTFReEZwUlBSQ2tYdzE4SE9BTHJBbm04bHYwd3QrYXlW?=
 =?utf-8?B?b2g3QUFic1liRkpiYUtBVGo0dk5xRlJrUDIzT1dFSEdXWTJnK3dUQW9LaHR2?=
 =?utf-8?B?L3ZyK3BZLzRjRDJOcEpuazM4RnZMUnNFbnpKOFRDQlZBM2hwKzRQanZMWDZM?=
 =?utf-8?B?RDRreXdSSFg5T1JGVVBEWjI1d1g5UlpLVlJDYmFRbm9EVnBFU25hY0pkZlJl?=
 =?utf-8?B?U3dEWHpkcEJOSFBEL2g1citRTk9OVmtZUGViUDRtaExKKzFXcGJ1eURoMnhi?=
 =?utf-8?B?RllwRmMrMnVaNUZVVTdvU2dOMHZWbXBCaDlTMXBTK1RTdzBnVUJQWlNCbHdE?=
 =?utf-8?B?Y2hXRnF2SzloRjd6ekhKRXpkbkUvK1A1MWY0V3ZtTC8wcll1Q050Q2pBVm5k?=
 =?utf-8?B?NERpN3hMQXNvTUREdjF0MU5sREtLbWNWUzBRTXRkaXFBNHNiUWFBS2J5UlNI?=
 =?utf-8?B?UVloMS83QzZDYVRFYTlCRXFiYnlKaWlraWI5WGVFTDJHU0NNbFNJTjcrdHBo?=
 =?utf-8?B?UnVtZDRGam93YzJjNlJMVXVqNWNMWnhybFFmK1dZY2tGZGhBOERUSEZOWC9p?=
 =?utf-8?B?RlBYaTZWdHArQVBkbXlZcWVZTFJEaGlxdk9tMGFvdExZek9Cd2k5ODVYYnQv?=
 =?utf-8?B?Y2hsYTJTVWx4YldUYXRQTVVsWlBzbEdndStlVEFpU1p3LzYrRHhDellMWnRs?=
 =?utf-8?B?cDdQODBIT1huaWVRZ1ZVcGUxakxTMCs1R2JZeGhmMzZjcGFOUFpDVFBTdTJ2?=
 =?utf-8?B?OXA4L1ljQzdUTDhTVVk2VEZpOEhwclVTWW9SWkcwRCs0VUY4c2J0QjR6UGZx?=
 =?utf-8?B?Y0s5MVFtL0JHempUTU5RRDhJL3poTG5yREp4aWJwK3J1bTBFWllXQlZ3R2ph?=
 =?utf-8?B?T0k4VnpwNlM5L0tJMVVUYjlzN1RINTFxTXdNckJ0VG1VS2JqSWp6Z055ZXdo?=
 =?utf-8?B?bFhHNWNJT1RpTGovWlBhU3dOYnpTbTlkUEJDdlV4dFVlTzM3TEFQN0VyVHUz?=
 =?utf-8?B?WEJTbXlhZmtmeGpUcDA2WmoxR2lJNnN2Z0MvN1g3NjVUd3lmdEJ5VHdPdWRV?=
 =?utf-8?B?Zm1jeXh3MWMrY2NKYWozUDQrZGZqYjlIbkVGTm92NHpDOTNkUmJwZ1BIU0Fr?=
 =?utf-8?B?VkdHVHZUazhneUY5eDR2eVBibHpybFpsZEJ5VTVJd3J5MTEyV0dENnpaMWRx?=
 =?utf-8?B?Z2hJZlJuc0U4Q3Jpc1VWMUxLd1lNRzdxWGVsTHBxeTFySkhUdU1sZlByNDYz?=
 =?utf-8?B?UGNzRm1WUGZEU0F5ZXhBUDJURnNSWXRDOFFlbzhSV0ZXR2I1eWtkbVpkd3Ja?=
 =?utf-8?B?bGIwVXhmMjRpZDdpV2hNSjFZbEc1U1VjbjFIZG03NWR1bHhjTUlLdnlKeEJ2?=
 =?utf-8?B?bFBHUjd3SUhMRldVZnRERnJ4QmViNDZTaE15Rzd3aHEwU3VKeUp4SEFwT1Fr?=
 =?utf-8?B?bFA2N2dMZ2VtRlN2RVhQNDZnQVNsVVVSdDZXcmgwSERCdmh2VVF5ZGlmYURN?=
 =?utf-8?B?d1dHUHFzYkd3eVpZR2M0RUFpNTVOL01kdEJML2MxSTV6eWd4TFNkb0JybjU0?=
 =?utf-8?B?ei9NZ1Z4azF3Q1N0Nkx4QnVoUXY5Y2tFeVFlaHRGbTk3Qk92ME9QOFVaUHNC?=
 =?utf-8?B?WFZyL2hHR3JwMDJuaWN3OTFWa3hXbjJDeHJDZmVITmdZT1FyM3o4NXgyaUFx?=
 =?utf-8?B?TFNudlRMQ2VwbERqdHU5Q1UwM1dDUUEyU1QyN0NwczB6WHFSL3ZaNFBvWjNh?=
 =?utf-8?B?a3pLc3MxY3ZhUUkwZVRNV3lGQWZ1N1RpNnpnakVBTkhhOWpkNUtOamt0dW9v?=
 =?utf-8?B?RmtFd2xIN2k3Q2xPay9PL0dLYjBqK0JJb0F1eHFESWtVZ0g2UTlVc3BjTE9l?=
 =?utf-8?B?VDk5WWxmUE9uczlaYmJ2b01JMmFmdXBxSXcyNnhaUFpDTkRzczA1NlZQa0NI?=
 =?utf-8?Q?56FbXs8M4i5l25vVrh/R7Oo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 959dfad8-f6e4-4546-1b2f-08dbc1054a15
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 16:01:06.6596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JFRpQdeGMyZaR8EKr+xM03cHv8ReIuKHPzzfrDhcmjAQXaKbNoRHFnCBHQhrRlZM9MqY9ZWnIhSZQw2Jty2ct3GXdonRXDgWwArSC8DQ1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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

On Fri, Sep 29, 2023 at 11:06:53AM +0200, Francois Dugast wrote:
>Hi Umesh,
>
>On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
>> On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
>> > Add pad to reserve space for future uses such as special configurations
>> > for media.
>> >
>> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>
>> I saw a comment in v4 that you dropped the patches that are not reviewed, so
>> this is:
>>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Hoping this will be part of the final series that you merge since the
>> ENGINE_CYCLES query is using this structure and relies on this padding.
>
>Actually using your original submission [1] this patch should not longer
>be necessary, right? It includes:
>
>   __u16 rsvd;
>
>[1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/

Hmmm, I failed to notice that earlier. My bad. v4 looks good, you can 
ignore this.

Thanks,
Umesh
>
>Francois
>
>>
>> Thanks,
>> Umesh
>> > ---
>> > include/uapi/drm/xe_drm.h | 2 ++
>> > 1 file changed, 2 insertions(+)
>> >
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index 79e47708d526..84091860c7d2 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
>> >
>> > 	__u16 engine_instance;
>> > 	__u16 gt_id;
>> > +	/** @pad: MBZ */
>> > +	__u32 pad;
>> > };
>> >
>> > /**
>> > --
>> > 2.34.1
>> >
