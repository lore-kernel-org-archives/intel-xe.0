Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C454BCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 05:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FE210E23C;
	Tue,  4 Nov 2025 05:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mttVaX9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4C10E23C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 05:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762232553; x=1793768553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Pb6jTNEKNjxV6ZPu2UTpyl/Qy2PJc2FGUk4+h5udurE=;
 b=mttVaX9pgeNCZOtTp6FGUdFpJBUBT0Jkls5oKM6uJuADOU+tnGkx6++H
 0s99AABTxUSw0q7GgRWkEP2nR8SnWI6MRG7E7N2JU2JrucgA/atlf3PLw
 mbVcQSCuwRgq+tiAqTjNPh8hQGVOgBigBSyLU1aNGQn9LUzWuMMS9GytJ
 KNNWOdyNs+0L3iGColKKwBGE/SpgjNKdD2KjtgqP2c9uBjQnaqJF8qnzU
 mhkErGW0GGPwiKCxqzR23szfnLwkQ5fzUIWknMH9JE5GLfoDtb4nyfJy9
 mF9qTwg5Hb94xk6UDM4mdZ8+Qf3tLmGmmWNDUtJwOa56BbNfjlEc4MOar Q==;
X-CSE-ConnectionGUID: /iQKJEB9R7mvB5J9JEni0Q==
X-CSE-MsgGUID: uAOu359BQwy8DnrwDeoviA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74923577"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="74923577"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 21:02:33 -0800
X-CSE-ConnectionGUID: sdvGgIGdQl6rcO2+1/exlg==
X-CSE-MsgGUID: GE2Rt28qQB2BZf/KNcUtOA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 21:02:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 21:02:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 21:02:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 21:02:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU7WQEHoGqfj6YVE3hPsLz7jRohZA4lO/cFs8a7TTJ6jkyu0ziJdYpzLZweQWH4iwVCEjsk6lNUsfhLFxbaqorP7XgxiLGCz1v0FU2tuuJnrtk8y+dTkeyagGGsYbJYZ7MCj5hmVsYjnDoJ2gCtpMXNy5UeqSAz0KDxseUiqmHHVovYBCx5GBqi489d47HoBqd82SPEjsvsVST8w1cQl/+NWGKFuFzlB1PGydNDap56f54mOTDZI+fHvH853l+YJIuaBBowrWJRFx7TaoDBYA99I/Me3HVQk4tpGH0gZuX/ry0IU94NQyFs/Ufb7/sUG/VHrj0ZuYq2uz1mvAHHyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7ykWdm7SS3w+QdeTRSRn71X/1Twy6Y7nTrODF8gqJw=;
 b=iE9RTT/rIiOCcw3LwCoZfj2qsQNz1VN699NmqH6ktzaVH9ZdhCLA2CISJVqs0MWBLTvOIwxTofG5heDYmDyTWmNeK0/dG80v5EmFgJ7qX+fOLy76e8tDmkzeKsTuTlA9yPRiAKVbjqfKDooXe0vxN9+vKHJ8ovd3RHvBqsKceSAX1XZN1HArHOB4inQ5jHGOpPL9jZ5jvQvXbw71k9ojdWVILk+6wTF2kdRacAhqbADxWkfb/JQ65iLmyCx/rOzc6nT8ctjQ8uXDFB8zelUEPPhS0Lfb02yQn5jLcXtjWKAzwnl+x/MXBa6I5/WRJGOf6HyJXIiMjERSjv9ARz9TYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 05:02:30 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 05:02:30 +0000
Date: Mon, 3 Nov 2025 21:02:26 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aQmI4ty1_6Ox55kt@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-4-niranjana.vishwanathapura@intel.com>
 <aQectLNtpCW8VIgm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQectLNtpCW8VIgm@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ea2841-b402-42f3-1ad0-08de1b5f5b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HlgSd8eo3Lr6tZEbBiFZIw4bTH9oUK4WMZ0WsgDCuvrszjBdsDlvERpHRTMq?=
 =?us-ascii?Q?6EVgyvrNQ4fV22e/diHv59NB5da/+0z336rWDXDp4Su2Pn4DAD//1/8se0lV?=
 =?us-ascii?Q?af8Hhp6NApyH+msirqyFKwa6zeAM0PYBCNDK6G+yYkswIDVrRdXeLuk8PRv3?=
 =?us-ascii?Q?SF8AipSVJlkiz9I+zuYZ8HNmqidRj3F5tQ+SukqCdnd1Js6RFJ7HLoCDnj01?=
 =?us-ascii?Q?ORVTNsXEsxcHPA9g+2BN88wIPNsK5rm+wtPhz3OrPtNlTIPqHOjGQcHSRCNF?=
 =?us-ascii?Q?wuWKDdMHkkgvauGeLaaW/i2rk/dSxbSWgWq10h1BJtRhQgveweX3VbkNiNgY?=
 =?us-ascii?Q?k5L8e9E7FXmP15vObo6sYgE4xMgPS/jmSJKVckaiMtyLtWwGYtDs1DoGpQNX?=
 =?us-ascii?Q?bzXeU/FayrSge5bJSwRzBUw2Io4sR1YgyrWTYAFcFOEHFDvstfPXDdOTJ+6E?=
 =?us-ascii?Q?jz5GOk4co6E+00OMN0wH/lY4SrsN8SaGCAEMnbyeaHZSmFyZHMXOwq4GqLei?=
 =?us-ascii?Q?V//0QL8XyQlD/XYwMtZAdk5rVrQJLSht2vmMUq5uNvJAgLKg89Ig5FjBWtTY?=
 =?us-ascii?Q?R8eve95H6hzYWnEzSfb0xBh0cvU/H25h3JDta1ODmlTo2CsFF0ucKHPnwL/j?=
 =?us-ascii?Q?r85BB8VJBR2QnwSDJ1ZP6mjrpI1fYLYDR2TNe/uKEYd7Mt1oRyPhnSOp2ikN?=
 =?us-ascii?Q?8eXPDTSnPJZ6G3oRspakOv6BRVm2NYHeN/otU5DADSWtD5QXfXZGmPQ5cyoa?=
 =?us-ascii?Q?Js25mhDSTQSZByxbC6aSn0MA+fP2/kLU+KfWl516daGBLWXHCkohU2/dSyNn?=
 =?us-ascii?Q?+VkQhXJXsHsDMURA783zq4PfqoQ9OOMpb44sTBlAcuiIBC0+EvUGQjwgxvv1?=
 =?us-ascii?Q?tWKwfpob8jXLw88ySn70MdNkvZTKz6qaucfDh57fVoyRil0+6Rh6CJ1hRZzg?=
 =?us-ascii?Q?UvblXP5sqhR7hu3cQSeOJalMEbWDM3UUTSl0VGIO4dEh0KIcuaVw814KXJ/m?=
 =?us-ascii?Q?TAPfVnrwtT0QBOi+P379wDykQfDjIqNeWCPXNBlHBXeEe4Wv7+fBEITSaIfH?=
 =?us-ascii?Q?t7kvzgg1zLjCxZb8QHeKqgRtwVaL/cgdGWW9kKVg6qTPsMby17f3d/dorDiq?=
 =?us-ascii?Q?CuK4ZOOqPTlFsdPjs0w3gqdbkdjr5UoG8tKUNWmrP72WpkWJ4XsHyky8h4W5?=
 =?us-ascii?Q?uJtouvfwP6LXBB+oBUDVL134YTMSeOVKbFoDZQsPnonqOT1/+zdKxA5c0ntL?=
 =?us-ascii?Q?B0+8zyxY+DybJ+vWGzGZhW4W5uC5Q6ReFdWzBqbQgJAxE5VXB6cnsBA/uKQu?=
 =?us-ascii?Q?Ck9CZLwKn+XmuJ8xnBiye4/DBDQ1G2d+/7Hh8AZhhMR87ISq4XXeJJdfalpJ?=
 =?us-ascii?Q?Em08m75r6TEmPs+kqOi80f/RW4JWZKv+InOcD24QZvkqk+s9Ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?COP1is7yprs/eFImgmx9RToldGe3v0pcDmy1MhI1kqhcPE8e9Ooqdds1ch3n?=
 =?us-ascii?Q?ZEEu86CXySZYky9BKhFv2Qt9lSZ+blshnVLy4FjBm9Cb1SpXMMDDGWl1qqVc?=
 =?us-ascii?Q?v3bf7iNtGl+pLzMKSuPsTCJZZ7wRt87H9BirOOVK/YfMCtwpSJCM6bOuFPl+?=
 =?us-ascii?Q?eLQdA4e/bzBdcQT+sK8hbcz2OwkO+XayA6UHfY7mmTsLnGagWz1Cu3EPCFwY?=
 =?us-ascii?Q?STKTVzhmyOAi1iq3BuffMZLlPr4/rS2Z5lJVoge71MUbb50jfmiRKXyc/qY9?=
 =?us-ascii?Q?oFDpauhiAFJHD183mgG4nmiMc01O5EtXxD1Lf7ZP1jOWHFm1S0O/NWHDBP8X?=
 =?us-ascii?Q?/DUvO31GL3cNaH0KBfhqwiPZL2Rn9dWkITkOh0HReCBI/8wKN6P1u+cpBMbs?=
 =?us-ascii?Q?MSFvT+iu/1ISk0PesunE//J0y2vN4nMLv8RtrRC88uZznB63JWoV9JXFM8EA?=
 =?us-ascii?Q?m2B0hDnfppsd6J/Gb7/oISNXrwt+dSoci1/AdP2Xr/aXnk3UFpQNNOANz6mT?=
 =?us-ascii?Q?gwUDLnnBaBhmKdQwkSyCSYPHqQXISUFZnLs/dAq7jnrHE1TrLGsal4/a+EtE?=
 =?us-ascii?Q?ujBShq/HKK0RP4dOvmVYpdpohnd9lHlavROiWz57VPkHsUD2SshVCYllky+D?=
 =?us-ascii?Q?yJO8VD40kos3IjUKMRJkyqJSQFOeQrvyRnp8QiXGBsZkPc7hHtsBCBjysQpp?=
 =?us-ascii?Q?apThlFZ2R7z9/Trui772HSXDj5ctYX/+E/U5lMwVMn7xjkLkebVP3amqMtfc?=
 =?us-ascii?Q?PDTb/RAUmEyPh/tiYjEGelUFi8HRcMzcAcg+a2OG67tPffP2kT9z/4TF8dWV?=
 =?us-ascii?Q?wDFs7RcSUUF7ONW+BDFJa7Uz8EM1KhkmDjvMfQLYZx9dG59cg/qWxlxfc5G+?=
 =?us-ascii?Q?Ep8HQtMTpH+ekOnXMT1jrNQ5NfEBn2tezS2zmwd97grqlhkGbfzwjvx/c526?=
 =?us-ascii?Q?ifApg0jCrHRDVvZ8yRv5O5Nviyoykkp3ilSRW0npwiEd4hS6nTLdP0LkXbQr?=
 =?us-ascii?Q?Azg0ver2XGJTV87eGyEQZT5JYNkVFFgWNr0aiWwoGKWA0zu1uiifusu/Hmsd?=
 =?us-ascii?Q?i+YTWzKiC5+8O9eKyS4EZYtn6H2r9Qp3NBFilwl2i7X10HS6E1iBaGepRcpB?=
 =?us-ascii?Q?OgFpMwO3fVlWLOYgFAwreqpCt9KshXx8dusb88J9tmylHp43BON54tInjtmx?=
 =?us-ascii?Q?/Qb3PUu2ygvNol+xb9zKWHjAmKFiV0Q9wyRl22jWQ4LNFU8mPwxV5kQ7gpr5?=
 =?us-ascii?Q?y3cC3h1EcZOj24KerGOYz1Sybq6o/QXG0QSHtHqs7GSwuJirYeHwO15TbQ7S?=
 =?us-ascii?Q?LH47R2r8AzUONdBujwXpsVIRvzG0TRVddvv2ow8RG5QiempQ3M6CABKIeGlj?=
 =?us-ascii?Q?7mc8w4k4peqQewWs4Uz+ME/Kc9TccFAtACe3DJjWhUd1OXKNsjxq7qiNYhR2?=
 =?us-ascii?Q?nSqj+269xiIJ33q3zAeIfs6uAAN3ihVvlXCZ9OQXlVoZkiqu1hZ9oAysH7qM?=
 =?us-ascii?Q?EbnessnBaEmAVXd11h3Xleb7rPSVDudXRJQHYO+7vD7zNozAvjM6NUNCtRPd?=
 =?us-ascii?Q?3oLG/of6I9uBl3ffb1lpoefFVVVu58BrDT639iAqgUDJvCvfzqTPyWbUP6zA?=
 =?us-ascii?Q?LVBNdOVJsfiNhOtuCX+qOXY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ea2841-b402-42f3-1ad0-08de1b5f5b26
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 05:02:30.0749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XScZpXsrFRYizRt6FlYtQNLVS1L5EcpmfAlwvMjOtssc87P+6U8tT1wOQDynRNZcXsjDrEzg1FHNLYXULC1x+xtD/GHTl70z/fybiNr6cg7l7hsB+ap2PtnBgF8Mofp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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

On Sun, Nov 02, 2025 at 10:02:28AM -0800, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:23AM -0700, Niranjana Vishwanathapura wrote:
>> Implement GuC commands and response along with the Context
>> Group Page (CGP) interface for multi queue support.
>>
>> Ensure that only primary queue (q0) of a multi queue group
>> communicate with GuC. The secondary queues of the group only
>> need to maintain LRCA and interface with drm scheduler.
>>
>> Use primary queue's submit_wq for all secondary queues of a multi
>> queue group. This serialization avoids any locking around CGP
>> synchronization with GuC.
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>>  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>>  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 302 +++++++++++++++++++----
>>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>>  6 files changed, 270 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 47756e4674a1..3e9fbed9cda6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -139,6 +139,9 @@ enum xe_guc_action {
>>  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>> +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
>> +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 3856776df5c4..38e47b003259 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -47,6 +47,8 @@ struct xe_exec_queue_group {
>>  	struct xarray xa;
>>  	/** @list_lock: Secondary queue list lock */
>>  	struct mutex list_lock;
>> +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>> +	bool sync_pending;
>>  };
>>
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index e68953ef3a00..48b5006eb080 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1304,6 +1304,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  	lockdep_assert_held(&ct->lock);
>>
>>  	switch (action) {
>> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
>> @@ -1570,6 +1571,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>>  		break;
>>  #endif
>> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>> +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
>> +		break;
>>  	default:
>>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>  	}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c90dd266e9cf..610dfb2f1cb5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -16,6 +16,7 @@
>>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
>> +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		4
>>
>>  #define GUC_ID_MAX			65535
>>  #define GUC_ID_UNKNOWN			0xffffffff
>> @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
>
>Side note - this struct could probably move to private struct
>xe_guc_submit.c.
>

Yah, looks like it should be.

>>  	u32 wq_base_lo;
>>  	u32 wq_base_hi;
>>  	u32 wq_size;
>> +	u32 cgp_lo;
>> +	u32 cgp_hi;
>>  	u32 hwlrca_lo;
>>  	u32 hwlrca_hi;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index d4ffdb71ef3d..d2aa9a2524e7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -46,6 +46,7 @@
>>  #include "xe_trace.h"
>>  #include "xe_uc_fw.h"
>>  #include "xe_vm.h"
>> +#include "xe_bo.h"
>
>Why do you need xe_bo.h? It is not obvious to me. If you need it,
>alphabetical order.
>

It is needed as we call xe_bo_ggtt_addr() below.
Ok, will make it alphabetical order.

>>
>>  static struct xe_guc *
>>  exec_queue_to_guc(struct xe_exec_queue *q)
>> @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>>  	u32 slpc_exec_queue_freq_req = 0;
>>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>>
>> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
>> +		     !xe_exec_queue_is_multi_queue_secondary(q));
>>
>>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>> @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>>  {
>>  	struct exec_queue_policy policy;
>>
>> +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
>> +
>>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>>
>> @@ -575,6 +579,130 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>>  			field_, val_)
>>
>> +#define CGP_VERSION_MAJOR_SHIFT	8
>> +
>> +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
>> +					       struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	u32 guc_id = group->primary->guc->id;
>> +
>> +	/* Currently implementing CGP version 1.0 */
>> +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
>> +		  1 << CGP_VERSION_MAJOR_SHIFT);
>> +
>> +	xe_map_wr(xe, &group->cgp_bo->vmap,
>> +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
>> +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
>> +
>> +	xe_map_wr(xe, &group->cgp_bo->vmap,
>> +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
>> +		  u32, guc_id);
>> +
>> +	if (q->multi_queue.pos / 32) {
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
>> +			  u32, BIT(q->multi_queue.pos % 32));
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
>> +	} else {
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
>> +			  u32, BIT(q->multi_queue.pos));
>> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
>
>Maybe some defines for all these numbers (16, 17, 32, 33) in this
>function? Or some comments? It is very hard to look at this code and
>know what it is doing.
>

It is added in the kernel-doc patch below.
https://patchwork.freedesktop.org/patch/684846/?series=156865&rev=1

>> +	}
>> +}
>> +
>> +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>> +					     struct xe_exec_queue *q,
>> +					     const u32 *action, u32 len)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	long ret;
>> +
>> +	/*
>> +	 * As all queues of a multi queue group use single drm scheduler
>> +	 * submit workqueue, CGP synchronization with GuC are serialized.
>> +	 * Hence, no locking is required here.
>> +	 * Wait for any pending CGP_SYNC_DONE response before updating the
>> +	 * CGP page and sending CGP_SYNC message.
>> +	 */
>> +	ret = wait_event_timeout(guc->ct.wq,
>> +				 !READ_ONCE(group->sync_pending) ||
>> +				 xe_guc_read_stopped(guc), HZ);
>> +	if (!ret || xe_guc_read_stopped(guc)) {
>> +		drm_err(&xe->drm, "Wait for CGP_SYNC_DONE response failed!\n");
>> +		/* Something wrong with the CTB or GuC, no need to proceed */
>> +		return;
>> +	}
>> +
>> +	xe_guc_exec_queue_group_cgp_update(xe, q);
>> +
>> +	WRITE_ONCE(group->sync_pending, true);
>> +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
>> +}
>> +
>> +static void __register_exec_queue(struct xe_guc *guc,
>> +				  struct guc_ctxt_registration_info *info)
>> +{
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_REGISTER_CONTEXT,
>> +		info->flags,
>> +		info->context_idx,
>> +		info->engine_class,
>> +		info->engine_submit_mask,
>> +		info->wq_desc_lo,
>> +		info->wq_desc_hi,
>> +		info->wq_base_lo,
>> +		info->wq_base_hi,
>> +		info->wq_size,
>> +		info->hwlrca_lo,
>> +		info->hwlrca_hi,
>> +	};
>> +
>> +	/* explicitly checks some fields that we might fixup later */
>> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
>> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
>> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
>> +
>> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +}
>> +
>> +static void __register_exec_queue_group(struct xe_guc *guc,
>> +					struct xe_exec_queue *q,
>> +					struct guc_ctxt_registration_info *info)
>> +{
>> +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>> +	int len = 0;
>> +
>> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
>> +		action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
>> +		action[len++] = info->flags;
>> +		action[len++] = info->context_idx;
>> +		action[len++] = info->engine_class;
>> +		action[len++] = info->engine_submit_mask;
>> +		action[len++] = 0; /* Reserved */
>> +		action[len++] = info->cgp_lo;
>> +		action[len++] = info->cgp_hi;
>> +	} else {
>> +		/*
>> +		 * No need to wait before CGP sync since CT descriptors
>> +		 * should be ordered.
>> +		 */
>> +
>> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
>> +		action[len++] = q->multi_queue.group->primary->guc->id;
>> +	}
>> +
>> +	xe_assert(xe, len <= MAX_MULTI_QUEUE_REG_SIZE);
>> +#undef MAX_MULTI_QUEUE_REG_SIZE
>> +
>> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>> +}
>> +
>>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>  				       struct xe_exec_queue *q,
>>  				       struct guc_ctxt_registration_info *info)
>> @@ -622,35 +750,6 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
>>  }
>>
>> -static void __register_exec_queue(struct xe_guc *guc,
>> -				  struct guc_ctxt_registration_info *info)
>> -{
>> -	u32 action[] = {
>> -		XE_GUC_ACTION_REGISTER_CONTEXT,
>> -		info->flags,
>> -		info->context_idx,
>> -		info->engine_class,
>> -		info->engine_submit_mask,
>> -		info->wq_desc_lo,
>> -		info->wq_desc_hi,
>> -		info->wq_base_lo,
>> -		info->wq_base_hi,
>> -		info->wq_size,
>> -		info->hwlrca_lo,
>> -		info->hwlrca_hi,
>> -	};
>> -
>> -	/* explicitly checks some fields that we might fixup later */
>> -	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
>> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
>> -	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
>> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
>> -	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
>> -		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
>> -
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> -}
>> -
>>  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>  {
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>> @@ -670,6 +769,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>>  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>>
>> +	if (xe_exec_queue_is_multi_queue(q)) {
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +
>> +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
>> +		info.cgp_hi = 0;
>> +	}
>> +
>>  	if (xe_exec_queue_is_parallel(q)) {
>>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
>> @@ -700,11 +806,15 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>
>>  	set_exec_queue_registered(q);
>>  	trace_xe_exec_queue_register(q);
>> -	if (xe_exec_queue_is_parallel(q))
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		__register_exec_queue_group(guc, q, &info);
>> +	else if (xe_exec_queue_is_parallel(q))
>>  		__register_mlrc_exec_queue(guc, q, &info);
>>  	else
>>  		__register_exec_queue(guc, &info);
>> -	init_policies(guc, q);
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		init_policies(guc, q);
>>  }
>>
>>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>> @@ -833,6 +943,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>>  		return;
>>
>> +	/*
>> +	 * All queues in a multi-queue group will use the primary queue
>> +	 * of the group to interface with GuC.
>> +	 */
>> +	q = xe_exec_queue_multi_queue_primary(q);
>> +
>
>I think we might need a bit more thought which bits each queue owns in
>q->guc->state. The state machine is pretty complicated and now pointing
>secondary -> primary in some cases makes this even worse. I guess I'd
>ask to figure out which bits a owned by primary, which ones by the
>secondary, and which owns are mirrored and write this down somewhere.
>

The way I thought about it is that all queues (secondaries as well)
will have all the q->guc->state bits. Though we will probably short
circuit SCHED_MODE setting for secondaries and trigger cleanup of
secondaries upon primary cleanup etc., the bits will still be valid.

Niranjana

>Matt
>
>>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>>  		action[len++] = q->guc->id;
>> @@ -879,6 +995,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>  	trace_xe_sched_job_run(job);
>>
>>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +
>> +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
>> +				killed_or_banned_or_wedged = true;
>> +				goto run_job_out;
>> +			}
>> +
>> +			if (!exec_queue_registered(primary))
>> +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
>> +		}
>> +
>>  		if (!exec_queue_registered(q))
>>  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>>  		if (!job->skip_emit)
>> @@ -887,6 +1015,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>  		job->skip_emit = false;
>>  	}
>>
>> +run_job_out:
>>  	/*
>>  	 * We don't care about job-fence ordering in LR VMs because these fences
>>  	 * are never exported; they are used solely to keep jobs on the pending
>> @@ -912,6 +1041,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>>  	return atomic_read(&guc->submission_state.stopped);
>>  }
>>
>> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
>> +						    struct xe_exec_queue *q,
>> +						    u32 runnable_state);
>> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
>> +
>>  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>>  	u32 action[] = {						\
>>  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
>> @@ -925,7 +1059,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>>  	int ret;
>>
>> -	set_min_preemption_timeout(guc, q);
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		set_min_preemption_timeout(guc, q);
>> +
>>  	smp_rmb();
>>  	ret = wait_event_timeout(guc->ct.wq,
>>  				 (!exec_queue_pending_enable(q) &&
>> @@ -953,9 +1089,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>>  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>>  	 * handler and we are not allowed to reserved G2H space in handlers.
>>  	 */
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>>  }
>>
>>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>> @@ -1161,8 +1300,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>>  	set_exec_queue_enabled(q);
>>  	trace_xe_exec_queue_scheduling_enable(q);
>>
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_multi_queue_secondary_sched_done(guc, q, 1);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>
>>  	ret = wait_event_timeout(guc->ct.wq,
>>  				 !exec_queue_pending_enable(q) ||
>> @@ -1186,14 +1328,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>>
>> -	if (immediate)
>> +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>>  		set_min_preemption_timeout(guc, q);
>>  	clear_exec_queue_enabled(q);
>>  	set_exec_queue_pending_disable(q);
>>  	trace_xe_exec_queue_scheduling_disable(q);
>>
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>  }
>>
>>  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> @@ -1211,8 +1356,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>  	set_exec_queue_destroyed(q);
>>  	trace_xe_exec_queue_deregister(q);
>>
>> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_deregister_done(guc, q);
>> +	else
>> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>>  }
>>
>>  static enum drm_gpu_sched_stat
>> @@ -1660,6 +1808,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>  {
>>  	struct xe_gpu_scheduler *sched;
>>  	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct workqueue_struct *submit_wq = NULL;
>>  	struct xe_guc_exec_queue *ge;
>>  	long timeout;
>>  	int err, i;
>> @@ -1680,8 +1829,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>
>>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>> +
>> +	/*
>> +	 * Use primary queue's submit_wq for all secondary queues of a
>> +	 * multi queue group. This serialization avoids any locking around
>> +	 * CGP synchronization with GuC.
>> +	 */
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>> +
>> +		submit_wq = primary->guc->sched.base.submit_wq;
>> +	}
>> +
>>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>> -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>> +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>>  	if (err)
>> @@ -2418,7 +2579,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>
>>  	trace_xe_exec_queue_deregister(q);
>>
>> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		handle_deregister_done(guc, q);
>> +	else
>> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
>> +					   ARRAY_SIZE(action));
>>  }
>>
>>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>> @@ -2468,6 +2633,15 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>  	}
>>  }
>>
>> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
>> +						    struct xe_exec_queue *q,
>> +						    u32 runnable_state)
>> +{
>> +	mutex_lock(&guc->ct.lock);
>> +	handle_sched_done(guc, q, runnable_state);
>> +	mutex_unlock(&guc->ct.lock);
>> +}
>> +
>>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>  {
>>  	struct xe_exec_queue *q;
>> @@ -2672,6 +2846,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>>  	return 0;
>>  }
>>
>> +/**
>> + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
>> + * @guc: guc
>> + * @msg: message indicating CGP sync done
>> + * @len: length of message
>> + *
>> + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
>> + * for CGP synchronization to complete.
>> + *
>> + * Return: 0 on success, -EPROTO for malformed messages.
>> + */
>> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_exec_queue *q;
>> +	u32 guc_id = msg[0];
>> +
>> +	if (unlikely(len < 1)) {
>> +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
>> +		return -EPROTO;
>> +	}
>> +
>> +	q = g2h_exec_queue_lookup(guc, guc_id);
>> +	if (unlikely(!q))
>> +		return -EPROTO;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
>> +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
>> +		return -EPROTO;
>> +	}
>> +
>> +	/* Wakeup the serialized cgp update wait */
>> +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
>> +	wake_up_all(&guc->ct.wq);
>> +
>> +	return 0;
>> +}
>> +
>>  static void
>>  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>>  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index b49a2748ec46..abfa94bce391 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>  					       u32 len);
>>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>
>>  struct xe_guc_submit_exec_queue_snapshot *
>>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>> --
>> 2.43.0
>>
