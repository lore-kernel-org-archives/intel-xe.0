Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9070CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52914112E4B;
	Thu,  4 Apr 2024 15:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lk0i6/Ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500ED112D7E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712243538; x=1743779538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=61ghNvR1UfwckqR6ruEW7zVGol4zapxMv+NQV/pfpq4=;
 b=Lk0i6/AgI6e1b+CMpXgcQEl5JjUqSDfcgkS1udoDXNTs/Zfg4fvmng7s
 c0Jg7XwT2jagwVVhGojytZT+H6GIPxA+7If0UQLlcUN6X3tcjxfguGWOm
 6pnjZO+P1HKVxD38WoEBMArrb4M3jm0bE9i+d7mwyqv4CyqJ8PHit/DYv
 2v0vFlRcaJP9PLkgw4cRfhuqkJAEabRcus3I8K8bKrVpTQY2PPdyQnxRr
 NZuKTVljC9851kMOlKKSzbG/DFeLBZRt+mMInUV/MzzacVxwsZFjUshRd
 olYy7hn3nsrTb/TG0Yb/ZzFID9jbr7eAzO457Q8mmQNlylFG8BL0yutQE Q==;
X-CSE-ConnectionGUID: 1bk2fZvcQZ+FesBdQFNbSw==
X-CSE-MsgGUID: e0Zfp8ikQEyg8/7DAy28pA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11355558"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11355558"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:12:17 -0700
X-CSE-ConnectionGUID: XqOAlA6FRVSDSI7nmMLpzQ==
X-CSE-MsgGUID: 2g5p+9pGTw65kTJ2T5Zj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23282998"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 08:12:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 08:12:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 08:12:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 08:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI3IrlFQ3o20PIR99V4q+xqv9H95HwKnIqGonG/J0Qt1NdHVfpcodMLUMa54Jrau1PqOTpOEEhhqfBjXJrHu/B6LSfwf4uwN7OjLMF8FUjIBd3iw2QUOsxY4V1k9ZAYxPRr507YdvjvCkiuY+yQlN/CskFtrlVYjnRe+Mnv5+rhXUAQYeQnu5MQaCTn1RN8I4fMSJ6oT+4qgkK2wn3WXyvlM9ZVNJefCkdnjQnWbRvvrPW1MfTywm5vH3mK5svw2Q3L13WDL63XVL1ZC+4xy0vla/ZRBeeeJM1ryJXKDFrkig7Fai6hoDbYLycruWDlRotZZISqGbfJeTBH7nx2hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61ghNvR1UfwckqR6ruEW7zVGol4zapxMv+NQV/pfpq4=;
 b=V/CSrmHDfITF62sg9z3WQkZ4gwXLmYNd6GBurWfUwHzGqSJG/53o+D0fCVJVB74dERysEVp82+ZSWr7+TdnLAaI/lXGcrDu+exbYAPpGnVrWlW0cO0EbE2F4dNvs1Z3xwYg/yDZ1biqYGnm0d4wwvgdcOpOEQFYHdGbj99/q6pRe+ihdPf80DC/j1Jf/M8/MbEiw8eK+tXOLzNsOHP+piu7LypezwvCelZF8Q64zVQc2ph8lxJioLS4F5S2qZKWvvZyR4jeSflj5p2Kn9Dtps2/X7+VdCkgmouBQPCFwMFKDcYX021uwWmzimQbUV8kqkPSUzbDAWCrjrAWzaoZ7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8090.namprd11.prod.outlook.com (2603:10b6:8:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 4 Apr
 2024 15:12:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 15:12:11 +0000
Date: Thu, 4 Apr 2024 10:12:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Prefer GT oriented logs for GuC messages
Message-ID: <xntrlyzafinfmrqobz3igzus6uiq2lwz345zee3us2dgn7qrjt@lqzkh5eceqdn>
References: <20240404144107.539-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240404144107.539-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rbm82D57lOlFcMwEu39sYc36r9dLCKxzEkcHlu9szViihW1Sg0/dqtkDGRW/UorbzqXyMrGFH9eeLN99+7pOPD64Vjs1wV8+zCNy7xYdXxnwdszttvJBrHVgv8QoI/Qbb1sW3gRVNABIBTtVRPxVd+TPHDMPfw8oLqzVfFSNJfn7OUpReoREKebY34mKvigrJRGJ/W9XNv3xVfBL4z6fbyj/d3QGwzwp4CM1KoAQIDwzyD0Vx9F0YQYctkBjeL/585nWlNXVTWbtB4E1NU3o4MwiyizFSkIuSG4h/o+Dk6mBEnpmoLN9UdCBCHMJDCN8ChnEnRRnsXYZmj+XP2dEjNnZXgdIdWnwmwTCZI2O+aY5bNFnTjSEtkNmTr7YQepgzUhv5QQe2CwHgW93EL81rDyRWNA598GC/u4agUi5VwpBYpXrs93yxuAYa1HFY7mOqsCMGDLLoDlrfE3VtsaYt+3tVJ7xcpHv+hBXJqIPflNQCf665vf5eqrarMVSdG4ML+4xlLqPfOnY2pL0AcgGQWUqAnZuGMWM0C0Ntaw83zolGAzcxBg6ceR83RDykbnbWB1AWArVNjYn0rY6y5gp6+1BTYGlzrD61++Xn0Q4qqXWXZ/dwbvBImLmICnzDtGte54JspRMWWn94Pxa4+J1fDcP8kSVk1RWAZjqpNFix9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rDRsm45XfKc3WoyEJjed9dm6WDOPYKUpOpPZutMntL2FIe07odKnIp+UEzJ2?=
 =?us-ascii?Q?VoS3SEONTEFcBc5dhOXIsSUQMxzYceS7uf6M7RLh5yHA2gbfg05mmkFan2E0?=
 =?us-ascii?Q?EQHfoq9/0jvi6Oz8oeM9k+MTOb3JP1jc6rDckrZnAcT9hcsctRDm3JG6PI1B?=
 =?us-ascii?Q?oczxkUKlYWYEeTWFUeZPZg6/yMyOUGpDR662jVGeOzCuI3NV1Hg0J485y1eM?=
 =?us-ascii?Q?HkMlXzbQsNoCLkZRRCRNnmjWaem4p6LS7GBU6qx1a77m6Nh6cIfTT9eRKU+K?=
 =?us-ascii?Q?6xdBfqPltRFoJk3kSyQ+YsN7190XQO1p0LE+m8ZjRMvTbfa6DntV5jPiDLWH?=
 =?us-ascii?Q?RMGTfvd53dY/BKRBNTHz6WY0exnXyTeeYdO3aN2dVXui0zaK0WFIVsoKWrlt?=
 =?us-ascii?Q?S0hyd4t9Kij5efIH9BHglq0G5jZpyrH7jgoKNZlbeXcKzpBOYDWevV/ovSUb?=
 =?us-ascii?Q?gjbpLSvkz2u72dCKTx3vn/mhG+ndW3XnLmRoz6MntordZDi8BGEXF5LFKxfY?=
 =?us-ascii?Q?n7YpEH6kPuBVr0680LBPtIvAs/FGLwl+q3wLa0/zu+KKr+kDPoVj5u0CNKTJ?=
 =?us-ascii?Q?wBhTAFgWHgALvXhfvzraOZjsmbjX+huLZMVX2Jqy4eSp1lzHB6b1EhextP+9?=
 =?us-ascii?Q?H8d32h8Jw0gWeTSADslyDOpeRj2mXZ47adZL2Rq98L2auv3OXT2o8EY/Qkt7?=
 =?us-ascii?Q?7XH8FT37glJBA4C/aqpKgbt54ilBHwEeTqGxTKYBHBz+U/j4Zu86XkUvV1qN?=
 =?us-ascii?Q?qNIj7OU527jQ6GcJcyTbp+5sl4iw8o2pdhgkxjJIb5M7/72A+4LhdvhTeGBG?=
 =?us-ascii?Q?gAMPp/lWMZH+6gric88Nw3jtW+07Bmm2oh2pxDeze335MJRUVdrdcbgrPF5r?=
 =?us-ascii?Q?6TFKK141WaTQ5eKGRjh/fnJMJyGV3r+av0lRYPQZcaVFmU++caWiSwH1BbWi?=
 =?us-ascii?Q?UpfvXiVE8ZUeNBlcNTgbTNAJfmE4ym7m8h6Elc028MrkW4HaA+jovC3G0Ji/?=
 =?us-ascii?Q?GdOZnt9KSdIgUDb1/qxwbnetde50o0RPwxnrcqsmq4yDWz0NU+SSX4rw3KE2?=
 =?us-ascii?Q?AaayPscqJmhMDTqpsI3RCWscL+5LVk/8wvWm6KsfGHtAnLbpPM2XFNoIkSk4?=
 =?us-ascii?Q?6JAHvogncUvrEhpXBUoE4iuGVFJ81NZcygipiXu3S3fxw9T5cIMB6SXaiuze?=
 =?us-ascii?Q?zg8Qy5iLXKO6TTXGZZUfhSLMXWIvmMKt28BQSbxQug2fV8U7Q3VVkC7ONm/j?=
 =?us-ascii?Q?NwrvWrtCd+e3GSYwA91J8+Y0FNPnDwMp4tS+iIFFhKeH9f+xGLeFwH0jgXSJ?=
 =?us-ascii?Q?x75oY4fyLDRUfw5iARyUL5CSlIU/0c1BLfzwIkHAH5x4CPSjs+7AA0gGUxPO?=
 =?us-ascii?Q?oa7GxzApUytlIwyhAkRer3H8FTz047wWbGEPR5m2FGzyDMb4LTutQPhtjPoC?=
 =?us-ascii?Q?sBdN2VexXWRWVzB/cjrGGVIpFYjCfFzAXy2JL096CSqP93X2h0dvqM9R6j8B?=
 =?us-ascii?Q?3g+fq2UJTy+MozfE8/VhEbmSPHGjHrrrfMdGvWS1dUipzRxg00TcSVR6/y0C?=
 =?us-ascii?Q?6I69MH5nqPMCJ1bnwuisH0PBam3xPeVUs2O5mATLrjpveUedfNkNC5fByp8u?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 269baef1-0f92-4e37-66f2-08dc54b99a2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 15:12:11.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IRbs5Lo26Urz1GpClOw8eh5TXpXE+MlvwSDvyXK5RZyEtC84/avjIscoFX0sUGPJTmRG4ybW7QBoMHi3Q/+em3vriF0VWOVY2vg9fiC0nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8090
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

On Thu, Apr 04, 2024 at 04:41:06PM +0200, Michal Wajdeczko wrote:
>A platform can have more than one GuC, so we should use GT-oriented
>logs to correctly identify the source of the message.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
