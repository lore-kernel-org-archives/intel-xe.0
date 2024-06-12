Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A451C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 18:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E1A10E6AD;
	Wed, 12 Jun 2024 18:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7pcuoUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E3C10E737
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718215600; x=1749751600;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oLD/sn/9pCmdUG1gfmOYo88rl8MHcc89rHKENfxzyd8=;
 b=S7pcuoUNN7UFTncfcZ/RCPdIuRYLywZCsybA9ReqZyFZfYkpCxgE0gG7
 AuSE6kaeGYDXGjLxhWn0A6Y9vgk0bb6iWPKuFwiaPgmX5ndIHp0Bwj2Iq
 I90ydqXWcQkQbSWN8lNb1n9DSQkJ4X0DaBTcNQy4MqYIC2+aX8EC8dB8B
 aLJQ8e2KL0rtkVnqBsG9wEslvrRLfhbJ82CIa5FhNKe+BbJQZ9f/EtdSh
 xVyUD/Yf8wJ3xwIFq/inyFnzVKgqApTP5yERwt1MitKPwoBWDsTmoDWt/
 uqcQeAiEI/3FJIhCfmbmji82MEg4WaO2Zu9HNE4UbDwSa6vHxrvj9yG0b A==;
X-CSE-ConnectionGUID: Y+Ftd4amTySb7dSR8SMqjQ==
X-CSE-MsgGUID: y6ig2TR8RyKjL3NYsJ4uzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32544007"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="32544007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 11:06:39 -0700
X-CSE-ConnectionGUID: R4pJSmaOTK+o5vG3y42IxA==
X-CSE-MsgGUID: QqpmfUVLSeG67ScqXGzSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40499802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 11:06:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 11:06:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 11:06:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 11:06:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 11:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENE2G4E9Py/u+chnHfsCwv0HiuTmvwAgC2lwEU/U2ROq/fmvsU/1C2nEqKETP6bYSlMOvjLnSiHYRn+gkL92W8qCZr88i6xsOeCV1c1sF3nURn7ckfIHyE+JgqVCYjRawNdp+0ZEtcdbFMpjJLtrLKtOuw9rE6J0vc5NdALq+HyYeSodY333gdqlwF6olLnImZTmrrLShJWOZ/WyNbIzvI2kgbESEi7LJF6W3eY2gQWxSvT1HmwQmGd33xPIWL3p/48EY2ClOGGTcSf7tKydD7HPIvOpRtjddpNb+3zSTa1HCamwtgeYb6hOWNtKTjOW37F0DLCe3uggKUrMluSvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEN2KHR3mGmt9q5WeSUuajRWIVa6etc23ilbqLfAXLE=;
 b=O4SuqNkxSBPuBwotNZsUnsn84w82/oiJc7Aw09vL5eYc7o99h4uQeFCjUD/joWeW/JQLErey66SELIOa6l8/jda1AYd7CNO0aEYCPyBI9oQBSNVJI3fMx8XWqRJGw8iRVkGYLLUQgv3GKMCN6BKVKSl7B4yECYGsgisVnMytAfvi8eAfCNfm4AKi9odv+ByEB3kRijAdhFwK2f4PGuUu1QAULZX9eApHzKSeGdqFjLZ7c7D54+636P1W3IC33JPTkABtpGw+XUngAoa/Id6z8VnHBLI0ciMX0rk4ol9tI/C0hf8U7lFX9puNxve8JWHxmUoB562Cl4rJNGiXyHyhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 18:06:36 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 18:06:36 +0000
Date: Wed, 12 Jun 2024 18:05:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <Zmnjh452X84yn/IN@DUT025-TGLU.fm.intel.com>
References: <20240612172746.245552-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612172746.245552-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 83135138-3983-48e4-eebb-08dc8b0a65ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oNB3y/+eT3ifURY6Lr3nPuv+OzGHIX5iqNLDouQ0H5Ps+HuybcVq11mgLT?=
 =?iso-8859-1?Q?nQ3zRJ6Q89TI+b4ZvDn3S5sHbjEw7/UXm9fqNylS9Lb8pTKrKDpydForH7?=
 =?iso-8859-1?Q?J/oUmjEFCkbg8sVqK+SrleFO9aRD1OIjIX+eMN2kLS45gMuRPuWeacNLIb?=
 =?iso-8859-1?Q?LWX2aNb8p0Ph5PF4aYJ/Jd4emKlh+7k5DGn5Je0+EtSEHOVu23NgxjDhqI?=
 =?iso-8859-1?Q?dwoLaWhxe+yT71lpBRFjcF5bOwaguAqC+5/UQSaV4s798JuQbJvWpIwYRd?=
 =?iso-8859-1?Q?aA6dD9DfH+xNQ0TQvzqG1yOjb/HveR9pljTcHJsI91hGd5Ps3s04M2Bv9Q?=
 =?iso-8859-1?Q?9fRnFgJA+bz0LGcD7y2ieUVcuJmGcuspY9WjCFI0PooiNQQrIALlMFONci?=
 =?iso-8859-1?Q?A28qA2q5aLOHOYqOZCPZeYFKjv7AA091YlD92MRC0jXoyH5z3qwf1ym5kR?=
 =?iso-8859-1?Q?NJ+2I40gMdSsE6vKCdNIvsinrs4oDQMfTjkGcMpcPm63XiaJo9Z4CS0KRX?=
 =?iso-8859-1?Q?ZAuhzA7N+61zTnDz84/Yv6RznkN/aokl4v5GgKqHkrxKYb6u7KqA5E94fj?=
 =?iso-8859-1?Q?HHYzZUrMpjQRZ6Mc1EOCCOYS28UVy5xk5oJJ5j0ovayXyouq/R3brOfmbj?=
 =?iso-8859-1?Q?Mp93bOJ2F957NcssTNTt3DbfLys9dKnp8jdbs2Qiolav6kSRGDYJ02ZSB0?=
 =?iso-8859-1?Q?ZHMdFQ0wx2tWZtAuVTo7eTmvNlyEFduywNSClCqKkYKbx7GrP4PWMjoOfK?=
 =?iso-8859-1?Q?zkctzaYG3DhO9w8m0UZlLDP3BS9H7Iz/O72LFi3ZKkQl9JQoXE4cqElm1T?=
 =?iso-8859-1?Q?jwxVPo460pafdjNd4dH/ZEePrh2QoH1oRsO8ogIF8fImbGnTEV4q7FWjgh?=
 =?iso-8859-1?Q?CoOJqXUN3aOULzHNNAN6GKyZG/3bl+kNpIbHo+b/TpdVYq3jS0MhkpExMl?=
 =?iso-8859-1?Q?prkmMxKeb7icIvsSkplrHAo8jChA7wb7bm7MCCUGkS6qSfOBpheUBduovz?=
 =?iso-8859-1?Q?9cI0EnAI/AHXt3/U6r9cpTVdQWB/lOfXXAr8cFHlJBT1rNeCYCySSNeTn9?=
 =?iso-8859-1?Q?EEcWHPVruCUfIBpyqI3hV2GtiBFBynMX1sQCqk4w1CVLR7G1lWr1TQMw1T?=
 =?iso-8859-1?Q?xmzSCYhJHvHhOm9qBVLP+NpB9tO8urRGct3Pd4BMrfX2mjZWuZTW5m7Loa?=
 =?iso-8859-1?Q?l5Rz7m8BbiB0rmqAfvpj9Mb/EeI6t6iq1objUQ68djrUe2hAIr66eYxBNc?=
 =?iso-8859-1?Q?M7ELsu/2Vo1PyQgzdAY9ssmHqlSc4ZYRgr4eV3GJyQ5tecCralK2HSGT0w?=
 =?iso-8859-1?Q?njC86nXbiT0mK45aDR1IyixUsmHzbb9KpYggL999T97s8TB8kPMQftu4PX?=
 =?iso-8859-1?Q?hytV3J++wf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vd7brF6yVi1J9m4qGRP0jeuBIhtnBJ6i+43dygdUSP7pluEXU5ZV8HwmO3?=
 =?iso-8859-1?Q?XHLZGgbDQBybmnI+efIkFp8yZHmrR5mfMfL6tz2UDxgiAznkIgVgvCbZWZ?=
 =?iso-8859-1?Q?MohR5moW3iW0OI6y6ruynhbxxED0ikYuD7fCTiWIgAoJoupcNpJiraQWsf?=
 =?iso-8859-1?Q?CNdKmJAZFo396eS93VUbvtZTZDsqBox+dbmOfdJ978zdhdRYWiOPSJq1Rk?=
 =?iso-8859-1?Q?iDmzXf+mpecECs2DHw94RbEm18826FlnGly6FjzRQ50LrfQ70sMlarzM5L?=
 =?iso-8859-1?Q?E7NKcvld2LAxQCZrWymNI4cEpe2b546ZqBPm3lShgCtR/bYo8K3P4sBgDA?=
 =?iso-8859-1?Q?E0Numk7bbUJD5iJmtSnleq3To2SATkNpMoVmdEwBBcy47wUvghRFVKoOpz?=
 =?iso-8859-1?Q?RMMYlW5oF6AscIsvyMKu7ZO1g68/l3rO7o5gYmifd1xvOEwqIV+gl4aF/R?=
 =?iso-8859-1?Q?s00Mbq3hujql31AsNTB4HcM1T0R0PDIKPtVtjF4OYlnZodWNbF1BM6iA/9?=
 =?iso-8859-1?Q?SxPKqnhVbevCkkazzJII4txGGphm4pzwkIuKAnfM08lkz3cAxm2h/9o0pX?=
 =?iso-8859-1?Q?qs+ci51QYf5t5PgSr+g9kPm3PSAAnH/hKu9XN9WbUhmJ8mbgYdSPmxSXNh?=
 =?iso-8859-1?Q?MWmWXgavgpNgbkfqcpXuy1rL3xBwFJ8zBcMakl7hBJzST4wzj7pF5yFIlx?=
 =?iso-8859-1?Q?3QFi7QIC1XsarhmiybipM+9GaTDJD1JUSNqsm7teSXKXc3x2O1JIfUG6sJ?=
 =?iso-8859-1?Q?6ILIj0WjD43hmQyM0JR2q9SJPIjBkzluZy9PtC/vbXWt2kjTiRr8vvsZg2?=
 =?iso-8859-1?Q?GjxKDCdZM1WHNjqrh0xGQ98egpJ9LEDQoYRHTKOLnwlmX2lfSPruMfiYae?=
 =?iso-8859-1?Q?AzQNORGBgZc6HGVtjGU34KPmRoZKLc0GbqZ/2AARjMBBBRG+tEuuTp2Y62?=
 =?iso-8859-1?Q?J3yOt9MYGONswXgK2STiuRQNraWuw+gjzEXBTIy83vnuXcI13INbuKv0DL?=
 =?iso-8859-1?Q?iNnfdZLmUyRVrMNhvZYiM454ymfTVEKEgyt7g+CgNQtNqRS3RAtsaOyanT?=
 =?iso-8859-1?Q?jfd8gYWymn8k8c1vSNdcJVPUywH2kXOgK5z/ZoWvAr6eulpMMhKvwyGnWf?=
 =?iso-8859-1?Q?im63VNJEEPc7vrK2mqD3PevNiNyDGEW60anar7aXcQLcb2yTJUMhv9YxTu?=
 =?iso-8859-1?Q?RFt9ENky8hNeitYzzM68A4Xo5ruwadnzX3Kk6plrsGop2cGb/A1/YNR1mB?=
 =?iso-8859-1?Q?mYiCuoXKu6bMO//MJMyUYzS0ThU6Eu5C47pnfd+RXBRIrUewForcVgvieb?=
 =?iso-8859-1?Q?PtePoOQantyNnpWSSv5QeC9wPuhIN0iPj9rgn8cTYw/oQp0zRwxIuKWboQ?=
 =?iso-8859-1?Q?FfMK4HIfriwUbLN6CmZ/4/mMY6910DwzkeroRPWJag8Ho1NPIwP/r8bqp0?=
 =?iso-8859-1?Q?3WHQOUwNgf8XVyGbxXq9XBTuxumx4+xUQPC0c2QLeER7tHZstpM4rgj/wE?=
 =?iso-8859-1?Q?oziQZxmm/5AOJuseSIvLHKYHu/gUOA8uRK94cqBC3rQ7R3UhsqV4VMbxb4?=
 =?iso-8859-1?Q?gAukJgY4TbJiWurDYKj13qLqZ1SgoTQtk6uwWGPr8yp83hwIpeeVTkLrvt?=
 =?iso-8859-1?Q?WWVLxkk2SZw2ZLj4f9EsI/YsJfF1mIp7eSzF6Kp65WzrUWysL2uLr6Kg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83135138-3983-48e4-eebb-08dc8b0a65ed
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 18:06:35.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUHtxMq5+mxDhYIjXf0z/JXNP6arg5BDyfhZLqh6jXwCZuwB48sXC1icx0YrUy+lO0QAu/Qi3bQtihnL7lc4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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

On Wed, Jun 12, 2024 at 01:27:46PM -0400, Rodrigo Vivi wrote:
> Defer the ggtt node removal to a thread if runtime_pm is not active.
> 
> The ggtt node removal can be called from multiple places, including
> places where we cannot protect with outer callers and places we are
> within other locks. So, try to grab the runtime reference if the
> device is already active, otherwise defer the removal to a separate
> thread from where we are sure we can wake the device up.
> 
> v2: - use xe wq instead of system wq (Matt and CI)
>     - Avoid GFP_KERNEL to be future proof since this removal can
>     be called from outside our drivers and we don't want to block
>     if atomic is needed. (Matt)
> v3: amend forgot chunk declaring xe_device.
> v4: Use a xe_ggtt_region to encapsulate the node and remova info,
>     wihtout the need for any memory allocation at runtime.
> 
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +--
>  drivers/gpu/drm/xe/xe_bo.c             |   2 +-
>  drivers/gpu/drm/xe/xe_bo.h             |   6 +-
>  drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c           | 112 +++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
>  drivers/gpu/drm/xe/xe_ggtt_types.h     |  21 +++++
>  7 files changed, 111 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a2f417209124..b54d8850463a 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  	}
>  
>  	vma->dpt = dpt;
> -	vma->node = dpt->ggtt_node;
> +	vma->node = dpt->ggtt_region.node;
>  	return 0;
>  }
>  
> @@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		align = max_t(u32, align, SZ_64K);
>  
> -	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
> -		vma->node = bo->ggtt_node;
> +	if (bo->ggtt_region.node.size && view->type == I915_GTT_VIEW_NORMAL) {
> +		vma->node = bo->ggtt_region.node;
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> @@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
> -		 vma->bo->ggtt_node.start != vma->node.start)
> +	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region.node) ||
> +		 vma->bo->ggtt_region.node.start != vma->node.start)
>  		xe_ggtt_remove_node(ggtt, &vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2bae01ce4e5b..c807c0fe8d4a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  
>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>  
> -	if (bo->ggtt_node.size)
> +	if (bo->ggtt_region.node.size)
>  		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
>  
>  #ifdef CONFIG_PROC_FS
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6de894c728f5..79e77dac48f3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>  static inline u32
>  xe_bo_ggtt_addr(struct xe_bo *bo)
>  {
> -	XE_WARN_ON(bo->ggtt_node.size > bo->size);
> -	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
> -	return bo->ggtt_node.start;
> +	XE_WARN_ON(bo->ggtt_region.node.size > bo->size);
> +	XE_WARN_ON(bo->ggtt_region.node.start + bo->ggtt_region.node.size > (1ull << 32));
> +	return bo->ggtt_region.node.start;
>  }
>  
>  int xe_bo_vmap(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 86422e113d39..d905fa5e1b52 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -14,6 +14,8 @@
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> +#include "xe_ggtt_types.h"
> +
>  struct xe_device;
>  struct xe_vm;
>  
> @@ -38,8 +40,8 @@ struct xe_bo {
>  	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
>  	/** @placement: current placement for this BO */
>  	struct ttm_placement placement;
> -	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
> -	struct drm_mm_node ggtt_node;
> +	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
> +	struct xe_ggtt_region ggtt_region;
>  	/** @vmap: iosys map of this buffer */
>  	struct iosys_map vmap;
>  	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..d683c27761c0 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -389,7 +389,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> -	u64 start = bo->ggtt_node.start;
> +	u64 start = bo->ggtt_region.node.start;
>  	u64 offset, pte;
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> @@ -398,6 +398,74 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	}
>  }
>  
> +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			     bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	bool bound;
> +	int idx;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +
> +	mutex_lock(&ggtt->lock);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->start, node->size);
> +	drm_mm_remove_node(node);
> +	node->size = 0;
> +	mutex_unlock(&ggtt->lock);
> +
> +	if (!bound)
> +		return;
> +
> +	if (invalidate)
> +		xe_ggtt_invalidate(ggtt);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void ggtt_remove_node_work_func(struct work_struct *work)
> +{
> +	struct xe_ggtt_region *ggtt_region = container_of(work,
> +							  typeof(*ggtt_region),
> +							  delayed_removal.work);
> +	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
> +
> +	xe_pm_runtime_get(xe);
> +	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
> +			 ggtt_region->delayed_removal.invalidate);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
> +{
> +	struct xe_ggtt_region *ggtt_region = container_of(node,
> +							  typeof(*ggtt_region),
> +							  node);
> +	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
> +

I think you need to set ggtt_region->delayed_removal.invalidate here.

Otherwise LGTM.

Matt

> +	queue_work(xe->unordered_wq, &ggtt_region->delayed_removal.work);
> +}
> +
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		ggtt_remove_node(ggtt, node, invalidate);
> +		xe_pm_runtime_put(xe);
> +	} else {
> +		ggtt_queue_remove_node(node, invalidate);
> +	}
> +}
> +
> +static void ggtt_region_init(struct xe_ggtt *ggtt,
> +			     struct xe_ggtt_region *ggtt_region)
> +{
> +	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
> +	ggtt_region->ggtt = ggtt;
> +}
> +
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  				  u64 start, u64 end)
>  {
> @@ -407,9 +475,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
>  
> -	if (XE_WARN_ON(bo->ggtt_node.size)) {
> +	if (XE_WARN_ON(bo->ggtt_region.node.size)) {
>  		/* Someone's already inserted this BO in the GGTT */
> -		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +		xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
>  		return 0;
>  	}
>  
> @@ -417,9 +485,11 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (err)
>  		return err;
>  
> +	ggtt_region_init(ggtt, &bo->ggtt_region);
> +
>  	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>  	mutex_lock(&ggtt->lock);
> -	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
> +	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region.node, bo->size,
>  					  alignment, 0, start, end, 0);
>  	if (!err)
>  		xe_ggtt_map_bo(ggtt, bo);
> @@ -443,43 +513,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> -			 bool invalidate)
> -{
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	bool bound;
> -	int idx;
> -
> -	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
> -
> -	mutex_lock(&ggtt->lock);
> -	if (bound)
> -		xe_ggtt_clear(ggtt, node->start, node->size);
> -	drm_mm_remove_node(node);
> -	node->size = 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (!bound)
> -		return;
> -
> -	if (invalidate)
> -		xe_ggtt_invalidate(ggtt);
> -
> -	xe_pm_runtime_put(xe);
> -	drm_dev_exit(idx);
> -}
> -
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> -	if (XE_WARN_ON(!bo->ggtt_node.size))
> +	if (XE_WARN_ON(!bo->ggtt_region.node.size))
>  		return;
>  
>  	/* This BO is not currently in the GGTT */
> -	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +	xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
>  
> -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
> +	xe_ggtt_remove_node(ggtt, &bo->ggtt_region.node,
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a41a1762358..75511b5f43eb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  			 u64 start, u64 end);
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> -
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..bea66aa0d843 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -36,4 +36,25 @@ struct xe_ggtt {
>  	struct drm_mm mm;
>  };
>  
> +/**
> + * struct xe_ggtt_region - GGTT region node
> + * It needs to be initialized before the drm_mm_node insertion in the GGTT.
> + */
> +struct xe_ggtt_region {
> +	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> +	struct xe_ggtt *ggtt;
> +	/** @node: The drm_mm_node itself */
> +	struct drm_mm_node node;
> +	/**
> +	 * @delayed_removal: Information for removal through work thread when
> +	 * device runtime_pm is suspended
> +	 */
> +	struct {
> +		/** @delayed_removal.work: The work struct for the delayed removal */
> +		struct work_struct work;
> +		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
> +		bool invalidate;
> +	} delayed_removal;
> +};
> +
>  #endif
> -- 
> 2.45.1
> 
