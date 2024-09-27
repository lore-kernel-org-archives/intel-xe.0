Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452B7CDD1CE
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 17:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6010E1C9;
	Fri, 27 Sep 2024 17:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dibAtTzR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85D010E1C9
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727458685; x=1758994685;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8L8H+TfNMwS0RyFqpUNed3R4PnoBUwRQuG/CVr9EfnI=;
 b=dibAtTzRXREpZNiPN67NXsSAggrENHudoPJbf34Rrr0gwKLxxAzU/3yu
 0LpoBX9+MYhUDQM8yECHwcEtneeu52d+AYkR5BcD8LW96SZKMh2s5mYMm
 ysxyST0MJJdvs94XGAjrnSy/IT7KfXSy7GjDWr3eZ1X0C8RESBiq5cvIA
 eVSOmEJhJ1A8r/5mET0O0aeLBeTCLFGvnUGbhlM/vVMtJ46ZYIl5vRRVr
 sDO/Z+dDZg2ncHqwLAkosvfmdjfvG36P18lRWJjWJvpy5bBhTOzXpRBZo
 kjwi3Eo/Z3WgloCMvkyBzocQsTI3ZghwEPzRI57ZGoF/G/H1FK1KR903g A==;
X-CSE-ConnectionGUID: J7te4Pw+QEO6pMVvXWnzOA==
X-CSE-MsgGUID: 1RvDpuVlRgaO9dMD5N1aJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26122896"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26122896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 10:38:04 -0700
X-CSE-ConnectionGUID: 6qHJCHqmRdiTa5t2syvSpw==
X-CSE-MsgGUID: i7LjVrVZSZyHcPBY8uONUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72180644"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 10:38:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:38:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:38:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 10:38:03 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 10:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4GUsypEcdaTPVKJX1hWBsfvA9eIP+jMloynEX9oSzm25kWVksgBIlt7oN57HaHjEg8sO/pVqOEEp1mVLX4un6bpexYnx731XZNF1odpojmb5iys+jThkxdgzIhSyfhFGJM06GDczH7CVhE+r969ocZsPYqPh1R+xM2y1KHR6X3LgM4RFr99XGoepvXRGTyxHacOyuw80OTcUmXV7aWVIvzLMKEWogEXGYwyR44Unfhbwqlefgxn0SaDRYB27zexA/s6CHr1+Nhb0Yu+cC0GkqnuscWruQEnm7jsgW0o3DmzPIbbP3CwbOVUV49Hg/CXLKiKnF7q62LNMZv5jfIaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F9js5CYXqLO+FcpZPPdmZgMYteo7I9vbQDXhYMeRD4=;
 b=CDDpDVmpFMn1p2+M8rvvrzDBPGQAt8V/eQEDGzAajHMd8UhXeooQbdG4W/eoMRHPfO0EQmRTDrCFsZoSU/6wNHIqLNGqFunadG+HRa/p/4oCr9W86vlOD3Nip5fZ6oZYuG3ugtqpgqjRW+QVcE1XOaj731ISR6GIipibSrDMIJHfVxzYVYQo4tSetR2bFt54AviztgAjnCkRUZDvm9etCo4gE4xm8yxGJeSmN8gXHNmrInUO3tqQoHTIwFHBJ82lhJe3DzHJZkjLTWAReNXctYTMOUXa5UtqZ3jARFUR1lG+7wZGSgd3lfVhnQCE9BicYTJrWiBBXXCdQWiQCs8NQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 17:37:57 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d%6]) with mapi id 15.20.7982.016; Fri, 27 Sep 2024
 17:37:57 +0000
Date: Fri, 27 Sep 2024 13:37:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvbtcCe7ZuW_GzP3@intel.com>
References: <20240927151207.399354-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927151207.399354-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0327.namprd03.prod.outlook.com
 (2603:10b6:303:dd::32) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: cb36ed92-b79c-4d9e-ce61-08dcdf1b1fae
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?t+JrdA9njHxIDx3onR3GwlikbV7JwujAQXJ+dlQBgvpxeahw7oMKase0PW?=
 =?iso-8859-1?Q?jy0iddwdp+mZ1j6NLrFT0ozBLBexcZ6gWHepm8/n2KF1Om+LR0UDCChpsy?=
 =?iso-8859-1?Q?IlFbdmBupUmQwV2++Wp8o4rMFcPUiDMSuZhBQoxXPr4eT21mnV2yEQY1tc?=
 =?iso-8859-1?Q?ANyEF2YJexk+MO8gixSTl5n6xJZPROrkpV4fUocXdEG/K9ijUOO2NTT7su?=
 =?iso-8859-1?Q?eBeErqoz+C0fa6YJf5M2zgMKbQ92OZngnsNj9CfGIkj7yufHzaYx8In/O8?=
 =?iso-8859-1?Q?SwpyRoL8IxXwSGS2YPU21SnDWykPCTJCGL7dMEExWCuXgIUzC7QvXDjR7E?=
 =?iso-8859-1?Q?nwAUQloZ8QHA//gDSx0sJISAho2uzfdYA34Tn+jbTk4rApHPzx/mp+/neE?=
 =?iso-8859-1?Q?NChtQ7L9yNVbX1+f5mwTaM6C1XlvUiD315/m+yVMY9/+YaCCvqCPBzyxGi?=
 =?iso-8859-1?Q?hZeC+s5AJCWRpYFWcU1elHhyvm7v+m+jcHIFtJYW8mii5xKZ1QiUqr0rzp?=
 =?iso-8859-1?Q?2oVJIIpJDn00wo8SnZyRFvVUKsv2c43u83o00JNsv/IDRq5PbFX4c3wGAI?=
 =?iso-8859-1?Q?GFlfjRUuq0fxS2j18JZiRfHUmJbQ1A6kdK/ERm1mLNCwxC62sETt2Ir4xw?=
 =?iso-8859-1?Q?hACIki2UUIgjTR+ueMdpsspc7bDEN+bOshmnrf+QuLxcHwlG9Vp+DGdDwm?=
 =?iso-8859-1?Q?P5oPbOlyhbWJfz10CZ20B71lQp/E3UNMNDzzFwFMOWOUsFOamDxySfRcIi?=
 =?iso-8859-1?Q?VwyffQ3Cr/xi8VTeKdi3lBMe/3jsOO8uxpLuTSK/SH42Y4oo3QkqmSMBUr?=
 =?iso-8859-1?Q?FGUvr2VpeJjcokBZ5btLOKlvRn2dBURYJXvKznWjxIzWYvBa33hZdoHpWy?=
 =?iso-8859-1?Q?RIahOJ2fiRuV0QsoRqbbgVbAsW2H5BFSKXPXSUJB7/GHwVcCBbOKk3k4v6?=
 =?iso-8859-1?Q?XThkZoe6OfjAPvleInXOFV1iwxqgEjLiYywB9dwEyugVyUDn8k30aDXIIn?=
 =?iso-8859-1?Q?EklAXlnceJhwzM4tVO0i4naGY5VLC1lvLY3OrJpEAnvOBmNk6FPv+v71A4?=
 =?iso-8859-1?Q?aiwJ5U0Bs9aTRyO3N1oFxwqmat/UWvQNhrLQtJTHkcf+4ueuVuuEOidIxD?=
 =?iso-8859-1?Q?zEuK4MjZmqdgU/qNbtYj/RWgEXIz5pyKOhhJnukULcK5BYXuEkAJb3+RYJ?=
 =?iso-8859-1?Q?m1xbEbO4TozTKRkzu3ZS4ETtVly5pJrrZkPgnVdabcIU53CFYgv0sP8yie?=
 =?iso-8859-1?Q?zaQdy7+wA24hClyipQR7kn/pYsn5/2c/FiT1RAqR7IeWOuD02bHXGmyeGj?=
 =?iso-8859-1?Q?S8Cp6HkEV6ERsBptHy17tBD6fkZEjJX3eVG+iwoz9Ta1gawyD858ex66WL?=
 =?iso-8859-1?Q?bFT7NGQt6ajI9XJD5DUDT0D0/2BfscVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mXM5yKZywwr+fWTnPcLvgKPnQTw0lo7jpp0Wm6klxNyzgSLN45FcydmY2t?=
 =?iso-8859-1?Q?TaGTN22be49/TCIGFQqE6wy4nr/dxpBehe3mMJxXV9UniNM9fM1HUnpRN6?=
 =?iso-8859-1?Q?82N6wCK9ouprNiMTOzlZiTDKD9BZBHGoFQQ2o6iPL82J2A/NA7Ss/L4Kdr?=
 =?iso-8859-1?Q?KFypzD6FAdwhfeTNC9HBq03JH6oirB1eqTXj1kUxtW9KRCE9sGt/OVp8La?=
 =?iso-8859-1?Q?l4UByz4WEO0X8ygYkMCLcgYmw0e8ELF85xV/VA7oVkGgS2GdusbopWxLwi?=
 =?iso-8859-1?Q?L0n63KRjiA7NIzKyQTC1x0HimWD3AYReCxGyLAfu4S0G46pKmCslooe/V1?=
 =?iso-8859-1?Q?BPZvRkZc60HRXXuTi+aO6u+K2L7GlziUHS3h+cpCzMzVLcXF/JeU8anktm?=
 =?iso-8859-1?Q?oL+PJLGNnCoygeSHZfdZk2JOm/k8K+OpPM5uqxVHa0rjbLQuGBgdx1HNRf?=
 =?iso-8859-1?Q?fwIOaBaL2fkhNg4G+3MUcqmwVmd7l+AQMbZ9Ou9281XxGF3eHOK/x1rd2j?=
 =?iso-8859-1?Q?btJVZMkWs/r8Sr3yScQ8313qY+adSUtw4IDIJiIfSSQEkkGvBl8P6lFPls?=
 =?iso-8859-1?Q?39DRWu8hO78TTZieKhuYtPEu9Fm9P8HMJPQpkFBa+jWMTgzT5UvAw5bSrJ?=
 =?iso-8859-1?Q?KyUPuJmI2fcIfC+OWY0hTtU0zul0L8Yan5PCwJmL4hWnHErmYQaaf8qx9L?=
 =?iso-8859-1?Q?dVAKlKj1RRhamZlPtD/DQcgzKXqA5h5aUIm2fMHOOXOr8iN+DejYU759gK?=
 =?iso-8859-1?Q?cDRq/doizWybs5ojsqRdsiTuYgpbopa/DL+yYw8py4FUSvQNJNtWnivTKS?=
 =?iso-8859-1?Q?luyesBI5hgRjb5J7Pr8JfF39fQJ9oiyC5cdWESTO1TG1YvGqXdp/1tUKXu?=
 =?iso-8859-1?Q?y+pRFgJVX9thXelnQpZ9ZCBBBBFK8tttcGBwsSqUmGe7xQFtHghgpBZjYP?=
 =?iso-8859-1?Q?/QIb3fDF29SXhFEEVq8TZhMPLPYt4J04izx6/KJzCf9krLWu5OBdNPK2qY?=
 =?iso-8859-1?Q?V4HHO1c2AqUwgN4LWcMVddFywgd3hn+Uw5gQ79vGCDdWY0DzKHvWf+LUS4?=
 =?iso-8859-1?Q?BedOeu890lacdyQAef0MFQBAyIZE2wHcJBycCSzEZ08jbWGgvuzXwD8gE6?=
 =?iso-8859-1?Q?0R7VhsIZPeLrbAMcK0JKM1YfCAcQKa8qRYUGZOHQfOcSrdgr4Tcg9otjzV?=
 =?iso-8859-1?Q?zePPEupSWb+Odq0G7zPLmZqe/mQRK5swFKuxZmiNb92o+YoMKfcgMP9O8U?=
 =?iso-8859-1?Q?zkO4ZgQk5e2V6zmt6J5A9D4GU7wEQr0F5MUqRl9SsgnmygOV3Q+VIF8YPj?=
 =?iso-8859-1?Q?nZ5ncES3letNbeAXKPfSpZgSBvXPNz6y9/vEJgiGCUK/sY6Os7eQLKxE99?=
 =?iso-8859-1?Q?T6WoyzyQ4qWnyGPxdbxatYpVobjaH9HLUUZtBlhDIpBeayBE22Mdsa3ClR?=
 =?iso-8859-1?Q?wbdNsc42iP/MlmwDKfWKEqMeTD8uoybfrUBsmADNC89C/ZWf702ya7XwtR?=
 =?iso-8859-1?Q?YQHV8VybSkQ0Y+UCQvDB7/IEYmvj2obVZd+e2aHivcmqOP9Reab0pUC5Zd?=
 =?iso-8859-1?Q?LMON2DHP9uGyNV8ZSNizAki+cn+wN7jv1QzzDUlnfxsLkdhjnkPj9C8xrh?=
 =?iso-8859-1?Q?CD3FyXaIEIvGktOT7CXdEuku1UcU9IPsoxtHk947Ks3BPTDw5FwF/FOQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb36ed92-b79c-4d9e-ce61-08dcdf1b1fae
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 17:37:57.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yzLon7LgIBN1/0ohTuEk3hB1zQ7F65MRmBVD9F3N/f76RQ6XrU3LYS13tmewapRQQU2TYXvywOny1JJoopinw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Fri, Sep 27, 2024 at 05:12:06PM +0200, Francois Dugast wrote:
> The kernel fault injection infrastructure is used to test proper error
> handling during probe. The return code of the functions using
> ALLOW_ERROR_INJECTION() can be conditionnally modified at runtime by
> tuning some debugfs entries. This requires CONFIG_FUNCTION_ERROR_INJECTION
> (among others).
> 
> One way to use fault injection at probe time by making each of those
> functions fail one at a time is:
> 
>     FAILTYPE=fail_function
>     DEVICE="0000:00:08.0" # depends on the system
>     ERRNO=-12 # -ENOMEM, can depend on the function
> 
>     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
>     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
>     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
>     echo -1 > /sys/kernel/debug/$FAILTYPE/times
>     echo 0 > /sys/kernel/debug/$FAILTYPE/space
>     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> 
>     modprobe xe
>     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> 
>     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
>     cut -d ' ' -f 1 | while read -r FUNCTION ; do
>         echo "Injecting fault in $FUNCTION"
>         echo "" > /sys/kernel/debug/$FAILTYPE/inject
>         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
>         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
>         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
>     done
> 
>     rmmod xe
> 
> It will also be integrated into IGT for systematic execution by CI.
> 
> v2: Wrappers are not needed in the cases covered by this patch, so
>     remove them and use ALLOW_ERROR_INJECTION() directly.
> 
> v3: Document the use of fault injection at probe time in xe_pci_probe
>     and refer to it where ALLOW_ERROR_INJECTION() is used.

I now have a feeling that we could have a xe_fault_injection component,
that would be the only one including linux/fault-inject.h, the only
place where these wrappers would be declared and everything documented.

I feel that /* See xe_pci_probe() */ everywhere is a bit too much as
weel...

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c    |  3 +++
>  drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ads.c   |  3 +++
>  drivers/gpu/drm/xe/xe_guc_ct.c    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_log.c   |  3 +++
>  drivers/gpu/drm/xe/xe_guc_relay.c |  2 ++
>  drivers/gpu/drm/xe/xe_pci.c       | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.c        |  2 ++
>  drivers/gpu/drm/xe/xe_sriov.c     |  3 +++
>  drivers/gpu/drm/xe/xe_tile.c      |  3 +++
>  drivers/gpu/drm/xe/xe_uc_fw.c     |  2 ++
>  drivers/gpu/drm/xe/xe_wa.c        |  2 ++
>  drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
>  13 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8e9b551c7033..ad70a1bdd476 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -6,6 +6,7 @@
>  #include "xe_device.h"
>  
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_aperture.h>
> @@ -382,6 +383,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  err:
>  	return ERR_PTR(err);
>  }
> +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>  
>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>  {
> @@ -550,6 +552,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
>  
>  static void update_device_info(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f68af56c3f86..47bfd9d2635d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_ggtt.h"
>  
> +#include <linux/fault-inject.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/sizes.h>
>  
> @@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 66d4e5e95abd..04485461aa20 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_guc_ads.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> @@ -418,6 +420,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
>  
>  /**
>   * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4b95f75b1546..816dc897e29f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  
>  #include <kunit/static_stub.h>
>  
> @@ -209,6 +210,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	ct->state = XE_GUC_CT_STATE_DISABLED;
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>  
>  #define desc_read(xe_, guc_ctb__, field_)			\
>  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index a37ee3419428..651543721ce5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_guc_log.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "xe_bo.h"
> @@ -96,3 +98,4 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index ade6162dc259..8f62de026724 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  
>  #include <drm/drm_managed.h>
>  
> @@ -355,6 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
>  
>  	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
>  }
> +ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
>  
>  static u32 to_relay_error(int err)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 41445245a287..7ffee06fab13 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -770,6 +770,25 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	pci_set_drvdata(pdev, NULL);
>  }
>  
> +/*
> + * Probe the PCI device, initialize various parts of the driver.
> + *
> + * Fault injection is used to test the error paths of some initialization
> + * functions called either directly from xe_pci_probe() or indirectly for
> + * example through xe_device_probe(). Those functions use the kernel fault
> + * injection capabilities infrastructure, see
> + * Documentation/fault-injection/fault-injection.rst for details. The macro
> + * ALLOW_ERROR_INJECTION() is used to conditionally skip function execution
> + * at runtime and use a provided return value. The first requirement for
> + * error injectable functions is proper handling of the error code by the
> + * caller for recovery, which is always the case here. The second
> + * requirement is that no state is changed before the first error return.
> + * It is not strictly fullfilled for all initialization functions using the
> + * ALLOW_ERROR_INJECTION() macro but this is acceptable because for those
> + * error cases at probe time, the error code is simply propagated up by the
> + * caller. Therefore there is no consequence on those specific callers when
> + * function error injection skips the whole function.
> + */
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 33eb039053e4..40f7c844ed44 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_pm.h"
>  
> +#include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_managed.h>
> @@ -263,6 +264,7 @@ int xe_pm_init_early(struct xe_device *xe)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  
>  /**
>   * xe_pm_init - Initialize Xe Power Management
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 69a066ef20c0..ef10782af656 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_regs.h"
> @@ -119,6 +121,7 @@ int xe_sriov_init(struct xe_device *xe)
>  
>  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
>  }
> +ALLOW_ERROR_INJECTION(xe_sriov_init, ERRNO); /* See xe_pci_probe() */
>  
>  /**
>   * xe_sriov_print_info - Print basic SR-IOV information.
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index dda5268507d8..07cf7cfe4abd 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "xe_device.h"
> @@ -129,6 +131,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
>  
>  static int tile_ttm_mgr_init(struct xe_tile *tile)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index eab9456e051f..087fb96f707e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/fault-inject.h>
>  #include <linux/firmware.h>
>  
>  #include <drm/drm_managed.h>
> @@ -797,6 +798,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  
>  	return err;
>  }
> +ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
>  
>  static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 22c148b1e996..94ea76b098ed 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
> +#include <linux/fault-inject.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
> @@ -850,6 +851,7 @@ int xe_wa_init(struct xe_gt *gt)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
>  
>  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 93c82825d896..ada0d0aa6b74 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_wopcm.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include "regs/xe_guc_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  
>  	return ret;
>  }
> +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO); /* See xe_pci_probe() */
> -- 
> 2.43.0
> 
