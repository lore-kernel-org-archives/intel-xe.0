Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0BACAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 14:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BC710EA6B;
	Fri, 26 Sep 2025 14:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFMeGOtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E564410EA6B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758895299; x=1790431299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZPE6HfbuLt0lyQWKaJgOVkxlLBypyGF4q2GVlZu2+N4=;
 b=SFMeGOtq7HhydxIuT7TBTcBuHOr6QTlVz/Hzr6XfDN/TNGeOzvJy/Uqf
 8Hg9Kyl2EHb/NpHpLvVpc3+YB5jeMwpszqN7mLyaFIrv/T5CqOcS0Z/u9
 +N+AVpFMRrCBICf9x4ujMlrEPg3wOmTqGSi8T+twLajTuyn0XSxUkJa38
 OI0vEsfpp+8O5KHhjUQgC7b/PBLaW+FdB+obWyH1FllYq9alVwDce7TxT
 fYdD5K4hbIGCyfAMrH8tRW1Vsiz30Xtmg22n3FDmKc60f/ZXHCpmnzJR5
 EZfySsrl5o1XypnfLtpV+VbXWeLrTT37/vmWWfGRkJCwd5v2ZsQK1CTWi w==;
X-CSE-ConnectionGUID: tJ6+F0iKQgyec/694F+xtQ==
X-CSE-MsgGUID: xDZn2xwhTTS7W4AOFtooZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63862184"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="63862184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:01:38 -0700
X-CSE-ConnectionGUID: 0E/ikzhIQoKyFv2FlT6M+A==
X-CSE-MsgGUID: o/rBO2wGRkeXK905Tr6xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="208370687"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:01:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:01:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 07:01:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjQVerJVftYnf/mFH/HBh/WhiJ9qI3fexknSrrOtRzXR0N6m6nR577cJeTJ2iVHciSvAbpG3/5xH/CIAvpDLB8RGw/x6JnGKWynhGoGbZgUivwKSnSOwgXOArT3+IYca/eECwZpae04sdwqffOL0TSj0GdB7OzxWJJmAyZd71UPV79sGy7a/Wb438LrFWd05ghSf0kCOtN4Y3syLHc+qDXWccGYGMh61wP/geAgJAu18n1Q3Pu+PCEKktyBRhxy3VIjf7qJyJ/TUzwGZFIKMtgyXTVDTchmOA9Iu3Xq+/zGda314BUD8paEMvkld8NBI5WWLNdTYA8DNXim1veinOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPE6HfbuLt0lyQWKaJgOVkxlLBypyGF4q2GVlZu2+N4=;
 b=sxqjZrfYJBxbaeRU8mvMCEGhQqUtGn78034zuWs36kqaDS/KlL/Abvc5VoB6WlC9PdXbkrv+IRCIw2D7BJQIpyxnMo0as+pCkYpVcjV+q+I4oF2/zfbLNfgWtnN0wjBwmyGWy1HCpMjEdOCaSqA2cuYkYNKXbBwbxYYcfawMOW0c4MLeQqQmfuemrZ0LIPwSIfTyCZhddY1icQKAigSqLLUrbDA4dK9C4WOtuiImSxaHan4h547hRCtXNHvj7dX0UtEe4SlMQ2MCh20h11HZIUXx0K/z4bxNDwGNlkWOOpiJArJCXo+UUnAxLQtYCCz4aM6hUnh6q42vBax8r2DS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 14:01:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 14:01:33 +0000
Date: Fri, 26 Sep 2025 09:01:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/6] drm/xe/pf: Promote PF debugfs function to its own file
Message-ID: <srrzydg24gfw22z6udqia6fq7nrfvet6h4zlro2vdu54okdg5m@37czq6rphiuw>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925220425.196860-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ac820c-05eb-4ed0-3f59-08ddfd0532ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i0b4wT6odSLBzL8vjAfIvjOp4VrwCWu7xtKmPgZRxbatoTBZ+JsDbX/lD0Up?=
 =?us-ascii?Q?lBQFcYKWj59sysWLEJqAahupYXSaPyPHa1WWlIVIKZV8Xeyf9JgGDpq8dLG4?=
 =?us-ascii?Q?X8JepzXq2Yl+3rUQ2vIiWkXavBp3TG/J2o1xIOC0OATQsX2Z5T0f3qwamr85?=
 =?us-ascii?Q?YEA58854aJeDA5BzTeiiOrroCJiT6W9hOtV3jHjcamGs7rKdF/vJ6G6wQ/I9?=
 =?us-ascii?Q?NBx9/2ux6RH1V40kBkewJi4TfS+OmdNG4EgMFdPFJunbIJ/BvQZupm4+mM5E?=
 =?us-ascii?Q?yKq5zzzaLvLUZa8cqhc2c4ik9U01Bhn44ch5NApFC4RAgh1PyfVLK8gN/lRY?=
 =?us-ascii?Q?8QtAPQY9JxkuVXokPiI0lDbbjPFJp9CNM2reuQq2CtN3qiuFlsgpaNWIxeWJ?=
 =?us-ascii?Q?ML+kRr7ORzvEqDBaJNKSSEh7XxXmNj8eK9zC+iAh4vIBVbo1gGlP7gt82W0e?=
 =?us-ascii?Q?g5PCba6QWhInfnIvt8e3KvZhwvpVTng6QTluHWRG9XAkb0BiBmwOelgpNDaC?=
 =?us-ascii?Q?1qKo17JKsHXGvfWLqAGWukdvULHYodnd2o8bNHWDAGCmiB97VhE0Eyyf57iv?=
 =?us-ascii?Q?LfaXKd8ubn2UWu4b2QHPlKnyRo1NppJ/xRV6xMDKuRXsqngioXFvnbWhNuZk?=
 =?us-ascii?Q?A1QkFd2p3K/0vTkmVWOfqXKjUCRt90kcLnjA5Wesp40LhsFIEELHZTNEGGtB?=
 =?us-ascii?Q?StRsdgatpdRaWD6eH7q3yHzwgEKEscqlsBcE6JRAvHvkyAakpjXjGxYo7waS?=
 =?us-ascii?Q?Uc7H4LcBgtrLZ5uXbt4p6RNX6C4WgaFp3I2CDeu5T3w1WTuyvGDaWT10eIpc?=
 =?us-ascii?Q?cO7iJycalPyZrx3jX97zpa/BcCy8m/uCgPb0aw9DFyQHxll0hX2LRkoFjwH6?=
 =?us-ascii?Q?MmqZxuWCy+cQMh5uHjR4ZiIjJNn/5/NUjQeQUmycA+O4JzGOm93KXa0jUoHD?=
 =?us-ascii?Q?CJPF877sFTo/Q83NMBpkbr8HRMRUkRLCtp4siFP65ycd6kus3VlysyK6WaL6?=
 =?us-ascii?Q?HdZItUN+tbFRiXsyZcXtW4w+IdA8BTvrvgrysXejIxBWSuAL5mRMMH+luqov?=
 =?us-ascii?Q?T6lqrLOnS86HsZ2y5JTgK4fygCHvtb3EkI9tBTdh1lO8antoq4vQMDvrNFT1?=
 =?us-ascii?Q?LbAGh0pQocwV4NBsOzoucfEdLC/KRwKdbQIXfS2oxLufxGbVX2tvwfRrOE9L?=
 =?us-ascii?Q?LaoBRVQenq8uDbIjfUBDVQlKyBWd+GrwM5GP/i+HDtIfdlE535WyWba1KaXa?=
 =?us-ascii?Q?+y3c5wBlsyKNwoXCzoHPr6CBXFJSMc14SU6qLqNPCj6vYtWvdW4VGE1X2+fT?=
 =?us-ascii?Q?0Lg2MT5hiqdHG3jmJLF6t+mjqXgw47WqgVIdH7CH1S9if7tnEm+oxEqMFw7D?=
 =?us-ascii?Q?noy4sB/INpRtNlFJ1yEHCgDgXwiDnHSfsIbXQGbmtA4WT+ml+Whn9mD3neS1?=
 =?us-ascii?Q?futBagBYVY+6r52OKeiGHfQPDv+z1e5o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kBx2O1fxevXatpZpDSg5RsmzD96ql5lIrAol2jt0dGKGFCYmGiAjYlYfINpj?=
 =?us-ascii?Q?Q4RbyA9t7PJbquOI1cO7i4p6y+S8+DHGk1vP8A0VUbutigBqxM0dQUTQ7BTH?=
 =?us-ascii?Q?kKZGBHzXF5O2e3PVeNvIVwBB1ZQALRHeHmmq00iPD4CgV1maZQINyY9dP0+9?=
 =?us-ascii?Q?zi4JlPDw6rmYSQwdjZsq2LGd6laoLuKsvq8X6M2mxN08hDU/lKCQU9XIRyU1?=
 =?us-ascii?Q?weYJp/K+U5sI/AxHcemzgoSq0vuFwczNt7WC/6FeZH/GxRiEhiXjxHsw3Pin?=
 =?us-ascii?Q?JD1+5d3p12RlQC6SPW5DWNzjcZ6juauVfKQf1kF6uZY9clDzxfYtFD8pAlWd?=
 =?us-ascii?Q?zLguOf4Bg/fJ85F7RHWSKjFZrrsmnqzwWIPKjGKhbkdmeP+XTmplu2dcaESL?=
 =?us-ascii?Q?Xyjx5ijEVCjMLrfwerMtD1Jz0Ijq91u69B9BrXFnUWjOtwJP37H/EkeQyMxC?=
 =?us-ascii?Q?pjwTyxGcFQI1tlRLXxKJAqLUr4OvD/eWct0tcABSz3BbyhAjwThDxVrjld8V?=
 =?us-ascii?Q?zZkWjwFixpJ93XPjvQNg8K9p4j7kkjl5JtpnXCdm4Awaf3RFMMYksOWvecql?=
 =?us-ascii?Q?3BJ5zAJCoQ8hDli2gKjB1kCBm82QN2FHXiM2cOgOOU1hBLiPBBmvTgyAHaIt?=
 =?us-ascii?Q?DCRTMoOZXIaG7aMAcNpF+iSzsZlERitw8xzKbuG6g7tiypAbgTE0YevSXGwI?=
 =?us-ascii?Q?zijUQk5wOY2woxvwXr3QNg+VsYVCA/aKe7xjIh8XcvRlsoSFMv9/EI3SCISK?=
 =?us-ascii?Q?ir8CZ/BV/Z2faZ+X6Zs1bkPPDLeRvEBqEkcPXI0qSNbca3c1bFvJC4JbEpYc?=
 =?us-ascii?Q?JJ1NcZF9CQSj4YWEQMVTykX+dH/iD/aTVit3YAtrY0mymNqnuG/qItPG2gw9?=
 =?us-ascii?Q?PaNwTu9aR629V9hwIe7O7f+P0TmMYSmkLtlajBEjRSZxy7ztqUL7SE7BEK7i?=
 =?us-ascii?Q?f8xFVSowH7V3u6na0myHI0NUA1aIYvW8/we9a2IPk0q3dC8IeQDYr/0Hyza+?=
 =?us-ascii?Q?9K1ZXt8ljuxXb2R49wRB1ATnRl1N+s2vJ0BF3EBzyGEWx8s+vmrvcp8KTe1q?=
 =?us-ascii?Q?0XHiYdtdlvzp/Lel6LMcR18aAhr3feG41k4YZa12SFlNvf9d3XWLyn37Osb5?=
 =?us-ascii?Q?7bua34/IJZxen6M9xoZ161pw4BmkvWdBjNsGF8LRp5AByz3M8iMREMCz27A+?=
 =?us-ascii?Q?GEu1MuSOUHKCli2SaS8A7holsQFmtUwEIG8l2blr94CUqOy63CDqwLIj6ZKo?=
 =?us-ascii?Q?r+8fa42pvvekCWgKgoeSQOcdatIPIK6otEWxy5N6t0KkNQl3vX+Q9IsEkslA?=
 =?us-ascii?Q?NwFAgoiC3ign/8yuxt4b59qDnXhA81tS4+36FzwSjqxcUaS7JSrzUiVKO4l9?=
 =?us-ascii?Q?cU4nKl2o2SH1Ywf3V7eZNvcCZiDzB0oNgCfSldmi0TU0W+vQscWykmK4FFYr?=
 =?us-ascii?Q?NX9kFw30juEOFgWr5kvMOJ0igpt5bSNeAFNWbUS3uq0xZOtiDGfkgrLy6Og2?=
 =?us-ascii?Q?df6URZojhXC+xju6DShoPx6R51DW99vp+efm0HhKUj+PrSIL/7+o7+ReRt4J?=
 =?us-ascii?Q?jSn40UNbzb+cD5zictvUU+xuEf3WIgRaAI+6LODktIozKUNS7bVkLiGcYBzh?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ac820c-05eb-4ed0-3f59-08ddfd0532ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:01:32.8150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suwdCuVWDROv/NgxCVdqtlQFCK0d3OcFzY9UjpnDLII2QNvI/bL2d10wtS6DVdfnnY9JRWny6RDyLUxX5/hwTenhQnPvxrVqITrKANQ5Diw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
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

On Fri, Sep 26, 2025 at 12:04:18AM +0200, Michal Wajdeczko wrote:
>In upcoming patches, we will build on the PF separate debugfs
>tree for all SR-IOV related files and this new code will need
>dedicated file. To minimize large diffs later, move existing
>function now as-is, so any future modifications will be done
>directly in target file.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
