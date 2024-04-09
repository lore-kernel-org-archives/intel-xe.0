Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED5EC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 19:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5E810EA5F;
	Tue,  9 Apr 2024 19:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bv9ZL/h8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142210EA5F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712692516; x=1744228516;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qd/itCQKHV5Bzrh7DRcJIuNgooh0sE41LOuGLdCOfds=;
 b=bv9ZL/h81jaB5uQwW056/Qimm3I2potJL3UkwrQY7U7mDFGSXzD4zglq
 tzWvtK/VW+xWFZnzSHyf81bbzM2Te4YD8UY9BwjhsrtZEsmE/LlSYtkPs
 vWILTasUgAO2yeowHYYUBeSIug1lW0pnryYjQTq2B3hWcpM4HIPRkzY2Y
 WHlmFopHwAhUTQd0njcQOg5/sBm0P2yC5QDgZ+5zU61KGzrUxE0Kspw++
 aICIan+2C+W4oQZD0yZl9VepicHIdY9o0DX02wOx3JRycAGJgm3vO27be
 OQSa9RxmgzLeigBLIP34QQUgc0o8E1P8BqZwTDEZ/OuaeLwnxhKZ2443J w==;
X-CSE-ConnectionGUID: 36Y7sVJbRl6FoKubuLbASQ==
X-CSE-MsgGUID: 3QfrJHuxTuCtIr54rOTRSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25529885"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25529885"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 12:55:15 -0700
X-CSE-ConnectionGUID: XG7JOwrKTbmnLo1mFi3oCQ==
X-CSE-MsgGUID: nUl2UdKDRJijTkgQG9yOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20272314"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 12:55:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 12:55:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 12:55:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 12:55:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 12:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/S8YRBLl8v00zognv99eU1kxVSz8fyrpNvjo7ueGGpKqIIzdRjnKoMT6+K4KMQHTf1qBS88CEZY/8/j66i4oXqN9lxFA63alQYB4WVAHTERrsaZ4W6ml3H3hHTsXl+b05vDMpNuVRWh5qego+qQmNwneGGhOJIGbCIj+XBNt7K355It5Rge0AwfeElg5JMR0i5hg8RSngpLh+TvD1vzIgBKsb/kQ55q1a9Qr37Psp6TyxxOG4FMg2OdtSMjPtiHN9Lgh2ztRkmfx0HtO0nGF3vkn+dWgBs2sjIO6aAMgSSNxeDxL7+YbryhuJeBT+EYyk3jLSrHH2ap9Ifj+RVZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd/itCQKHV5Bzrh7DRcJIuNgooh0sE41LOuGLdCOfds=;
 b=Y4h1GDwFTndf3AarlVl/cunld/GTd33jHAn2VUqf6faFrSOjKMFe431Acy+iSDITwhKWN7akWvB6BIjmboLnOclIuPsUaFGZYYieMQbZ6bhhPji+oiTELuzylSoJNexEMLRnFtQXoN/PlV/VUiZ6LrP75bC133xqgOeUPdlzdzpSrArCKKi3fYLJyMrI663cLSCqFHT/o42Ui8FSrJrBMJHmfe09trUjT1gL2yywnfYid2ynN2SOlEpAwUsibzmc5tUxHJlpxgBINlZPQilYyhOup7YNE6NgYgfPONsYZmUBnqNDIgVrWClRcqaqhL+w5FtjWeagOwOkr/Ba0u3SiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 19:55:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 19:55:12 +0000
Date: Tue, 9 Apr 2024 14:55:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe: Return NULL incase of
 drmm_add_action_or_reset failure
Message-ID: <6jbbsyu22abhsiflzv6ppjwmkkd5nesng637vxaxv3asx4hjcg@crtezteijota>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
 <20240408144944.604448-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240408144944.604448-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7464:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36gqnRDM2B9/E745oFJYukGP2VOpqBhhvWzvvaAxSMPHKddww38zir6hLr1uUxzdU0l79S/JCRP6wWK7Zs/kNJpp2eacH43v1JK7/RC8n7NfEAZyrL2gFBSv2CkUl7Ln7PbjUL/bMShe719SiU4nmp2BWqNniV0rAduElHcnbKtK7H3YL7e3MjHZk4xgg9zV2visqXK69wTAQbVRZMJpn/FjVLuwNcPZeaGvphQWK4H7D7NJZuCj2cmWTVLxIYsErt9d2qqG2p8Ugw/Hg1irOxpcym4qtVr0lwwbvhx7DVmHxzfF8B6d6+7AhBdGvH02o3Un7hdMmeJ+8sLwvxGLNqilkSMXOafQ1ZPK3+Tiy5lncXV3/IQZFjyVyTXkHWIDVBLkSRAFGN4JN+6y3uWQVcNQHgiPonIAQa3VoqROuw8lztOrqhIXE9MLjLzrhfZNd64raDPn5jr/I1AIL3ERYXYS4uCdRlWbyR0yA52tNjxVrjDboFLGAOfO4MbRrLKTHUvdN2b4YR5D8KVLrS9RwNfLTFHpp2aDRrhH3WfIAM98JanQlu6fYpnYAnsrmOQ7v8U9Uk3gT1XC51HqAeAw2VPrZEqHluEsQx0ayVIPCNTxDO7I8Dc0bjy2kbVMZz87g3sxnAD9PI0sKhNy+Y11rgQPuqinbFrBT87Dvr+Djio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UvoUtRlpbkf7FXj1Eom0Jn09nXfBtN6+dy4psYMYqqU4wPlii35KRHAZiqIe?=
 =?us-ascii?Q?D8rVoFlNjg8rLdfyF0GG0X6/MIwQTkCMehChTPqdPUa+0lmQvKiISrE5LW3B?=
 =?us-ascii?Q?LXiRrJ3KbGWW8uyEQrQgisouTI3D3rEngnnqPEXjx/AR/w8TOJhrPVHmSrp8?=
 =?us-ascii?Q?1eF5vHxL+3Buofv8N4LgytrmWCcQdyhJvpLOKEAoOh6OE8JOg2eBlHvNp1l8?=
 =?us-ascii?Q?kPAumIFzrkl+QSkaOtcgDQJinEK/HP7FNRpV/tYPyrEGMiDw1rb9Id5uIveh?=
 =?us-ascii?Q?kxlM0VZCnQ40gQ4r5eEALyNABdA1yKag24FwvQATMNezbA/oahAjKv2h83yC?=
 =?us-ascii?Q?6qKQapoW3g18EKpbJNatYwNXPO2/80yuXELJNUh/YNkbhp8HbSRgQSGaRMsq?=
 =?us-ascii?Q?gNWKk/1YufG8Nx1ZWuF2XlN/z7y8/2yV1AQcC20NNlQeR7yVLiz82HvNDcfX?=
 =?us-ascii?Q?O/lRWXaHsTOaMiPekYIi7TJZc3GZrOP15cZwwP2Me/p/OOX6x3NP4kV86OSk?=
 =?us-ascii?Q?exPwKVjke31ULabGyA5Czj8L2N696SrpGoBGb8nrfUtagKsFWW9Rua/E9ece?=
 =?us-ascii?Q?vpOEhyLvOofyFhUkPMnyPz1bHqfsDfXLWSQKg3Oei3WPJzbt1jDzw4OeVBn0?=
 =?us-ascii?Q?ZjIJXOBXHOA03IL6JokuLUqA0Hz8CAyi0utXcwUzrg4ZsdwqDQegf+e4myyT?=
 =?us-ascii?Q?P1m7MiVVRswV0DdVecWJCPcQIMg78iG9GfS4oDNGO491LXd6QbWFWPQa0u8T?=
 =?us-ascii?Q?ozU88+DKXJtoQIZr62IO7V+Q1COBscQ/D7ucXlAHPBFXwU+QB97Scsl9QNLa?=
 =?us-ascii?Q?CCB2r2K/oBQ2S0ygMQGEMIZxi+1V7ZnGBv81jW1d3OWO2V3j+8LaNg2lk3eI?=
 =?us-ascii?Q?xfSzj+gYrlxlajQAkXH/40SJ99iSRho6L+1IE31mp7C2AIAOQLnsKXVADflo?=
 =?us-ascii?Q?K6FpQsEtvcy+4yrw3TbOoAhNdZ//khG4DhhgLFAcU9QtIwLOoLHx9h9OeHn6?=
 =?us-ascii?Q?TuXKiwEq1zjstOLcZotON+mthDifnhYNO0P9lGYpGUih7jdzTbvog7PdPqjG?=
 =?us-ascii?Q?0tRnr4QO4ckPDJTwRwJKMA1ZOVjr17oPxgTALRYkp96LPXjkIXeiNFwbbiwi?=
 =?us-ascii?Q?Oo5/zxxNnc/JfkFUfs1WQfID08pokSlbE3Aizv4IWpTsKNXCQkC+gMsLmhkr?=
 =?us-ascii?Q?fCZqvg//r/zAYJA8t0FgriispkIKf0fkDGhfok5uecoLdZHZBcFiGEDuGbyI?=
 =?us-ascii?Q?Nqat0e1+h/KxlyKQpZ92QDJHS0O5kn4K+tDZ53xN9uu40djTum/+w9CPhpJV?=
 =?us-ascii?Q?7HnDODJqjE5rYAtVKg1fbGYHg42Jak3ZU16V/ycNUFKvRh5j5RUEdKL44ntY?=
 =?us-ascii?Q?zaJalXEzjk1s7wL2D1N4LTsBQXG27/iPzdYh4qBZzUj4i9dBopwvMhWmaJ3R?=
 =?us-ascii?Q?fK2jMj1VkJEoLepbOc1+L6SvvQ/wOJueoUTc7nceB8ijEOKgB+YMd8Qb6leX?=
 =?us-ascii?Q?2IMCB4Ox/uU1vNRSzR3cz74GFNcvJROgpWsHj5OWqG/o4f4dgIuQ0gUdE6Fl?=
 =?us-ascii?Q?hh7bw+jV1V7U96sJv3SqJErY7u+1BMWeYqqXhFDepYshcl2aURtgOgfpDLPq?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 786031de-3890-4370-f908-08dc58cef800
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 19:55:12.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS3xl/WwyBSD322a0UMkJwOvEsQWmw8vfXjw0Na7tZ1F/xTXFjQdioRz0nJnFDGKkCXyP4y2Er113YRoEfpNqWoy0XvbvgLQAmq6g+i3g9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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

On Mon, Apr 08, 2024 at 08:19:44PM +0530, Himal Prasad Ghimiray wrote:
>Incase of drmm_add_action_or_reset failure return NULL and no need
>to print warning messages as they will be printed implictly.
>
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
