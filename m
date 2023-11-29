Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2545C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 17:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5944B10E654;
	Wed, 29 Nov 2023 17:53:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B37310E654
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701280388; x=1732816388;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PQ3vogjNCrBjkpz76vL5avPuTgNY0wWgVW65cj+JJr0=;
 b=cTxp17I5JT9g5E/wjbleopns9U7BF7BCCTF//oDtKLiw6EZ0XZXYGnw/
 UAg2ANzW1Q7VDooWFoM+1gAzGOBtEicugjmOvOJZD3Rbq09oXuztNNFOu
 eK800lZg49aamV6fPodn+0JABKCpC3iwJdDawujwZ0UkSCGvpUm/Gy/0M
 d4LfnrwemaGpF3XINsxESV1AUirad4kpIyDJHx21c0ZnWCDFfnGsR9dEn
 89v4C4eahbDnlTOrVmOyR18/qbSqsCUB0bEKPFovwSrz6LF4G5Lr855uK
 YvBJv2aZAK4GL3sA2HofWxt2JGM3Kul2b+ka5ToIsdoiE1QcSkEOwKr+s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="457523318"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="457523318"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 09:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="835094166"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="835094166"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 09:53:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 09:53:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 09:53:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 09:53:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3VIOzibyC+iENET3iiwTPL+KTSlJI2V2deSI8ZQG8rwvvZD0U5pHvbpYvKglZUpQzfFrV21Bcz2od041tFreukSacXfnkeXuKPtgt36MSqJJ7JnKTbAzKZkfxBwxJMxgVwJaBKbcvASZvxE7R8KJc4Vy2sz0eg3XLo1mScEKMd75/VV5XxXdalXtH8+V1bSm/V0xgvpdOsmYyqAv9uRFeBEvN7FtomGHt2X2NJDR+cjOh36PRCxXT5BUiNtu14YFz184MnFSrb7l0JrdmivO6AwDqLzKsqZqKxUqsUVGPBPmqn+u7asjmlrm5oH4FDO+SCofhhuDgQh3rLMNGUtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/SKORTzRxCc0BMPrHX8zaApkXioHbpLVFfaaJjVkDo=;
 b=dUWdLDR3ij2REvDGgPi/07sF5CtfXp/IN43BevupSgbK7bb2tZkIv3w1HrPUmUy/4ZAJr2Z5cjItMoCcAJ6hBYM+iX0YIz373Ju4GthYCYwlfooyvvBBmFkAhdAjyegspwNkTTk6uoK8smbMI1KsDO9ktKIc9TL4z0vU01o3lb3I1YjPSa5DQOC8yknWrEaJ/9A31y0UiIffNQ3vXXWlayoHR7HjbtgnvOS4K8K9U1F5cwvgGtH1hDjVkahEizDhTAQTphW6IWfmFV7Cg+/6Gr+cQadMq1IAtnuX6Vq/PJjjY1+FUnp6wtkU3uq31CK3XwGjuz1J/M2gqTGsgSxhpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 17:52:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 17:52:58 +0000
Date: Wed, 29 Nov 2023 12:52:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZWd6d4qc4QsFun1z@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
 <20231129011624.836843-20-michal.winiarski@intel.com>
 <cefbc4f8-08c4-4c96-b042-a1e83d49d05c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cefbc4f8-08c4-4c96-b042-a1e83d49d05c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: af9a2964-fb66-41d8-b282-08dbf10405f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: of1OH8GV3qDlW4vo8gFCxI0mPP4P0BCx7vPvYCoAmUHyA0q94b1NRhmId5Kv3zpOTK/+AcyeMZTtFAu6GPQCJ1weWQNpzpdVM3C2tEWpti9qzjO34NR0PebiZ/qKmKB/gYSfln+OQ9xOIAPSNXCx0AkZh4u/puSARfM23R0mwtNDcwRx314xNFdp1tXH/N9gUcf1Z3K52o4hqufKDFPVi4Td6zg1OxYgDmvGI+vv8Pi/PveloJ+z+q4savA/N0Pt1VM99jvixjPlPHE6xwS2s0dGPqAmSydOBdOWfl8Bp5ImEAS6WI9qreEEcL3OqMOC4EGbHIDjbW4Xg/QNXhAm6SKe6ON2mzqn3NmfBl89+UK0xkVdgHqPf+ys4QwTQaO+2p41T7usnTZkPRm/o7/AcLoLZqEMzRAwPDHVdgK82r0vBsCXmOhtJmEeXMInn4EPocqOUDpRjz3FI5LkAToCXF+obRHLeCcfDXGMFjbxSShaBwSsBVgb4qVq7boRLX5Cia3u+i17O9eJ9/gtNVI9oBOcuo0aS4DKCbtERdkpgCQZZI1sDuOFLxV3egvnMkdT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(36756003)(82960400001)(38100700002)(83380400001)(2906002)(44832011)(5660300002)(8676002)(6862004)(4326008)(8936002)(54906003)(66476007)(66946007)(37006003)(66556008)(316002)(86362001)(6486002)(41300700001)(478600001)(6636002)(6666004)(53546011)(6506007)(26005)(107886003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlRLVnJwM1lYcVVvcUlxcFB4OVFLN1M5U1ZqZUdmV0JWamZIaTdaTnVzTWdO?=
 =?utf-8?B?RmthNjNibXJUVGpzeklhNDBJbFozYzVxbWF0YzBwQUdPMHFROThZNkYrZXc5?=
 =?utf-8?B?dTU1U2xGMFFNN0Q0dHZWZmhaUzdLOWpyNzFNRlBTZHlSYmV5Q1Y4NjJuYUZq?=
 =?utf-8?B?RnZ2M1dXMW4zMEUrcDFTZkt0MzMvWHNsb1dZYVdFYnJOWTZkY09YOCtGREty?=
 =?utf-8?B?RlJ1WnlKL0s3R0RKQW4vV2RkeVgzYkpFSk41TVc2ZkhqU0hkUXFzVDBFWlYz?=
 =?utf-8?B?YnNxRGRkOWM0SFhUakhyUnhOMnN3WCthTWI4TUxWa01IRW1OaDU0NTJxRC9G?=
 =?utf-8?B?cVJlRkVsNjRvdXVrVHNUc0d6OE1MVGpSMXQ0ZUNtQmNqemp4b1ZKMEpuU2dX?=
 =?utf-8?B?dmFELzhmMVpjWkJkeHBRc2tERHk2bkdIcjFZWDFnNmFZeVNldHZ2b1Yyb0Nl?=
 =?utf-8?B?WVJleFBCWjVVM3owMjVhTFhCWnY4Qkl4bCtPc2J3a3ZzWFh2ZGFYR1lQclhp?=
 =?utf-8?B?WlVpcytiaDlJelFFRnBOcUg5NGVVemhoTWtKenJqTEpsaWhwbklWY0RSN1Ns?=
 =?utf-8?B?MmR4bTQxeXphczhXUVJKYlNLcDRPdVVUckpHUjdzazkzd0k3Y2hmZ0FPdUxl?=
 =?utf-8?B?aWc0bnhyUW4yRFpjRGRPYTliczV4QXBoWCtTd3BoaVJZb3dGN3FJeFY4MGJu?=
 =?utf-8?B?dlI0aXAvcW5UV0lLNzYyaEg0YlpGUHhOb2xCa0xweVJaY1FHQ3hqQ1FzV2dQ?=
 =?utf-8?B?bnl4YW1rZnAzb0ZjQjQwOFFDcW52cDY0UiswMytzTllXUVgySXNEdDFxdzgr?=
 =?utf-8?B?ZktvSHNtUzEzYU9qVkJMZ0dZc1RFUFdBSDJ2ci9qV0pBR0NJMnFtQUNGZS80?=
 =?utf-8?B?cld3U3VuSjZLSUtuZUxLSWN6RWpoZHNlcCtMbDJraVM5SThmekMxbTM2TjRy?=
 =?utf-8?B?RDRCSkdrTmpERmtFMWJzamkvSXh1bkZNMmpiYU94TURKNzJZSkpUbU1ZSzZ0?=
 =?utf-8?B?L3RWdktVM0RRTFJyQkwrb2ErYXBqbk91c2xWUjZLdzVJU3hnSEpkS0lnTTFa?=
 =?utf-8?B?ZzJvcHRHbGNwZC9BZzNKQjdPcWpuejBrNG9FeGw2eXBLZFZMSDIydzdOQlBi?=
 =?utf-8?B?b0xDSkZaeTRjSVNVYmtnQmk3RzhmK1Y2T1NMZ0xLMlBRYmxJRWQwbTk3bTVT?=
 =?utf-8?B?aHhHK29BNDRZdVh1akpqeEp4THdKS1RMZkYyMWRxbjRWVWUvVEtsdS9lREpH?=
 =?utf-8?B?N3ZJdGRkTmtWUElJZEFFZkRLRkFTNDlKUE8yck55WExoMUl0TmljTm5NaHIy?=
 =?utf-8?B?bEhvT0JwaDBMclMxb1BFUERtcXBpS1pwdktEbVpGMGF6eVlVVWFvUi9XZ1g0?=
 =?utf-8?B?K0JORk9zS2VXT0hmRU5oRG1QQ1lJdkpseTVYYkozQXdwN1FwWEVOL09Vdm16?=
 =?utf-8?B?enN5NUxoUk5DcHRpWXlOSFhjdFRyR1hWRDdoNjJwMWR0ZURiNmo3WXErV3Jz?=
 =?utf-8?B?WEJOOUFBN0pZbStVdW1QUlFuZ2tmWmVPRExRUGkxUjBpazJHb0V2WWlJdFdL?=
 =?utf-8?B?ZWlsWHVWSjdZUWdyS3Rkd2w2eU91ekdCU211T0JqV0dEbkNMYXgycmpnSERt?=
 =?utf-8?B?bllsc0kySjZxQTJUWCtLQlRjQ2x5VXNmLzd1bFBEL3NuSzA4MjhRSkJ4V213?=
 =?utf-8?B?ajhzWmk1RjY2SmVmQmZMTFNzMzU3bVducUFPN0lMQnRSdE5WRWU2WFJiVkRL?=
 =?utf-8?B?dVFrM1lmTlhlaWFRR2JZeE1lRGxrbmdpZ0N6TDVtNVFtVFY3bXZQdmMyaGVD?=
 =?utf-8?B?NmNVOHpJeFRzRG5oTWtzRHAwY0tLRXYzWjFKc1BIeTREOUpIekNDclZJUk9Z?=
 =?utf-8?B?d2tGWXRPQ3VuRDZMTXBudnpvVzl4NmtXMEFQVjZTeUUvWXUyNXp2MDFSNURM?=
 =?utf-8?B?T1Roc3gxRnBDUFRkWFJmMmdxSjkrVXpENUJKMzRqRnVGQ21PdUF6d2ZDYlh2?=
 =?utf-8?B?WnY1V3ErV1N3K2NZVDl6c0lLMHpFdlplWHBxVlVhZkhzaU8vaG4zTjdhUUJH?=
 =?utf-8?B?all4K2JOODlmaVVSMG1QZVRJRkloQ000Y0drK3JudWVtTkthOWpRcHIwVURo?=
 =?utf-8?B?aGk2dU1zMEtFOE8yRTBHelNXRlVOT3h5ckZCa292QWgyelMvVGpWYVJQeW9z?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af9a2964-fb66-41d8-b282-08dbf10405f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 17:52:58.8877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BQ71hTGtfczXWIDwxgq2/F3Xj5hi+1nVnp1Y5vnh/DkNfAORS7dQkUXsQkq6FFVtsRlRX/bFNezryB/OKSmlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 19/22] drm/managed: Add drmm_release_action
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 10:43:24AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 29.11.2023 02:16, Michał Winiarski wrote:
> > Similar to devres equivalent, it allows to call the "release" action
> > directly and remove the resource from the managed resources list.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/drm_managed.c | 28 ++++++++++++++++++++++++++++
> >  include/drm/drm_managed.h     |  4 ++++
> >  2 files changed, 32 insertions(+)
> 
> shouldn't this go to the dri-devel first ?

yes, please. Let's send there and try to get that quickly through drm-misc,
or the proper reviews and acks there before getting to drm-xe-next or this
might block our initial pull request.

> 
> > 
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > index bcd111404b128..f819940b8a959 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -176,6 +176,34 @@ int __drmm_add_action_or_reset(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(__drmm_add_action_or_reset);
> >  
> > +void drmm_release_action(struct drm_device *dev,
> > +			 drmres_release_t action,
> > +			 void *data)
> > +{
> > +	struct drmres *dr_match = NULL, *dr;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&dev->managed.lock, flags);
> > +	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
> > +		if (dr->node.release == action) {
> > +			if (!data || (data && *(void **)dr->data == data)) {
> > +				dr_match = dr;
> > +				del_dr(dev, dr_match);
> > +				break;
> > +			}
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +	if (WARN_ON(!dr_match))
> > +		return;
> > +
> > +	action(dev, data);
> > +
> > +	free_dr(dr_match);
> > +}
> > +EXPORT_SYMBOL(drmm_release_action);
> > +
> >  /**
> >   * drmm_kmalloc - &drm_device managed kmalloc()
> >   * @dev: DRM device
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index ad08f834af408..f547b09ca0239 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -45,6 +45,10 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
> >  					    drmres_release_t action,
> >  					    void *data, const char *name);
> >  
> > +void drmm_release_action(struct drm_device *dev,
> > +			 drmres_release_t action,
> > +			 void *data);
> > +
> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
> >  
> >  /**
