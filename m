Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D20DC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 14:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D963810E3D9;
	Tue, 27 May 2025 14:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2UAgStk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6941510E3E3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748355121; x=1779891121;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j7605owN1gVPZEzV72mpLCeHLQzd7WiqFHUF2waz91E=;
 b=T2UAgStkOKKAAILLvK17VldnRlaiBs8FQoNx1D6v7W64le6Dn1/5DUK9
 GEZJMm+W01lebcnyddM2fh4dlOfhQwULG25nTJ8e2t7N2cSywzQv4arsL
 iBRWEECgHmSChO3GKSs0sd+BBP7QS1iODq5+P3x3SP7/yAJIqEriV85Zv
 06vSP6CsfK7L3mMT+y9iFIPxbn6AP8bv5iaCd5yBrdKoVU2/LU4LSkjs/
 eXmgrbaIdZUy7lrCEO0dvzcRg3E4e8xsGMhgDQBwVRUL3HI2jnIL8CKbE
 L2uUGXCMf09Y57E+4Q6J6U/TsokkbxWar1geYxdjKJje9RvNnSDbeYJs5 g==;
X-CSE-ConnectionGUID: T1mne6GER7yDPvwQ+OOKcA==
X-CSE-MsgGUID: SAFdH2yXS8q+eZoHO6t9EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50503171"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50503171"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:11:59 -0700
X-CSE-ConnectionGUID: Bur52K4pSPGqUjZiv5a9Bw==
X-CSE-MsgGUID: hzP49iSxSxucUGgE6vrjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143176260"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:11:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 07:11:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 07:11:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.81) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 07:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRx8Hwb948m2FVBwxecK4XntZute6Hof9BggjvBx1asnzMpIWTIl9RruGCz/QL3TCGFFzDTHu01UIICPgHCnV4qIRqky+11naj5Vqo41Y0/sCzferjX0qWq/NYEPg9KOuN9fZSAX2XmeHJpcIOczFyQraL9jv6vXMsXdcuTs2qf8gT29N9NugY9aS4Ad+zt2ICWbUfk+z6+2RWC750XwavSI0Z58U5BZXUFzLDOK+3Hlh6QPR6+apTSDetLZWFXhA8wF9wmFlDRMNhmQpynfqx50zkAlWWCiH6QLX2fdHQa/+IFc4R18GGCxBS2AAL7Z0Sd2VsdsWW5TlkMMG+z5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eP0CjLMyT+8BlNhFaTmJjH3a9RYHEMVS854QiZK+0pY=;
 b=GzBBxdfAyiiF+qhIJuDgeYKNBBxFA4f3RF2JL4H4t8B5XFMFS/yFKCITMFrt4SqnCU/F9Vksh4gMDu1um303OYJM6IQVd3LIvTi/QR1NwOz64UO+bjnNEUKX90wIM3M1ISlkKNdJ2Y0XR5PGRphu+tYNWBhl7DNPCnEfqCPF2yv+vNuPpi1p7LRHIiAhY1y127GkymRSqu03Fjd2hWnCr+UvuuZcQ3RyjNdlku6LWP3RrHisT5NVLpF4bsKD9Q5F9c2EfgsWxTWyYKolBDsdFHJWx7Aep0TeLZVqigTJx37pwbIRqWx1rCApW7Ap1TX4bWFtDUjjDfz6Kn2jwv0OXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 14:11:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 14:11:53 +0000
Date: Tue, 27 May 2025 09:11:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe/configfs: Add attribute to disable engines
Message-ID: <cspsp4fp4dfoywujm6kfexe2redmpveepopdhjyar6iwdakucs@reu5gm3lt4r2>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-3-11817dc6eb63@intel.com>
 <2f852afb7e402fe289a2798987fc83292a9f9c6c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f852afb7e402fe289a2798987fc83292a9f9c6c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: bd553607-4ccd-43e0-3e2f-08dd9d286e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ehL/Jow8R6R89QpXO5rgNMK+ljB4+WRyDZ/OVe8kzTZ8pSdvfuE1SKIF4Y?=
 =?iso-8859-1?Q?35Tl1LfSjY7YXoEYUjkNPPXP43I/bwdQx1jeEqxnK5jpnHu+OV4Q5kLL5w?=
 =?iso-8859-1?Q?ycjgri0Jntt3TnQByFob8gLhzgWHRrV7qPzZ+paL0XQXSodsedivHBg/wc?=
 =?iso-8859-1?Q?5A1/oLbBY+pURdkFcdswVSftHyQ9s85AXyOrRNAXaXa07t0Dd8hdHBdBDN?=
 =?iso-8859-1?Q?TOap5V5R+sNuoiwbxtwE7Fayzrw8r0o2gmFFYhRTNpALada+JgqjxlmrW0?=
 =?iso-8859-1?Q?kwcKxb7z061E8LDFs8QgZnNF81pqCGqKLTrr++kY26MEQcYrZgnMH1orxN?=
 =?iso-8859-1?Q?d60SbYpWFiBVeK0T9d90CyAkp93bw1u3Tql4MNBcu9lYpujgM6HlSQSSfj?=
 =?iso-8859-1?Q?pLlTIBCzEhbkI4vOMvvj1qvOZZttc3BbijOMSFjqMb0TYQTRqM24uIW7MA?=
 =?iso-8859-1?Q?VuuFcu7zjhy32BXUYGHgNoTb5/OsUTXyqzXKj1KEVPYNFaA39dx6lmBgKG?=
 =?iso-8859-1?Q?1umt9QHB/eL5v0gEYJgiBeCwCJKHDAT0XyTwFh/LrL8vBfwvT+PL2OmCnZ?=
 =?iso-8859-1?Q?1nkj9tJfzyw6vDvakXuO4LgbJ2P24nABLi5Lp7MIdyX9Wt4bKsnNn9IXGZ?=
 =?iso-8859-1?Q?pOGkF+vvS4ET2kq42XOLSXyymNEMWtinALe9BDeddWIs6vrM77IWV6khps?=
 =?iso-8859-1?Q?71RP5DK5ZCRKbqOu0sQmB6UvXvvlxahqQkJm7F6Y0NYFo4I4zNID9DjyCO?=
 =?iso-8859-1?Q?fzwjEmDylCHiVLwUn95BsB2ez/QSxaS3evIxHdZWLZlGRlllw8VLoSn3PE?=
 =?iso-8859-1?Q?ADSAvd+y3E6QVVI//ufxEpW6CGhV0K34PCbM2+B46OkswlT+Wv8fPvP7Sr?=
 =?iso-8859-1?Q?6187cURocyiakRhiIfXeLA5rvRP83SXNJZZzElodTJYSAaOm5KKtcbglIc?=
 =?iso-8859-1?Q?ZcgYc/796+PvA6FQPcKZ43fa1JX1hiaLjDyPxbuYAGGhLcAeFDkRjhTI0q?=
 =?iso-8859-1?Q?qLYx/QEtWz/ycryYZtvOvRXu3pHYpMdITTeKzprz9HwdShxyNr61qH3RRw?=
 =?iso-8859-1?Q?mNpvnhb1D6SAGuT++0jZVgcvai3lFVYhHqMxOY8FJEbLKVaAV89A+KyQZ4?=
 =?iso-8859-1?Q?ZMfIht38CEIJ9LsV4JLHz0BTwRGtZ8wKlhoCxORGuXF5Gm+yVP2E074Sfx?=
 =?iso-8859-1?Q?W2GJLVYzdHDBbWAJ4ZRmp9oqdmzTf+Bt+SWA71MoDKb+eO2+BG+4FSGC+F?=
 =?iso-8859-1?Q?QjhYwSgDy45cN7VdYuKXexhafENWHDjMMVso6y3L6dDpCg/6GSi7SO6+S8?=
 =?iso-8859-1?Q?wX4cXsty2iHkCLA6SQKZ8nDg2+lW1PrtyNZ/mfAB4BfUgDuvTCqXk2J77p?=
 =?iso-8859-1?Q?5ograGcf1alNTw3ImdGKyrZI6KHPsk7zoZC2oUX7HZgWXJgDXm8iPhivLe?=
 =?iso-8859-1?Q?Aob9LckDuodPW5YlihQk7qFz6hPET0hAsI9UurzkELSh1c9JEZin3bAtuU?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7rTfYagmsCuXPc4nfyJtI8+ifQ5GTwcFxfa3v0MmUl7CYeKLb9CZ1aAhws?=
 =?iso-8859-1?Q?J9cHuXLUynm29NqZZFt5GAVmNc5zZFtyWquQmXhFKqaB0vOrkQqfKH5eKS?=
 =?iso-8859-1?Q?tTJA18MWqS2TPE4fC4gx/VVyRfhuTWXDgYV3tLOp5/78fvIt3IYgwYXXAK?=
 =?iso-8859-1?Q?pZ0VrhJDP6dKzwGB21yophwr8iuYyLlLWk5ctMnsB9cM6lbLOV8UoIIlOf?=
 =?iso-8859-1?Q?RvC/n/860rBYIX+h8XUActRpaaIsjhGhZP4J8oVXQ9cAAmvlklYeWNRJGq?=
 =?iso-8859-1?Q?8o2VN1roI6582lhlSHNF6FzibHfQmffXcuknORCCj2mERdx0c8GyPzQcN9?=
 =?iso-8859-1?Q?V48fvV91ZBXhL9Zr7Qf159kSbCZLmQM9coA/u2grYL6nXQaVrHXPRiYrW5?=
 =?iso-8859-1?Q?MazkmXiFKUC/l0Np6XdeH3tOTzTmVOPIl9ccfRvcGUBptq9QCmlKXxl99p?=
 =?iso-8859-1?Q?54ijaKM8o8HaoTIywQu7FWb6QaL0eEVdH/5w3iWemabcnDcowM/d9XklZ5?=
 =?iso-8859-1?Q?+pFnIVCOy4u+0Hfhxky1CQQFfcDDnFnxZTeXIRIsOPEkEhuP+LXfIJodPD?=
 =?iso-8859-1?Q?a2qER15gKL8x+aV9RgP5hAH6L87Ebk3DAUNgVQ6EwQVr9miwbP6YlzmIEe?=
 =?iso-8859-1?Q?v9KP9NMetaPMlchOegl98maBe9xZqmClgZrCHm55Wr2ZbvDz9Eq/iAGf2r?=
 =?iso-8859-1?Q?U11xgNY53y461FfrugZoKDD0YENqWJ1cq8BUY2e3i17CbVU53DTkYyfcvZ?=
 =?iso-8859-1?Q?1AtR6px2AAmQZx7SohJB727XqNjdN/WwJMxocBnmxFrgpeslQ2sSBGjLze?=
 =?iso-8859-1?Q?bz2ImO8davBQQ+M1DR6Ewwn9RjHoJf0mjnUwIKt/FhMc/Oe8rhEoQ5wO25?=
 =?iso-8859-1?Q?1BSFUL3NRXM5EI+oTkg1elb668koyYXajN0V7Fyf6Fmsr2quSa2nB98UKJ?=
 =?iso-8859-1?Q?J/CsdugOi8MXsdczaYsFr6P/LYPQgiWJE8mkXUqcRhXPkEV+uCWnAfKCs9?=
 =?iso-8859-1?Q?sYIOFmgYp5U5olKQ+ssD16kvKR6YxcZWGvtr8ctdOgPMUNsak5jjJnJVKW?=
 =?iso-8859-1?Q?3xk+MGUJv69uTJF9p/7ujyAfIVgzjvQD1vdoXsevTyAGma+0Rq6asA0NwS?=
 =?iso-8859-1?Q?zvXokioPGDl9dmhGdVWGmZIHh7CZc9nHEKEf1vIciGyH32WJjLQ6EgtkG1?=
 =?iso-8859-1?Q?b/DJotnAoa/U/khffCdkr3ir3TFGIb2iriv0LtzTS5s4FDDUVzTya4f6AX?=
 =?iso-8859-1?Q?ZzNJt8aB+qZWKc58Q6Jj6xab+zEBbULNf8lXqz+HCM8EwiPhsAdCu7/+3B?=
 =?iso-8859-1?Q?k1x6LisH58pzvkXTZ9JWqf2jezD3kTIzXHTsH1oJcKoNZx68hZD/OrJ2vH?=
 =?iso-8859-1?Q?t4gxtHw0G6sdVzyONv156rShccACIJ7j1M/oPtg3co1cspOalrg8PAPGrO?=
 =?iso-8859-1?Q?TrKbdJh8ir1y/1OFBnFR7x5iDjm7caYKCRTr5Bvk/Du6YYLrJ5m/vrAIW9?=
 =?iso-8859-1?Q?YlQP7WfaRZscbhsXWV21aXDVaA2guEQUFZJYFfjer/HOvOslkU7b32V+WJ?=
 =?iso-8859-1?Q?64YSN3Yw1akAPO/1hxlGtT6akVRnvOstnnISYzIw59IT8a69uuLEdpoD6X?=
 =?iso-8859-1?Q?Dvlur5ZaiHoPaAwFsAK7QTaCV0Nsbxw5WE1QI6ibgw1BA/XDWo9J5LqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd553607-4ccd-43e0-3e2f-08dd9d286e89
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:11:53.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1A7nR2qsmUJaMGI4WfpnLgcB2bpFuC2JyNYrqOqmcdCVprY+gOlLQGzuZbaJz39bOPdfMLz6EaAlehm7PCoNAwP7cjd32UzoNH1YNQzspuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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

On Mon, May 26, 2025 at 12:45:01PM +0300, Jani Nikula wrote:
>On Fri, 23 May 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Add the userspace interface to load the driver with fewer engines.
>> The syntax is to just echo the engine names to a file in configfs, like
>> below:
>>
>> 	echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed
>>
>> With that engines other than rcs0 and bcs0 will not be enabled. To
>> enable all instances from a class, a '*' can be used.
>
>Only nitpicks inline! ;D
>
>Do what you want with them, ignoring is fine.
>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 137 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 135 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 11ca36f194bfc..b27bbe203eb46 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -3,14 +3,19 @@
>>   * Copyright © 2025 Intel Corporation
>>   */
>>
>> +#include <linux/bitops.h>
>>  #include <linux/configfs.h>
>> +#include <linux/find.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>> +#include <linux/string.h>
>>
>>  #include "xe_configfs.h"
>>  #include "xe_module.h"
>>
>> +#include "xe_hw_engine_types.h"
>> +
>>  /**
>>   * DOC: Xe Configfs
>>   *
>> @@ -48,6 +53,23 @@
>>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>>   *
>> + * Allowed engine:
>> + * ---------------
>> + *
>> + * Allow only a set of engine(s) to be available - this is the equivalent of
>> + * fusing engines off in software. Examples:
>> + *
>> + * Allow only one render and one copy engines, nothing else::
>> + *
>> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * Allow only compute engines and first copy engine::
>> + *
>> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * The requested configuration may not be supported by the platform and driver
>> + * may fail to probe - intended for debugging purposes.
>> + *
>>   * Remove devices
>>   * ==============
>>   *
>> @@ -60,11 +82,26 @@ struct xe_config_device {
>>  	struct config_group group;
>>
>>  	bool survivability_mode;
>> +	u64 engine_allowed;
>>
>>  	/* protects attributes */
>>  	struct mutex lock;
>>  };
>>
>> +struct engine_info {
>> +	const char *cls;
>> +	u64 mask;
>> +};
>> +
>> +static const struct engine_info engine_info[] = {
>> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
>> +};
>> +
>>  static struct xe_config_device *to_xe_config_device(struct config_item *item)
>>  {
>>  	return container_of(to_config_group(item), struct xe_config_device, group);
>> @@ -94,10 +131,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>>  	return len;
>>  }
>>
>> +static ssize_t engine_allowed_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_device *dev = to_xe_config_device(item);
>> +	char *p = page;
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>> +		u64 mask = engine_info[i].mask;
>> +
>> +		if ((dev->engine_allowed & mask) == mask) {
>> +			p += sprintf(p, "%s*\n", engine_info[i].cls);
>> +		} else if (mask & dev->engine_allowed) {
>> +			u16 bit0 = __ffs64(mask), bit;
>> +
>> +			mask &= dev->engine_allowed;
>> +
>> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
>> +				p += sprintf(p, "%s%u\n", engine_info[i].cls,
>> +					     bit - bit0);
>> +		}
>> +	}
>> +
>> +	return p - page;
>> +}
>> +
>> +static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
>
>Arguably s/name/pattern/ would be easier to grasp.
>
>I would pass in a single NUL terminated pattern instead of pattern and
>length. Following comments are based on that idea. Everything becomes
>easier.
>
>> +{
>> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>> +		size_t clslen = strlen(engine_info[i].cls);
>> +		size_t numlen = namelen - clslen;
>> +		char instancestr[4];
>
>None of the above locals are needed.
>
>> +		u8 instance;
>> +		u16 bit;
>> +
>> +		if (namelen <= clslen || strncmp(name, engine_info[i].cls, clslen))
>> +			continue;
>> +
>
>		if (!str_has_prefix(pattern, engine_info[i].cls))
>			continue;
>
>		pattern += strlen(engine_info[i].cls);
>
>> +		if (name[clslen] == '*' && numlen == 1) {
>
>		if (!strcmp(pattern, "*"))
>
>> +			*mask = engine_info[i].mask;
>> +			return true;
>> +		}
>> +
>> +		if (numlen > sizeof(instancestr) - 1)
>> +			return false;
>
>Not needed.
>
>> +
>> +		memcpy(instancestr, name + clslen, numlen);
>> +		instancestr[numlen] = '\0';
>
>Not needed.

kstrto* api doesn't accept strings containing other chars, it must be
just the number. Looking around in other places they either duplicate
the buffer or already have a non-const one that they can simply add the
\0.

As a refactor in future I'd want to have a length-based kstrto* or at
least return the number of chars parsed.

Here in order to copy to a local buffer we need to know the number of
chars as user could have passed e.g. rcs012345678910,ccs0.

>
>> +
>> +		if (kstrtou8(instancestr, 10, &instance))

see above

>
>		if (kstrtou8(pattern, 10, &instance))
>
>> +			return false;
>> +
>> +		bit = __ffs64(engine_info[i].mask) + instance;
>> +		if (bit > fls64(engine_info[i].mask))
>> +			return false;
>> +
>> +		*mask = BIT_ULL(bit);
>
>Arguably this would benefit from a function:
>
>static u64 match(const struct engine_info *info, const char *pattern)
>
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static ssize_t engine_allowed_store(struct config_item *item, const char *page,
>> +				    size_t len)
>> +{
>> +	struct xe_config_device *dev = to_xe_config_device(item);
>> +	size_t namelen, p;
>> +	u64 mask, val = 0;
>> +
>> +	for (p = 0; p < len; p += namelen + 1) {
>> +		namelen = strcspn(page + p, ",\n");
>
>lookup_engine_mask() would become a whole lot easier and simpler if this
>part here copied the string to a local buffer, and passed a NUL
>terminated string as pattern instead. You need the local buf anyway, so
>why not here, where it's the most beneficial?

humn... and copy the entire name. That's a good option indeed. I will
take a look at incorporating this on next rev, thanks.

Lucas De Marchi

>
>BR,
>Jani.
>
>> +		if (!lookup_engine_mask(page + p, namelen, &mask))
>> +			return -EINVAL;
>> +
>> +		val |= mask;
>> +	}
>> +
>> +	mutex_lock(&dev->lock);
>> +	dev->engine_allowed = val;
>> +	mutex_unlock(&dev->lock);
>> +
>> +	return len;
>> +}
>> +
>>  CONFIGFS_ATTR(, survivability_mode);
>> +CONFIGFS_ATTR(, engine_allowed);
>>
>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>  	&attr_survivability_mode,
>> +	&attr_engine_allowed,
>>  	NULL,
>>  };
>>
>> @@ -139,6 +261,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  	if (!dev)
>>  		return ERR_PTR(-ENOMEM);
>>
>> +	/* Default values */
>> +	dev->engine_allowed = U64_MAX;
>> +
>>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>>
>>  	mutex_init(&dev->lock);
>> @@ -237,8 +362,16 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>   */
>>  u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>>  {
>> -	/* dummy implementation */
>> -	return U64_MAX;
>> +	struct xe_config_device *dev = configfs_find_group(pdev);
>> +	u64 engine_allowed;
>> +
>> +	if (!dev)
>> +		return U64_MAX;
>> +
>> +	engine_allowed = dev->engine_allowed;
>> +	config_item_put(&dev->group.cg_item);
>> +
>> +	return engine_allowed;
>>  }
>>
>>  int __init xe_configfs_init(void)
>
>-- 
>Jani Nikula, Intel
