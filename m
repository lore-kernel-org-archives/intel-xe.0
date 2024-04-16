Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F9C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 17:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AA010F21C;
	Tue, 16 Apr 2024 17:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJvQTote";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F61610F21C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713287203; x=1744823203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cJyGw0XSaNYHe34/y8RnmLYwWWsaqaKBl5rFwYhxK6o=;
 b=gJvQToteZPESfdZvaVx2JnIc9FG5TRYb2yxM51TRzqJmVpLBSC9lTK1Z
 nIjWxfbM3lSshaTs6sEXDfERODmRl25zgWE9k3XjkbuIwp8BnywbR9aGT
 aIhstkMIM21uTfuiK165U7bBkrLCe/e9U/+Ed0YecQajv6coUioRIVd/m
 ruQSZvf2YZDAoL1h0ew/H6zmBBS4IIsSXEvQqzmmFHC2yU+WwO5XhfeH1
 k5bzIuU502TOOS9AMCSyLTcjSjeyFePmohwdj/5dw4lK5Ymxgf9kndbbx
 oc9VmFiWW30jBuOiV1U6NyrPC3mHgHDR+cwL7zXfrN/IdNh+XTBan2Dgv A==;
X-CSE-ConnectionGUID: JYhnWAylQbq3eDvXywZMxw==
X-CSE-MsgGUID: 0iSUqRgbQgmhX6aqbFb2Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9293916"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="9293916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 10:06:36 -0700
X-CSE-ConnectionGUID: bMHlrcG1QwaClSzXtg+MUA==
X-CSE-MsgGUID: 0At21kn1QxGSu6qlD92K1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="45612896"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 10:06:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:06:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 10:06:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 10:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOWDgcp0jsuI4dvMrs8z8cpkP/I8xEcQCn2UW8d/9nlnhheZB2s+N0ZaNMDXmVB1USWOvNKte3uSarvVNvTSVDJuSD6w+doPWtCVU143QU9WVY9ClHRK9R9x6DQYVBU41l0m3wAgMNn/bsiudPiON0QayVHKBO7N7VE1Z/YSaHAJqYKMRYveA55RoLBvhHOlBkYXXO9aw/UDApM/bamQ3Y9csXDIlpzhYEXDt1LIRHrMWm1YLZamg8xFCUYyCvtpfAAfwV3GKWNnTxzp5NGoVaXzrBbpYgsNmz1DU13xxjFuiD0VxE5PGg0E4k4mRv42lU11Ehb4MNadAS+HFreLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXehJwKxqdVpIFF/Hbcu69Bz8aY1JU/vQCgPKphFHcY=;
 b=oZYRPHrUjyV6CiksclsK5P3mKFRdKpCWvhRgpEBbxs/hrlz0nSSzLBkBaCbYRuSuK3vyRpPg42VTObhcIOsGmYhU7PFMBeJ75Y+SAEB1fHeMjX0ZJq/EM/xyxf/WYz7EpQp3uPimlZxefKDhKvH/+2eajwTu+kdaI6WfcmMXXDkI5jZYdzgttJvL5hE8Ezzh0hsQVOYxJSyrG/h0lw1EWZ62TfNEKdChWuuwqjPfvwWhY8cpA53sia8lT1co/2RFSigmrxmbGv2wyywxiI4NaPX3MZaA7MD+UY/+vFA+RhBVyVBKrx6xGbGiiumi3PjXEt+Wb7aTf6j+hGH/TpiskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 17:06:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 17:06:33 +0000
Date: Tue, 16 Apr 2024 12:06:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Message-ID: <mqv4yxfwdftxjzyps47xqdtdsdssls2f2ygrq66emna5nqpxvv@vwqi62ksly4g>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240409221507.1076471-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 774f2485-b63d-44af-f079-08dc5e37914c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ueJEyBCYihTqTrknDduIN88XtUafSpSjdlz4gVrTABslEKba5PK/4nC7p5FnIB4myLRXmrWoQL2TUZimZ99i9LCS82NEf83gFa+kVVRj0Jl7dQSy5Ff0e2QSn/uUiVO1w6CfJmH96rGDXJrpxfNRh9jpw/sZaDuM8j39H73OWu0ybueKnZeScJ/XIFZHAnE/fJ6qBdOg5ieGcsXgKhT6QsscObTGkH8k+PRFD3mXayVgraudnrFxZumWl0Up6rIS9D56talZO0ERYrpvkA55q3oYIpqrsp3VU3AJtkA5Co2sWJjcLrMaoiksZ/319SznRMJo0I8YJPmTMCpjQhqE0IceQQ/n39Yub/6Q47lFIuSb58KExEapKXYJBdmfoGx2ecV0sMHnn8O+SLE8mSXhUESs0K6fBd2KDi7aCfc9PltfBiCx1sykf9u7Q+n2W2JFhKpImbDEiz/j48ngMqmfk6DId/3puAXN6anEaJXP225SEjSH67lfJXZBYU2myq6f56eWjQs2sKj3oZYjqHqiSP0MussccKsvOKsaCrGTyajHFubT6Yrs56OzzOqSKnMylhA0jFKpJeT29dCQ8VY+auoiLD4PvxevAMGoiBpuMiJX6qtWmg0TJgHJF4yQI1DKGBVoib0wjKIj6wCw4p3bMLtulHvROVNGO1HRIeUlX1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Q7cvdv5gOH4FGGmFK1c4FVSdheYtCL6H0gQ7ZLqaXnnTeoF1HGHm8KWuJiL?=
 =?us-ascii?Q?tp6GtTz3GVJ7tx4wjDOQFkyK1+ZWXUcRp2PK5sszYjYWQZ6R96LjPI0LpmLP?=
 =?us-ascii?Q?wSpyF4pL8Gte0StxTuAs/Cwn1oJkWXq1J9/YHAtphOYQvHXvD3ao5LO0v9/o?=
 =?us-ascii?Q?kPkpcrxVm0fnXgrJ96x2FlqMRyaeKgxWxAyOjZtwpMhYmLLzSEGRp0tVs2cG?=
 =?us-ascii?Q?ieE3dbjaVcU3RdsfVTWcFO2HaR1y+PoSHq1aNZA5+QfT+VNzKBm9rIwYvbNv?=
 =?us-ascii?Q?0xLvgfeXA+pssIwplCl0kZgGA9rDno492vqXKdzjRzVbmSuwF4/FY4Mq4PkA?=
 =?us-ascii?Q?3ut5Gxhv/aO6rhZaPSrnG/yo5Wh7iPzYlbE4OkMlgNcppaywPdskN5QjG66M?=
 =?us-ascii?Q?d9Brw0F9+7C1szkCPq1x+pojI+nVrYM72hcOVjtw3DlX9GSRYPnRHx/XK3jt?=
 =?us-ascii?Q?zkYaCF3Mm2cZ/LK/mRQ0LRVpRQHNKwd6yTAY8fTGQF6Uxve/6XloA1Dfqrga?=
 =?us-ascii?Q?jdEtgbjM+vgwQAAa3ARxS6gxEe3/msO38RviXmOH5ehKM1X6Hmp+uu3+QOeF?=
 =?us-ascii?Q?CgiKOve6Bm1qUL1W9W/X4MqXJv7ihoMF1utcE2ipSlRnKzuHcaZYuNj3+ozf?=
 =?us-ascii?Q?YwRXG932yuSQvtNkUnl0MDIeq0zWib9XtAIfWDk9Q1wWrGEvgS5VivzuN2dV?=
 =?us-ascii?Q?MJ4YPsmP+z/1F33j84y7msEcZFNJk593nz0kCRvTH8olKHw844d+vhEaAbeo?=
 =?us-ascii?Q?sEqR854XYKTwEAWbQk7cmSilfbuIw0zdmR83MRzQ8wPtcAXxiHJqPtIYmuvG?=
 =?us-ascii?Q?8NXlc7l72ElGk4Tf+DzRwzD88ZxmRuMhbIqVLPM9F5dmjZ4K2q5lsLAphwl9?=
 =?us-ascii?Q?TexKOAtZRI8Vi/Aqn+qon8pedm/+WykfF+9pDLe4Vnn9pp3vYQ5Pacdd3gl/?=
 =?us-ascii?Q?RTsb8fmbgCe/ri8XUFW1BQvS1o3/7fHrSKFFtYDys/0qMi213lWfLTE5HpBf?=
 =?us-ascii?Q?58rWA+ov9nEcJM4zN2870lHZ+el4l/8kjsPGbs7Tw/LRW5sbrAljZOE5N6Y1?=
 =?us-ascii?Q?eiUV6OJkJcjLnxa5WJS6gaOK74t+vPWvDuvSTrXINBEDC94wbZXkc2DNGgm3?=
 =?us-ascii?Q?U20r7kD/MaYeNqUGfi6TflTD05yILnR97TfaQqlb1egz5JF//N45cQHoDLXD?=
 =?us-ascii?Q?uIo46bcozTRVDuDxxyLKSwj6w2pt20tha4LGEMey4FHESWCJLVLiCl+V1BNZ?=
 =?us-ascii?Q?D02i7JmgVW3T3utdyuDwXH4qRtje4QasJRful9GrJ0TJAryv+H3bMBJUnQ6G?=
 =?us-ascii?Q?iECH7/zpzK7rBBk5lbnPhDrnZs0wKc/4V91G0HFaJtMvWd0sqEDCe2NRkbdw?=
 =?us-ascii?Q?M/0CGSyFlRje7OC5FDzRHjk0IcrfT+gPFC+wKerGE/i0XHt9pBcUzVd5Ft5H?=
 =?us-ascii?Q?f9RpjEiK68g+9B+t+ZB/Mxk05Jgzr8US1Ql53840LZaEsyC/G+ld/Ru4BCN9?=
 =?us-ascii?Q?uDPc2rVK/tNISie+PjOsXE65Jbpq4SCrCkrseVyyiWEDnS19c5136uTjMnNs?=
 =?us-ascii?Q?Zf+ZQSMaVgVOIVtL7BFwwDZIZvLIEiVae+2q5mD/wEXI2orkFgXZhFp/EufG?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 774f2485-b63d-44af-f079-08dc5e37914c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 17:06:33.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huJdexRbSLBPW0mk7v99yegrzVdLxMScZ/58p6WE2PxOCXKn5RawlsEzMndxUyGdYTHdJHq3GIcsa087fWO2UOnUBtOjUJ9eEDta9WgHkzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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

On Tue, Apr 09, 2024 at 06:15:05PM GMT, Rodrigo Vivi wrote:
>Let's block the device upon any GuC load failure.
>But let's continue with the probe so guc logs can be read
>from the debugfs.
>
>v2: - s/wedged/busted
>    - do not block probe or we lose guc_logs in debugfs (Matt)
>
>v3: - s/busted/wedged
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
