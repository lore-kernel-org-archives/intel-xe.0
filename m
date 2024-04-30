Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE86C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D860B112AF9;
	Tue, 30 Apr 2024 16:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ll+NalJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF039112AF9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714494421; x=1746030421;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dwfXkphVPHTqGPQ2gcvMyENe/wydXNB4mrmccWruUP4=;
 b=Ll+NalJ+jQFfnCDfxXvHCxyLk8HR4RZSIbOkR4fSRtVKV3a9jwWBAoIU
 naadhupaDzRyXjAhhcfvtdUPRvST8ZEyTNsbL/y9t/v6yaEUSr1QqKfEE
 w57XPsXm5rLGTzdnlh+2iKcD8DVGc2IS7dwy25SDeS0NEZdo102caYLGJ
 4aJKCo89W9onvxA8/m9jOnvMIIf2f3wNACYYoU5wmfdKgnzL/mSQiQdTy
 p+eNA0Qoqs18+XjTcco+UCjesERG3qqxFZRxCpyzuuLvG0jzeUyDb2Ena
 0tsCUydXUxscx1VyRYdDK1oy6hKPNUPg/U4Oqlc5ZIy4u8UflgCQrRrNG g==;
X-CSE-ConnectionGUID: myPc+I8CSr2aFS0pAepBKQ==
X-CSE-MsgGUID: AKuSUAcYRXG0yB/AWcMVWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10072291"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10072291"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:27:01 -0700
X-CSE-ConnectionGUID: gUpyYS/0QKuYnfrKhjDwew==
X-CSE-MsgGUID: iHcejWTxTHWjV7ROYOx8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26510878"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 09:27:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 09:27:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 09:27:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 09:27:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 09:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAths8hnA0hgRLW0vHMex+JRE4OAjGzPVaCxWLhOWlRpMEPDlKqAET66rcz+agReQ1cTIVT7ay9YfwsVU+sdcLlDEl+MPJDGkNOyhiMavCbVIdsW25NfJ8cRok+noWEgr0q4AXzGEs33KQxs1jbFg9xVPi5WaYapWu1sEc3bHSPBwEFf4kaE6Y3rWmFuCbwTsSrU71UCZS94yuxhF61vyvh1DuYUfCpFKE5HKlYxEvnnXeL9BfFqKtmQhORzzOKRuSLnSEHrc9NCZkOYY8xGPf+sbu0mUdd5ha2kKwfkuuHAJIbBanM+UHTDjGI30p7jJG4OSXpi5+nXa2vgNRyQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwfXkphVPHTqGPQ2gcvMyENe/wydXNB4mrmccWruUP4=;
 b=FI7cS2O/V3dbu9rOJ/CPc2qGsspDqzm2b+ZmKDA2ZM0pVJ4WGzWBd0+XHowqVmchu414kgzVnjAzCq0vaCzpTj6VeYT0b4UKh8G6eVunsIX5EDADkeEOSdpvRZa5qDElc1Dxdm7h2Pt6Sxhj9qbuRxsjZNz4v96weDUg8PqyBlwXEly+aw/DymW759wxeKgXcIdyNP4o0GWcm2tHW0jUwJSJffmjPQ4Fygtf8pqoWIlxqsl5S9ZfmBEq0i4GtCWGwUwsRAKkY436aJuEUKMQo/T7aRJgSf6qnMTOAlIihx3JB+NYCbf4wL+5rmVcx8GeXdMtFvLuJIWPnv7L9kXnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 16:26:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 16:26:56 +0000
Date: Tue, 30 Apr 2024 11:26:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: remove sysfs entries on driver unbind
Message-ID: <pukwyn5zx3oc7jhgudefpijkfr6eab2i2idwp57ixcseiaopva@pz5eurc53qef>
References: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
X-ClientProxiedBy: MW4PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:303:86::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: fe32d5d6-380a-4d8c-0240-08dc69325a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IU404kuHLg7LDz188mhoKm5OZConlIgFN02wtsN3g5nCJXm4Y28tB9mAbLbd?=
 =?us-ascii?Q?+46zaL5ed4A1lBB2dVQm6n+Oe/wkTRomLnlQXqmmXNwkxqzt4LNg/QoNp5FO?=
 =?us-ascii?Q?jsMvqOULLhT5TWVQbXlOJET5XLVOSfZJxfPHXp/vsLEYdWbd0Bl37O1aaHmE?=
 =?us-ascii?Q?bdGnV310wV4vcJhUg6lf4xU82rVufklSQNe9pCxgSz8XwN2CtWfuxxIKzsDm?=
 =?us-ascii?Q?J6L1SvH6Xixepkscjlr3AEDPM9yLuoNt3U8KppPDMoFOdg8JeDsbyf0jKGTk?=
 =?us-ascii?Q?5EwX8E+AzQgLJpxZydeznDxLij3bGWU0xmToMWOIY5as/o8G/GCoq83vZYeb?=
 =?us-ascii?Q?cOrggR5jLJ2ucPiNi2CiINHyIPp2pGl6/fXlSzGZdJn10896+2A4hXWqsgjx?=
 =?us-ascii?Q?Hp+RE7VPOA7Z6SDwCqZSYHs9Oz+ENzm4L2b/hGmH/TmhS6SvIRRhLwj18zwJ?=
 =?us-ascii?Q?v3cPfPLs3stXv+lbfPx/veTF3XYqKjMz8S4md2m/c6/YuF55hTDjEDWpIEwe?=
 =?us-ascii?Q?K7xnMOK3/n2cJzxi9oFTLubEkOL525GII0pgvTytpajtcpkcG7AgXbm5oFKu?=
 =?us-ascii?Q?8pYQ+IHQiceCNY14+jCZDGqCFbKS+2LqferD9qrhIF4qx46OuhjhF+BPALnH?=
 =?us-ascii?Q?Qo2btmDzGN1G2CksJIF+B7Rwuwg8se+eNFEJdE01dvYg05+EZXCm0I01+i1t?=
 =?us-ascii?Q?6pCuBamVF6m+00lI7eToOpMu/dhPOvEBxT5qRr1uKjCw8qpEr0KOKSoFrMim?=
 =?us-ascii?Q?ZryDgXXemzxHKMP2KxClJjlnWa5wxnFnP8XdbObzRj/YLfbDl5ipvRwBAss6?=
 =?us-ascii?Q?rNqVRgxNvWgu4JJ3JnUHAbdlflb8LxChhceR04ewHZVbSqdtmQjYhmLJWKm5?=
 =?us-ascii?Q?WuDdGmS9Bv2T1Xkq+EabEZjkJvOJG2Ibil+l4jvd6sggElutYBV5epS7oi7/?=
 =?us-ascii?Q?2nnlfIkmM0U8KzWaOLfCzy2PinnOOIsU1JBX06dZ7T+QwGTREUiVhns794eG?=
 =?us-ascii?Q?Qm+dBVSh1DY6anFpTbxESdVID1F8RsUXuK5nQUoOZf9zNn5ssmSXAwSTpCW5?=
 =?us-ascii?Q?GiqaH0tEXfBRaILs0WZi+h9NNQ+yBce4T3UUuBnhsSWSsHv0na0/W2qMXlOf?=
 =?us-ascii?Q?j4T016LAgIgi5LMjmlPXpunpUp+a30uIjz/50oQmCRYGV28c5zYfuuX/ySg2?=
 =?us-ascii?Q?ZKjXukuZ04XmpFnWHGObIJBnEg+OTpjjrCYXnS9LcErRRTBSexgxf24viHk?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZASPxZJ6M+KJLBtTlWRPWLitJmSQPuXkdXSlelYqPGcs/e8NUsXNN39aIhMG?=
 =?us-ascii?Q?4wkGZ9oaYcyhDl3Ii3dmt3wv+IUopAnRsDf/+mS95iq9Qh5lRDve0DFd23sy?=
 =?us-ascii?Q?d7wnuryGjfSzkfA5ROBxQ+gCTYNgRZIKnXDsyiwYGYiNznN/TSvWtx3vKWGs?=
 =?us-ascii?Q?oAlISNDytBxstTY2FHMr3K3w8YLRlK36imOoyszgSCLFZQJgsraocFviAp7O?=
 =?us-ascii?Q?x7UiAVvjNA4zRSH6GfgXV92k2HyOnpttmi2Pr/JyEi6cjDAXR60x/2NZ8ktm?=
 =?us-ascii?Q?+p3NwUdO9vuSx6R0hJBL5NBA6xovyQjp4oq+To94VkviRkRSMhnh2R4oOMoR?=
 =?us-ascii?Q?uONQ1nIF7foZ9xykZGH0+e2T0GmDj9sySXutUdQEnRr+gQOfYdqRFhxvi+PF?=
 =?us-ascii?Q?k8AwOfMBrzLr0OrJZfIvaoWEHKQDyHNvmlpoIcBGGD/g5LZM2Ia5Zx0U1Vnc?=
 =?us-ascii?Q?AFEOplOLjmtJVFEuv43P5w/KOlbCMON1w1GUAAO51M6952SPsmILGplloHws?=
 =?us-ascii?Q?ZgSlsRhDr8XAoxhijAANJKc9x/WmWJK6XIXi2cnMe+viFLw33diI5ExY6QL7?=
 =?us-ascii?Q?lymoEi2ghEvcNi8Qp/YHpedyp+kMrinWTpfyOx3CxYnapGX8UA5HnOwo2+Y9?=
 =?us-ascii?Q?U30keY7gG+Co4sLZ15qLogY/Z2chNWlJOn8F2FssKmkSEwurtcY4N6T3Daxw?=
 =?us-ascii?Q?CpFLwxcgPr/vf8/bmlBY5zH/huQXx3auMeWS4T6c6BKQbeC12O11VJzAWtez?=
 =?us-ascii?Q?XVVrPTxITdqmAOjWh+ZOQC9b2Hvg2wpIvRGAEOsTDQsLJ0ZiCYARYgOakqyC?=
 =?us-ascii?Q?toJ2eojY1uNA39OhvrfZWdClTsVg/9wKhdlbSGEwa4qjik6XioQztAU/xg14?=
 =?us-ascii?Q?Mxhb0X8yAzVvZkEDixt4C+m+kVD0Qc1TQ9/zd5ZlPyDm8Vk39wjSi+hDy9km?=
 =?us-ascii?Q?KJcziLhgBwW+T1hEmN5Wgd/DMZi9cH7I8LOfa5fM91zBwY+p98tjk15u4NOH?=
 =?us-ascii?Q?Hm4mlP3pOWrolzwm8K6LtyskFyk/hMbrKeGjRbwlmDg2ONL1pF1MI7vAKJua?=
 =?us-ascii?Q?HZATi+wo+EOPFoNx7/bQcUGx6rkJgwv4Ca8IM1loEMsiX0FRA8/6Kc2K1d5m?=
 =?us-ascii?Q?mVrF7SIxHCOUJM0JI0NW7CNvL7ACvspO6Emxxux+8dFQOQEc9mpNkkawbrDa?=
 =?us-ascii?Q?+hPVLuFthMBvsxSbmSuiJlp1pRdz+j6KJLOJTIf4h7am24Voqwxh7AzrntaL?=
 =?us-ascii?Q?L6TBc58Y42toWMGScAtoxHmASwWmyZlM4xDvtDSb7ZG2fpqbdskSm4cudExh?=
 =?us-ascii?Q?dakkvZ/Ac5hWemvabbrhrcEUtN2phFPo+MMo1XeRxNR/Ai88pKhEnv51TvNP?=
 =?us-ascii?Q?Q01PBfls73KyixGXpGhvqKvrqgbEtvhyIuCCYZu7yvWTuTfrMsnya69KIBbf?=
 =?us-ascii?Q?6bXEhu9KuPa90FaY+QB5mcVzGmZ4T/CM0rqw3gy/bGY54o9wLvjGFijeZb2o?=
 =?us-ascii?Q?LbMc6YzbRrCFM62+U2PdJtko2pXJtri7ryn13LqtqacG9iffSRwMlXfmk5gu?=
 =?us-ascii?Q?Z7q0VDQ74wPh+wf1/mUcs2voG4tM2n5+cWepS9grsJKNiXLFE/rVhkCOv1gI?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe32d5d6-380a-4d8c-0240-08dc69325a8b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 16:26:56.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfH4lkDS8LcLbLMP/8mFPGkn1t8pmFL5qLNXSRoqJfYN/12gvMt8TEMlzKjvWIB3C3PwhCd7+0s9bLxfk+3qQl2CV/T2SqKEC5Gh6Y7bNyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
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

On Tue, Apr 30, 2024 at 05:51:11PM GMT, Andrzej Hajda wrote:
>After unbinding driver from the device, driver is responsible for
>leaving the device in it's initial state, to be ready to bind to another
>driver or to rebind. Particularly device sysfs entries added by the driver
>should disappear. Removing them together with drm device is too late,
>as it's life-time can be prolonged by userspace keeping open drm
>descriptor. Removing them at driver's unbind seems the proper solution.

See https://lore.kernel.org/intel-xe/20240429121436.33013-9-matthew.auld@intel.com/T/#m32ebdc8631a54979ddb270017df39e97eebe339a
and https://lore.kernel.org/dri-devel/ZjDyVfJ1QFKQlG_4@phenom.ffwll.local/T/#u

Lucas De Marchi
