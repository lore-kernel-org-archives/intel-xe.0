Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8CBCCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 20:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D3310E1E8;
	Thu, 23 Oct 2025 20:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqutmhFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362CE10E1E8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761251359; x=1792787359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cXzHt6uMbi52h8oJzDMryByO/phcVte7Y92+d1Ai7LU=;
 b=LqutmhFhGAthxPg6SVKOPsK2xHudUahO7qvVw/QEuJ/F2XHnmV0Jz7Ll
 suIQW9xh9HgbquClqbWIo1T8cInfbrUYAm1puRGYWFiyXjdAMyx8aLYXG
 uSmFTy4HMGBNM/qgGqpU1lJ0awgIUwAKPju/mq2ZwGohYCFkpC+3+zSTu
 63wnW6pWWMgP1n5VkLJpTnGfCWO69N0roE3rDY0uCEqsVO/pGMEEN1oO2
 rqt03EieWOv/Kl6fbx9ijB+YHpuq7tGC/SG5LKEe8s8PYuP1JeiaD02Tp
 dT04pVIAVLG0qfhRxpj4oU5mMfLRSD2PF5vCr3LZCcXvmc/X+83uf3uKj Q==;
X-CSE-ConnectionGUID: u+IfIvdeSz2KRjUaY9A9tQ==
X-CSE-MsgGUID: DaAKVm69TSWUSRNbXXBD6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74778662"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74778662"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:29:19 -0700
X-CSE-ConnectionGUID: SEqsojJLSdeuRleiuvj+Hw==
X-CSE-MsgGUID: ht6aZnXTSB20/+55hDdu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="221449493"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:29:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:29:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 13:29:18 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcsJqWwEJxtyf6rdIZTi5Qpjo7EsotGoDLj+mHIZ8TYydLR0DpXDOjNGYJH8MWlO+B+yeJph+iVuaJdALSuaJNKCHcv/nLZK9GkN75TXQdvUB0/8y/CTXCg1+ACGi6VwWzZmPPdGgYgE8+UbebaH/07WMkBjEALy8/cmDJ2njpDfAQUar7TUGRektPOOK7spHulSPEXVReByRU4AS8S8K31K0kzwAgosXCPzfCu/0WpFADk0kwwxeHg3kpXs9RMyQRFWaTW51bg0URHUM3z17KNBXiPtJyPysOQm1/YCawJKHQlXfXbhkHePqWu96VeY9IAEvUeb9mCAVTieXPmzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbfIdvl81u7GhiWWGD77BMSWfdCIU6pvX5FCloDb8do=;
 b=jpVLFDRt6Z1d5khOWtTgj4pk1z0Ey39cuPUA4d+CakRtjhpIkgF4W7yqcG6o7KBWxB7a9TxXhS6EJkvinJYeZ/86cad9ULOAguXR9AE6n5zhrIptTct9unxFJHF6l8rxrVQmhy6lz9yPekQvdDbTYm6mL2rDUCjt/m7Md1F5tGmBIcxqShyqIwQOmdmR4JxAlpv6rZMRavbFcEXjHRZe4pl5U9a/I1hfNnXZ4DA9yzYlEqbYr/mQpizTOLo+a/ZD2v2vInNX992/m1IBALM1UPOtfDxXLe0DQUaHpw+6TKpvG2Nj4pkDsqEmFbtkJnmPfM3ZnUQ6kXU1PlkUFR34Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 20:29:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:29:14 +0000
Date: Thu, 23 Oct 2025 15:29:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/xe3p_xpc: Treat all PSMI MCR ranges as
 "INSTANCE0"
Message-ID: <tilx7vzys3qkxayvhgfm6eu4dx7ckexfubilzpcies3eeeo57q@ld7zpy2t3u5p>
References: <20251021224556.437970-1-matthew.d.roper@intel.com>
 <20251021224556.437970-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251021224556.437970-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPFD6B8A798D:EE_
X-MS-Office365-Filtering-Correlation-Id: eff68cfe-dce8-412b-beee-08de1272d545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3aSDBhAdMn5jEggSRtutMTUS4mNGcEBl5AWmklV3WGOtJlmzGFpjpVsUG6jo?=
 =?us-ascii?Q?dY9SiatwRZhj2yDd4LiVbTJNZHiTIzRcrt6GsecbHFFM3FW8DrMFPJTWJg4b?=
 =?us-ascii?Q?igzQSCNGPm4i0OtfNF/uNzfYuQPeqP2KopoE8Ds1UPobA3h60geAedk4raCf?=
 =?us-ascii?Q?dabY1FyPkupX0gP+CntOZ9qKoZc7kXhlYBh5AgiQyVW8cOICuwDWvXxYI2wp?=
 =?us-ascii?Q?H4akCVFS+kpe3DLkyLQQOeKiARO/RxrxAMXpio8TjOPl/u4gEAzBWrJ75G10?=
 =?us-ascii?Q?XbxqbK3UNbZsAOlKzDbdvuru238K8GkQoRPp3ImYo51hSFTAm2bnPqmDwrmT?=
 =?us-ascii?Q?c1sGihySZ0jm+h7WHT2o9bvvipl2zFJpzuemJRcLTeNsLwjJ9AGHwZ0W9fpp?=
 =?us-ascii?Q?gBnRmk9/SZL1wNP6T975vhYh9vZmK5JfHO1LblgBrz+mS/bqZhPj3b6NmMFM?=
 =?us-ascii?Q?j49rCqBPW+zg+klM/hAN9XyTyW7IUTWIIEfNuMjiqtiNKp06BQov32QiAeKc?=
 =?us-ascii?Q?+dqrwGDWj7dgOWT15stPyIxZKsyvhiObndGdzJrLDTPYgawVrX4pwJiFpBmv?=
 =?us-ascii?Q?CdVJA9K6/1V8nmUuQKqSiHD7+UT1aZwn8q1s4DokeA0W5wNMqtcs+cxcw+cC?=
 =?us-ascii?Q?F2WzECGrjX/OlRBwbpcIrpKLDI3eItoUgfo3uc1+Ms7R1vsZ7U62782zNR9i?=
 =?us-ascii?Q?Dkp6dfII8AZ6zs6CQJR9piPFVSGgNGk1szYBOKWVCNkA5gZuCjmp1Ha5eFT6?=
 =?us-ascii?Q?Pbrh2a8gaOYz2rjPsi4+QyHukuZWGHuonYCYah/NwhjPS/P1q9zIiTHKJfL7?=
 =?us-ascii?Q?1i37i8sev5omjhMeY+CLZza75AvyYabtQbBlILmLkCQyE8X+IYBBUfJfxCq0?=
 =?us-ascii?Q?CM7PEXX5aPZpm7N+673XQAEGQNGE4BYH/8zCyGOL8lI2rdJc0IZ3MswRdRIQ?=
 =?us-ascii?Q?LzHFCKhp6ibzSLw11K/HN+XG5MGnSoTF+DJBBgpbBCjevwsK6vqi+/cXohw0?=
 =?us-ascii?Q?5CU6VCzcRTg0Q2suoqAlItkK0tDsFRu/GNMo+DxqkED5pQVAUE+p421JCfWZ?=
 =?us-ascii?Q?6vlRarKBRAdhmEzwMpewL7j5fwX8sdHuPacaJCfAjgUCMCisR8hNIh2J4vUH?=
 =?us-ascii?Q?pIwl+LtAorHOp14PmNTL6Y5tBy5DrU3wI5zHoHi7WyMjr8CaGH2WWhmC+5aJ?=
 =?us-ascii?Q?mxshxtJgTHeVhjlnYwYbPVXi6AqKu/n2YX3My34rOpLrY8I7XdLieHTW/+br?=
 =?us-ascii?Q?GfBl6F6Btb1VWkRNc6qNuITCK6+dnKoWckEeKly0Hdf0GK4qaatMdcyifal6?=
 =?us-ascii?Q?0pr2Wf4NVk506c4yfa+FXTouQkmpOpLqHF8vs2R7PcN6fwfSVsQXczkhQPnp?=
 =?us-ascii?Q?lHvC+OcFxkJ7aHB73f8a6Bak316x2wob8Vrkat+68eIfmKcMiqiBeWe/1eVU?=
 =?us-ascii?Q?4uAnUkvWUb4FDd6AnJpR8y4w+g/obWYu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?osIzuXAE5hfwEgO9Z8sXHwu+Wti1Ua82+84QQP9kyiZ+EhKWYSuciUBNXAit?=
 =?us-ascii?Q?1Gzo6GNHcHGWP+BccPgFFe60o9q+uXQ6fw7Fhd3IGIALP2KW9h8QtBjGzpja?=
 =?us-ascii?Q?Ba0c/re38sXrjTpmw/hnpQ4sb/Rqp7qhPszrGLeKF1HAWGo7nwqGd2aASMlx?=
 =?us-ascii?Q?9mtQeYZEjZsJ3k3lzodXlXh1Y929LhLXTzbfeFxRlnLIa1ZN4pizjoml+1td?=
 =?us-ascii?Q?w2aPx4NUqSSVuphu2535eCws230C1SSpo7emyUqebjTGRSRExOBgpXPzPZbz?=
 =?us-ascii?Q?wq7SPnr3r5wIecPzkT3GdmkIzZoF8EmqcFzENzQ7p7bh8ycxzzfjQZjrMFMK?=
 =?us-ascii?Q?+Ubjo+JccvyNq7A6fSU6sOPEduZ71dVlxOXp7oBlVxlfokJ4GXag0ieN0bxz?=
 =?us-ascii?Q?sPxTvXkaMbeDDd+l12kUMlPg3qTpoIkEu9eu3xNxVJCdhvrJFU05LVmj5baZ?=
 =?us-ascii?Q?FP19RcwKMQPVeaLYQuqR2bAlGJ8jzWMZmv4lXnPwd0zVen1zNOgisfL0YcFE?=
 =?us-ascii?Q?8AXxyGYgMF5b6gdDKf0tW1cX+tEjdtEXk5x+YHEv6F/kdfnxdTt80HlpYtNM?=
 =?us-ascii?Q?7UWh7a6CK9nsA2qbwx21wSVlPqQaRv/n1JlEudwZfGKllPyZQWnRadAQxMiD?=
 =?us-ascii?Q?z2iasdvgqieooiYjUAVnrNUQ+T18CYQZFR7En6PWsRC+liQpfgPIn5Wz4uo8?=
 =?us-ascii?Q?1voJKOWYmHrGwfMgOcWmcll06xptcEgT5BXzbyjRO4YDfmQ1vA26ZPp4sgBf?=
 =?us-ascii?Q?BOGoAADTq4GX+LXFx9PeD55auV7sVPTMi8nQ2V4OKf/s618gwlwho/OS0fnF?=
 =?us-ascii?Q?DywtjTcthp0ZnzqfJaQrb8ToVx780Elq3es2nDqkh2zKeISTETKwxo0ozLko?=
 =?us-ascii?Q?4ea7tuGqh7sSaUGdMkhLpEgtblnAQ28bqhT4zkqp04StD9yoR2Z0dB6DJNDh?=
 =?us-ascii?Q?FMIESoSnRnLtALcPvBBqp6JZDvjwOPx5Dts7LHn6BUCDxPovXO13QXecpNwU?=
 =?us-ascii?Q?676UGUaQct8VBisS1uj3uDbifCl746RG8DcCAINOlEP51G59rV12VWTLm5DE?=
 =?us-ascii?Q?/E13hK1O9DPlPCdV7n6PEpyfPah8sDMM8N7CYSmho2GJoKnBvATM3ErSSk5v?=
 =?us-ascii?Q?HdIM54wxcrLno3uDdGIWDJ0Ew0xdMa0XQMS9CvfCQbur/DozNHw5hHbrVsRO?=
 =?us-ascii?Q?zUxUj5q/837oepiV0EPTYp03ITRm63cUiua9LsZKTygC6ZDQZoh5DGRj5A9m?=
 =?us-ascii?Q?xXmUPr9lLSh11zoHNYMA2W+lClAxyMCt6JOf4bVe2XNPoXAGgzwYbXKXmAk3?=
 =?us-ascii?Q?eWjaynLpsKcjFFS1eXIQzHPiruUWrWFT/wCk6N7pEYBOtbXrfHRZ1GUPgNCN?=
 =?us-ascii?Q?jF9e1CmWDU/JX9CwdHrdlNM4d0BoJ0attEW8OWnPOtzj+VGdcZ5YLeIFD/0v?=
 =?us-ascii?Q?4v/eS+C1kOfhPKB/5DIuBJ+knFOTJdjRw2LOjldX8M2+3FTz5BqMc/A8hMb5?=
 =?us-ascii?Q?BFKM0sQrx/5eGbgUqLw5EZCwzWZBSqtHYvb2MV2ulvHaBvYQmnJ2CRrcxQAy?=
 =?us-ascii?Q?NV5+X3EAmLUKaUR0Kf+ZqzRxS4RpGNIZ6Z1uFpS4DGF59WHUxZC/LeaHVqXd?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eff68cfe-dce8-412b-beee-08de1272d545
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 20:29:14.8681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlmJEdtUgRVOD66rU/4pqnL1RwOCG53uGNl5uXAJhPFw89e5xlWsIb12OHH5L01kuxaoICM1BE88CNEOcGdESvQ2OBIieSDvJ+hngBYhoac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
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

On Tue, Oct 21, 2025 at 03:45:55PM -0700, Matt Roper wrote:
>Early versions of the B-spec originally indicated that Xe3p_XPC had two
>ranges of PSMI registers requiring MCR steering (one starting at 0xB500,
>one starting at 0xB600), and that reads of registers in these ranges
>required different grpid values to ensure that a non-terminated value is
>obtained.  A late-breaking spec update has simplified this; both ranges
>can be safely steered to grpid=0 for reads.
>
>Drop the "PSMI19" replication type and related code, and consolidate
>both register ranges into a single entry in the "INSTANCE0" steering
>table.
>
>Bspec: 74418
>Fixes: be614ea19dad ("drm/xe/xe3p_xpc: Add MCR steering")
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Thanks for the offline explanation. It took me a while to realize I was
looking at the wrong spec and not matching with what you did here.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
