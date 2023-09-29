Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA5E743ED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785510E0E0;
	Fri, 29 Sep 2023 06:18:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FFF10E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695968316; x=1727504316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J0D7Gk5gCewK7V7DSyRtAFsUaX89+1BtAJ9LIUgCXDk=;
 b=Wnwv/vGeToD6Aw6XQlwsB/mQFSWrkZMBXtvk6+vGOtyNQklXJjsIb31a
 JiwFu1jgfnZ62YYq1YYrxsOiA56CuWGGwCzHU0rLLUdNtI9lHIEIsiY4e
 dOvlrsHBuHsM347vDJ4MT1R1xvjWJWqMzgGAovxnEzj7iMNdrhYinobvI
 Csc8mVe6d7asi7AOiU/De/wlI6yiCcCtFeZKoJUdToBWb1usyq9ki8Vqx
 aRft/5C5oFq7nlG0cyv2n9RIClbop5WwDvhnYYhswf4WOOvtYk3trvPMh
 ozmdt2/+eQiLw7BDTAAFNG/hd+5JHR4Dkc6NyRF99xmlRQUS2GANHmtz+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="448734679"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="448734679"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749873209"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="749873209"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 23:18:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:18:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:18:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 23:18:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 23:18:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvf2v+6p8Tuj6UdUG48C0nx16a9qsK5s989kQ8tCz+QqhOixl8mBky7DJCKZZgjqBtZg3Nau95yX/dbUvASSvo2X3cmyZwypSSSCUTYa4yAcHmQly8wNmp3QeWE7FgMPggVujGYXhQtzoByATnSRdz0DsA5xm4+ZTQjcWFLqWYANKoYi/x5ZOgdqJvQpegA1csmyFHM8hMxHZeRAkDhQ5MFDth0aie9hgofCUkgD6I/RdQUCjUhsBrYaHtbVZWC6FBRQdqfdMjgjkH0MW5WSVMf81pMUSYRHBzGBJc3beaBbSysh0+MzynzXElgZhaHBHMG/OCIJJybGYayW1kgYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSNt53LPfZzRmrL2nkFAAsk5/TfJ/GL2DuBcGxP5MqE=;
 b=Wj+cPUiQAypfNbcNRydGHsDbE+JSaLsdTDgFXsUzIIoCpDyOQNTV/MEVKxA8WKUkP7nYNXMKXJ+C+9OgDqKjIBV+IWCxULrNevAlUXqhhA4njr5+yO6aPF2s9LqGm6EX0OVTeKK8Ca27dX9a6jJCJNLGCcopmqab6xuOtIG8cCn8yBN4oKytgEo+T+41/OA+IyaQeaTWDLWJmlhAh6PX1eOvfnMvE8Z5inVPqVcvW5GegWwtME4ZTx5qmkhrvVIepTyY/8UTcDuq27HrRY3Md5SG25AKdKYOzZZQIjHbilZz8gypSrtTc6bP3v86c4GUSQGXbADecNTFOchfN3r4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM4PR11MB5406.namprd11.prod.outlook.com (2603:10b6:5:395::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 06:18:32 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 06:18:32 +0000
Date: Fri, 29 Sep 2023 11:48:21 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZRZsLfyXgZfvSKk7@bvivekan-mobl>
References: <20230927205143.2695089-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230927205143.2695089-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::23) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM4PR11MB5406:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fad51ff-505b-4c0e-5b8e-08dbc0b3e7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kGpPntqmFa7xYFDXpKEECd7x0HMdsGqH24YLe3dmO5Opm/glXVLaZkRUXlbB2ql3WRdF4jrkbRPXA71oHCcx2zTaEiQcpNHBH5MlL5HnhPfVyx/pUryysS9e3hqADfEUqtvD9rQ7D6z6X+fMBDnqHSXYMi2uYICO8EitqvVcuVoO5Gsntd/1mJapXn5rjyYhDeEqpf74I1SSN31L8amcKLIeyOa/UZG2e0CTWz4mAM26GfeHb0yv9f9xSITA8+x9QRJZLNM76RlEW+Wlmj7MKA7lH1/QXoRPvvClkf8Fdpb1zDeeAK8vexT+qnkYZiZtt8YRpR5Ff6Kkp5Gqj0HwY6NazyBbaFgECw0dfn5G6far6s1H4r6RhQ40JX+LcBd622umC2aLbk/+Of+SpoYaLfcV3n3QH31LFQP3BOK3t/uAWHc4Ht9qmwenJ9wM3Lx3C7thMq8CXYmpnTG3gdIEYqPD1zsu29NH0TaArOeTnS0IufaRaHj1KjVJrhqUdhBwjVhnYi5pgnUVeTVy1IHG3QnUxl8pJ2AfZ2wcgj804Z/Cz9cjsXhCraX0263paeiy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6666004)(6512007)(6486002)(6506007)(53546011)(83380400001)(4326008)(478600001)(33716001)(5660300002)(26005)(8676002)(9686003)(316002)(2906002)(66556008)(66476007)(66946007)(8936002)(107886003)(41300700001)(54906003)(44832011)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZSL3ZvSHVqVVNTZVpvNnhidUUyaGJLNlI2dkFPRFVKbFBMdFAvaTR5S0tS?=
 =?utf-8?B?T3hOaktoUVpWeHJ0WlVSREdJY20wVjljUWtoK3NLeU9WV1R6ei9Yam5DQ3Jm?=
 =?utf-8?B?amNVMm9zUXB6dkwySS93ajhGQnFPZlIyNDVVTE96NlF4NEhsUHJkekt6cjcz?=
 =?utf-8?B?bld1MzF2TmdPT1ZQMkZLb2FlM25haVJGRlVJbjgwSzVkMExYczNpMFRHZkxj?=
 =?utf-8?B?Z3UyTWZ0TkNzOXFIeDJ3U2ErR2JHRU8vREhGRG9vNWM2MndYVkZnNUdGZkNh?=
 =?utf-8?B?UHgzYUhZR2lManR1NlNzODBLaHZxc1A0VnZJR3lpSFhFUFcvT2JlaW96TFlW?=
 =?utf-8?B?dTVuTWRmSHkvV3MwbVd5aHVGc2NieXhwNUIxVnNHdFhKWGhZNXI1U1VGcG1a?=
 =?utf-8?B?M2QrNXBHdklpZFRMYzlZK3JOeFV2cU1PUHNWYnYwQXIwOXNKem1ES1V2NHJm?=
 =?utf-8?B?eVFHbE85UW1rMkxuZXpmRFhkdm1GNGZGMXl4S1VLeE5LanZ0aW14Uk92WnI4?=
 =?utf-8?B?cHFheDZKWUx0eVRYWVVZTWl2QklUV2xGVGU5clJJSnBFUk1nZEk3U0t4b0Zi?=
 =?utf-8?B?R0pNTnRkR05ic0hzNFZqOUtOWHFtN083OGhjOW1WVkRsYWcvMUF0YlhnREMz?=
 =?utf-8?B?dXdvYitZVHowUU1NNGFOS0MvTUVIRUFhUzRWVkhUSXZtbWNpMG5RN1FlSldE?=
 =?utf-8?B?bWkwV05YaVdMc3hTNGlnRmNYUDE2TmRvTEdFdDJVZ2h2VVRWWm01MDhBbVlW?=
 =?utf-8?B?WkdyVHc2T1luNzNrRHIzajYwZ0NjS28vT2tEOU1PdzhUaEZ3Sk5rcVZkS2tY?=
 =?utf-8?B?dzhDbEF1QTk2YUF0bVlGOEUyclk2VmRwWk9ocmdGR25QRlgvZ1Erb3J5b2Iy?=
 =?utf-8?B?TzVMWkJUTWNpYVFYaUxqQWw5QlgydldGT2ZnKzBiOW9YTitOK282UDR1TW1P?=
 =?utf-8?B?d2l4dVVVTG1XTXhNbW5OSndIMTJNSUxBSXlpK3c3Z3FUdWE3dHhqU09mVE9v?=
 =?utf-8?B?cC9pRUcreWZYMUtXM2hUT3BCc295ejRnNk94dXZwV1BWZ0JabmkvQlZuQ2lR?=
 =?utf-8?B?eFY3QmJ3MUgyYWpIZ2E2YzRmMTAzaU1vcTMxdEtQYWlwa3B0L3RJTmpnaC9H?=
 =?utf-8?B?MGtqdFhBcTZXQ3VVcVRzTGNjQUp4cTVPb2xUR01VRk9DalFVcDFOM1BPVUpP?=
 =?utf-8?B?Ym1zSys1dEtKMFlsNncrT0ZEd3E0dEZGSUpDK1I1SnIwd2lRN0FHZUJTeDFZ?=
 =?utf-8?B?VGVyYlpQbHpKcnRrRlgrNTF6T1dkcmhwSHFPTTJaQ3VTcVNwcnNRQ3pJUjdJ?=
 =?utf-8?B?WUV1L0ViQ1JkNDlMNzgyeGkxMElwVzNMczAvSmxRazlFOWdYcVhIYnBQSy8z?=
 =?utf-8?B?REdMMzVWTmRtbzNtMlY1UFhnVEFGd1ZmSkxwN2RYc0VzTVIrd2lGbVFwZkUr?=
 =?utf-8?B?UFpYTTFXQUo0TjVHSTBCRVowalRvQWVYRy9QcE1CdW9UOERJc1RzSXZEN3ZV?=
 =?utf-8?B?UmZnb096WFJmclNoS3RDSGVtdUxkSU9FbWloN0d6dm9tQ21KL3dzYmY5ckEr?=
 =?utf-8?B?ajVDZ1l5andjL3RnMDdUcjF4RFVIYm5XVU8xMVlCQXZsTkEyZDl0bVQweDFm?=
 =?utf-8?B?UUFvNjNtcjhocFZUM29kVFhMdHdFSzRUNGlPRXJjVWZEdjd0TmNBTVV1ak9T?=
 =?utf-8?B?N1FMQWtnVDg5RW9XVjBha1BBTFdjaG9SS0EzT2d4SStMcXJFeEQxNEJxQVUz?=
 =?utf-8?B?YS9PTXJiVk1kMG5BakZXdWZQenNYRlFxa0Z4YnJKVkhxVWlGZFhZV09SS2Rz?=
 =?utf-8?B?SC8vT2R2TFREbjNCK1lrMUh3dE81L2JBRVVrL1dVZnQ3clBNbzExb3V6b3hm?=
 =?utf-8?B?aGs5ZDR6UlJkQlVqOFhpb0Y4VHkyV1ZqdElxaUc0aXROaVFGT1hBUE5GUXdX?=
 =?utf-8?B?ZVlxV0tRaE0wOVB3MzgvUXNpbEROSm9QZ2xkK1RkK3VESjMwdU9pZ2RrcGto?=
 =?utf-8?B?bFBvMThQVlZyZktrWld3eWJSZGJUZnZJWkhsMzc3VE55Yys2U0NpVmRWYkdr?=
 =?utf-8?B?QnFKTm90Uk1wUmJFWFhXMlR2Rkc0TzMyc0hQSjJYOHVodWxZZmpsR2FoRm5l?=
 =?utf-8?B?T1JmZm9rRUdXYVluSFBNcFk5YW5Jblk3TFp0R2srL2MwZzU1UXZ3blY2RDh5?=
 =?utf-8?Q?bXbkporG1rHwKahfM3yZbNI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fad51ff-505b-4c0e-5b8e-08dbc0b3e7be
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 06:18:32.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p+mko31qgTvSWwN0hPJyJOuft2IWqHYnPouAF8HP/uIq2Zh/BA+fLFrsEoBv36ERWXN8BuiSzdZ/g1ujETvaMg6pAC3ezBbRGOY38LiNEy5w5sUg+MgI+GrAGRH3Hs9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5406
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Infer service copy functionality
 from engine list
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 27.09.2023 13:51, Matt Roper wrote:
> On platforms with multiple BCS engines (i.e., PVC and Xe2), not all BCS
> engines are created equal.  The BCS0 engine is what the specs refer to
> as a "resource copy engine," which supports the platform's full set of
> copy/fill instructions.  In contast, the non-BCS0 engines are more
> streamlined and only support a subset of the GPU instructions supported
> by the resource copy engine.  Platforms with both types of copy engines
> always support the MEM_COPY and MEM_SET instructions which can be used
> for simple copy and fill operations on either type of BCS engine.  Since
> the simple MEM_SET instruction meets the needs of Xe's migrate code (and
> since the more elaborate XY_FAST_COLOR_BLT instruction isn't available
> to use on service copy engines), we always prefer to use MEM_SET for
> clearing buffers on our newer platforms.
> 
> We've been using a 'has_link_copy_engine' feature flag to keep track of
> which platforms should use MEM_SET for fills.  However a feature flag
> like this is unnecessary since we can already derive the presence of
> service copy engines (and in turn the MEM_SET instruction) just by
> looking at the platform's pre-fusing engine list.  Utilizing the engine
> list for this also avoids mistakes like we've made on Xe2 where we
> forget to set the feature flag in the IP definition.
> 
> For clarity, "service copy" is a general term that covers any blitter
> engines that support a limited subset of the overall blitter instruction
> set (in practice this is any non-BCS0 blitter engine).  The "link copy
> engines" introduced on PVC and the "paging copy engine" present in Xe2
> are both instances of service copy engines.

Thanks for updating the commit message.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> v2:
>  - Rewrite / expand the commit message.  (Bala)
>  - Fix checkpatch whitespace error.
> 
> Bspec: 65019
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 --
>  drivers/gpu/drm/xe/xe_migrate.c      | 34 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pci.c          |  2 --
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 -
>  4 files changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32ab0fea04ee..2d20bcbe8d9b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -234,8 +234,6 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>  		u8 has_range_tlb_invalidation:1;
> -		/** @has_link_copy_engines: Whether the platform has link copy engines */
> -		u8 has_link_copy_engine:1;
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9438f609d18b..3cf7412c79aa 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -854,28 +854,36 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->len += len;
>  }
>  
> -static u32 emit_clear_cmd_len(struct xe_device *xe)
> +static bool has_service_copy_support(struct xe_gt *gt)
>  {
> -	if (xe->info.has_link_copy_engine)
> +	/*
> +	 * What we care about is whether the architecture was designed with
> +	 * service copy functionality (specifically the new MEM_SET / MEM_COPY
> +	 * instructions) so check the architectural engine list rather than the
> +	 * actual list since these instructions are usable on BCS0 even if
> +	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> +	 * off.
> +	 */
> +	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> +						XE_HW_ENGINE_BCS1);
> +}
> +
> +static u32 emit_clear_cmd_len(struct xe_gt *gt)
> +{
> +	if (has_service_copy_support(gt))
>  		return PVC_MEM_SET_CMD_LEN_DW;
>  	else
>  		return XY_FAST_COLOR_BLT_DW;
>  }
>  
> -static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> -		      u32 size, u32 pitch, bool is_vram)
> +static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +		       u32 size, u32 pitch, bool is_vram)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (xe->info.has_link_copy_engine) {
> +	if (has_service_copy_support(gt))
>  		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
> -
> -	} else {
> +	else
>  		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
>  				     is_vram);
> -	}
> -
> -	return 0;
>  }
>  
>  /**
> @@ -928,7 +936,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		batch_size = 2 +
>  			pte_update_size(m, clear_vram, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					emit_clear_cmd_len(xe), 0,
> +					emit_clear_cmd_len(gt), 0,
>  					NUM_PT_PER_BLIT);
>  		if (xe_device_has_flat_ccs(xe) && clear_vram)
>  			batch_size += EMIT_COPY_CCS_DW;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a11163b89a3f..0da752b3c9cb 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -138,7 +138,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  
>  	.has_asid = 1,
>  	.has_flat_ccs = 0,
> -	.has_link_copy_engine = 1,
>  	.supports_usm = 1,
>  };
>  
> @@ -574,7 +573,6 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> -	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>  
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index df6ddbc52d7f..bd0b0d87413e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -24,7 +24,6 @@ struct xe_graphics_desc {
>  
>  	u8 has_asid:1;
>  	u8 has_flat_ccs:1;
> -	u8 has_link_copy_engine:1;
>  	u8 has_range_tlb_invalidation:1;
>  	u8 supports_usm:1;
>  };
> -- 
> 2.41.0
> 
