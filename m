Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84359C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 22:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F0910E09F;
	Mon,  2 Jun 2025 22:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2v2HVvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B8310E09F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748904496; x=1780440496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CMVOnY+f+04NFtTs0niXMykMLD/U87cOaTawlXt3bXI=;
 b=d2v2HVvUmX4WyRwOpNMdIlU3yJctC5EU3FpnLfUP+v1GLhu4STiuM4JQ
 0J0ah+Ye3Qwu0bJv2TIIs8P1GS8jgCPV4R/WXd0gEzabJAQMMT/MYYYWj
 JQOmYA6DPhxYS5FXa61ODEx21LmxqW2lLZ22bzFxrhqDCB47ydJmJacoi
 vcFv4vrFqAdrAqyNdzSoOxWToNPG/jPs+BngUDtxVmCiuYoPXMSzQhdSH
 F7HCoxyCVeyN8DBTsvZosyge1bUw0EdTNeXrYOq8pb1OgiP1kUmx0jCcv
 6iliAnJGW/5CZTRjSD023Y9gYOFa3bTJhd7aSdnKiTaTotfXeymTSYLX5 A==;
X-CSE-ConnectionGUID: +QMZGEdLQwSLWEeXV5z9FA==
X-CSE-MsgGUID: zEDNaKqLSX+QZflB+z4r/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68479695"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68479695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 15:48:15 -0700
X-CSE-ConnectionGUID: gtdvz2cFTuawi17qBkN6KQ==
X-CSE-MsgGUID: nUQGNlW3RDOaPeOGcmqhzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="149937434"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 15:48:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 15:48:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 15:48:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.65)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 15:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlpBgVxpeZQeoJTbLAh5dIK9314s1xSF/nP38onv17iqC87LQIVLZO6LhGi9GRDaTqGYx8R6M6+9tGeiHgBTf0S9flhp2Oaf9oCRF33aoMctmZfNWpGEjaMEO1tLPPBzkbf9u3E+cKfezMBragk8R8h/FzXdJuuYQl68LzgQnz1HWdSVAiE3DEx+UNelUI4ZzA8uswfSSwD7EhT3/eguW1jv04zc9cr45WYUg9tXOBr3TBzIIECQjijV59tWxJmW0LGbdPdEiFpuMJxyiMAkmZ0akR8YUgp/6DSC6f6sBX0/ydKXSxKGnX3M2PU/mdRX00OFsatLdJQGTc2NOGHn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kX1v1Z53O+sdUkKJxsfMdpri358QxTpwBK/TSIe/exQ=;
 b=VCVdt4m4T2tWrftZiTgLd2n0p5QRHgU780wnqShKK3c+e9tEeAcHaiZRHAr0RbqgSupjaq/Pjg9mGx9rpvZK4fmR8u6rBSbe3M68kXw2ZVC5en3UH5Wj1ycMvGmpJBIANDqodxfVMgUookGG83Bo86wBAxhcuqY+iHZPxD8s5hJOITO/ou0Rf4G+5nnVsCIOcqH2jJ1gojc4QnImuq9rvR4s2lxnBQTJo3UnWtVKsa053cMugBODzbJnK63CR2oyAtnOdiGkrtt9oIv8JVUmfEPlQ67wQeYC81gchHhOe9wvD3d8E/N8PyKHD3O7zAArvXv0SB3QVBGQDttWSSpNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 22:48:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 22:48:04 +0000
Date: Mon, 2 Jun 2025 15:48:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Message-ID: <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250602221118.306395-1-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BN9PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:408:ff::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5574bb-6c19-479a-81e8-08dda2278929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fa4Nw0CrXqjKPUHMLWjZBLwDsbikMbnTPBV2jmsjssUVO5m+dbDmDMfcgywl?=
 =?us-ascii?Q?LwXCNThPeUD7CV/du9FaQiBt/rdRf0JX4CgE2N3iJMvjHhQQhFa0kguOLBsI?=
 =?us-ascii?Q?QmGZPylZVFYr4SAiCoMq8uBa45TzHsiflRn7le0UuXSdrVFSSUkB/acvx0bN?=
 =?us-ascii?Q?uCnWwUo34iaFKYSFxKXAQUwK1jtgGFTvGdWjelmAbFy/wAw4mSNSqRlgG5VM?=
 =?us-ascii?Q?cUj/maLWJbiHmlD+ZXQUfBoSX3nEuLC1KtAGTE8A3CaAi5FSSSlhQFRfyuci?=
 =?us-ascii?Q?b8MfhLBfbZtNYlpSf2j0qbjQ9oGt1JA6A+PN92M/yBQvqPw5OQgebd5OcKFz?=
 =?us-ascii?Q?5EEGbMFdL18lZnfzonNLf+QlDIhHA1AuwQNpzsdfwQjLkiuzOKojX3OQWjlQ?=
 =?us-ascii?Q?F8pY3fhgBVhSh6sBhApm/gtZuAGAuBdw6sDLy0H9OQaGg409BOPPu1IJ2VqJ?=
 =?us-ascii?Q?1mLjgINlcVYyKXOaNUuzI6roSAuju2LeG4U6C+v9B/fz79HSj+88+3wH7euM?=
 =?us-ascii?Q?oBuuCwahUEHQPLlPRWTlUioiT4FOwpgfor5fecRj5CAz1cR9r8XYSDjxQl4i?=
 =?us-ascii?Q?YrRr+VFbDcp4Q9yNHTjlMqMBFL2jlPoUpHf440nCAe8D0+/EUzJyDx8pyevR?=
 =?us-ascii?Q?LFTO3KwIhLZH555ChJTRx/8Ku9fZWv9ul4a2ntX+GkzDQEIvJjnat7iYwuJ+?=
 =?us-ascii?Q?lME7bSVMFR+92Bgk3RKen9QzqLW81iW+deQs8M/KpPBr3y8MUuCSBClEwO/t?=
 =?us-ascii?Q?7ALzLGoKeCGTkiHjLGEyyIlw109y6q8kwhCowJNvebs6rnClbtCTnpW9UvU9?=
 =?us-ascii?Q?HDW8GuEglRNFCZemfM17kHo1HF4vB3tR1ib2VGYhZiovORjcUDQH/ToHEGxQ?=
 =?us-ascii?Q?bq8zFRa/0yOT+ceC3RfVanRwxZbf4KoaT1b6hvHz1gkOq7rosOUpLUY1cApA?=
 =?us-ascii?Q?BJpvBfgGiuEf0XL+SOm5R8ZGT+Sw7KFNE8GFnzEIiLef6Gh9Gy74yQeTEVme?=
 =?us-ascii?Q?sfXJ7m2F/fREn3PdfFdxn5+Yw9xA8zu3R8aFa/d+AGYYtw6s+8onGWjd/00H?=
 =?us-ascii?Q?Lt8FjQnubSo6C6TgTTX8NYJbA8oyI6WpWvNcoNV99RaqT+9h6X9p2F1vf+nB?=
 =?us-ascii?Q?/wZFMU6dBHEm6iFxXkwPekMEpvPEGcdLW44pBGxA2hp5GzBPbVkcVoTGePeX?=
 =?us-ascii?Q?wP2KonuDTfL/Gw+XfajNyPDvFnwS77n6VGuj6dATY0LRg+9570skZecqEORp?=
 =?us-ascii?Q?26z2i2IswGAeMu27f3+8IeLWh/rDxiOu2I6Ii7oc1sfHSrHw2jqsz4bGEiy+?=
 =?us-ascii?Q?KE0Nb9gTr0+UUG5WKZmJD35o0n/cx4Q6KPvx/0/hxybwsP+xXpXoZiZcJif5?=
 =?us-ascii?Q?WdcxZb9ZVKy6J4OyZ7jFIEDFaRPA/DhNk6MqbBxh3+Jyouf7lYvbfvWkqSGC?=
 =?us-ascii?Q?gHOMfaBInx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLADoLVSN0HsOtLaU7jBwhmnGgrcSaewU8z8mwexfNhdmF92h54BIAp0sF8h?=
 =?us-ascii?Q?avuRJ/mB4lWUFtz3jmXjduGOelAVZmB/x1jaTzKaxRS6aWvTA5+4sCcDOsTe?=
 =?us-ascii?Q?QqxwhIDIHdang8fxx1ZjGHXVJqaV5WixRf33w0+qbOA3LSjnCTs5eaPyLOtS?=
 =?us-ascii?Q?JERh06bMHottWsmsj+UqQez9BR+YMLHoot9y0Tj0C4VbrQIKroMs7Qp5OhzA?=
 =?us-ascii?Q?I9juXCPPiD/hUNXUcaWeM6SJ5ri4fKrJYXWjm/ldDARqe169Bbnl5IpALfgU?=
 =?us-ascii?Q?pydfYIg+ewHJoAlBwOD6RZP/1Y9im+RAA4vGChklAsZOPbDY+Btr3+srl5mS?=
 =?us-ascii?Q?XD3IcvHQnYI8bD+DkKylkmWc3lwkvFc4u4/Pwx9QPpyuDHgLdVhLKiZnInOB?=
 =?us-ascii?Q?dPh8EWLg+TBSkzRzfShmpv4z1KZZuT2vScAY5WED2MInYORCDdcQlSP/N1vt?=
 =?us-ascii?Q?J5PmVWHiiDvR97Dn3Voz2dtzREu8CihUZ6rVsCTRNj7uCiIa5+l1SBLWer5E?=
 =?us-ascii?Q?PdALY2myhavmxYqf+mheodoupNSp90XC0lnQ84CjFm7CFnJUprr3mWyIJjhk?=
 =?us-ascii?Q?gzyquZrMrb64DyCivjYa5514v1fCcLrSpSkQaqW8o83WM93CFkVvhQ8G6Au4?=
 =?us-ascii?Q?0+gZg5PRNBrqWA0nfJN1uVYF0tbGa3OxoGzPFOjSEhM3kFIZ8AGN8f9/vw9+?=
 =?us-ascii?Q?IKgC9SxzgHaE2c3iHalUPJAlRsH6rnTNUAhKP29kx42OMu+aXIo3nP2IDUgZ?=
 =?us-ascii?Q?+Fs0lV/XXZtUzpLLjlUINBp1sGNIb4yTHjU2BnRNgWpCUEfx7TawxtQmNGSQ?=
 =?us-ascii?Q?FKjr9cQkSxOpVZu1H9Zo9SoCaQk18gs8935HhLp3iZTR+AMdTjox9Lh4afZS?=
 =?us-ascii?Q?Bz1jiVFXrYfT2jrMVUduw4NEZtL1KY0j2olf5gtFmZqIZe2jyyL5ApTz32tV?=
 =?us-ascii?Q?kmjQj/CRhlYZKJds3Pj0AwlBN/Kuz1YWaqYJ/0nlrrYIgD/h15y2fRbJmHtL?=
 =?us-ascii?Q?3e6rcDzw/aFlamB3SmUwOLbYZGx/luBHKnWXdHq4rRjwu+/WX5grGoKG6adi?=
 =?us-ascii?Q?eElh2olRpp7MgBfFEOMYrP1wxhaz8L66KXXM7Vzaf/b87v0+PSne5yCQf60c?=
 =?us-ascii?Q?vYI5QGtxjr4vCqmSLX7S3tlUbPwSheDhDt/nMa5AruKncdY0CsnWUp5zLplX?=
 =?us-ascii?Q?YJIBCrqHhYcrbbdxrKAITACNwrt/uk5FsFJzmAxRqZ8KbOQFIDm9YEl9Fv/I?=
 =?us-ascii?Q?GR+UAoEpB/9BFqjh/pg8H6RA6+ykXoIYcxyz2RmclqTtMbP1h/1JUAnHbnl8?=
 =?us-ascii?Q?Rvrr2nnBAwhRlKTD8gMqgbFZVtpkl9nriJgC9yKcVFCHADNrE/X41i9exwEw?=
 =?us-ascii?Q?yPe+3y3fROKICm5ZGm/+hrI3xPtLLS9Mt5JYKtdY26zI/WJ2Vl1yX4rgAXYd?=
 =?us-ascii?Q?co1JX49S1TYiZNOmG71HGSGbu776e1azh5EWKsergYh/7FubN6NfXC8rjHss?=
 =?us-ascii?Q?9VBXLoYFAtppOOApKvhpFrXqZQsAQeLlBTnkea2kQW9KBEZcQgi7TWJUzPco?=
 =?us-ascii?Q?iOhFyPC6TM2zFN/e9xTbe2lfSXCtQ09YYIsrKAfLXVqlBArDvZYOrPIRPBqZ?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5574bb-6c19-479a-81e8-08dda2278929
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:48:04.7228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K90WJaUlzDKja+dV6bjsSVy8JZGCJwM43B9MnWenZ6n44mfi6lGK0kuzmOFQfkN4BrYxbrHSOYlJod+NMSXgv7eczSfjMuQ/ERCh++8WUtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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

On Mon, Jun 02, 2025 at 03:11:18PM -0700, Vivek Kasireddy wrote:
> Some SKUs (or variants) of BMG do not have display capabilities and
> are intended to be used as compute-only devices. The Xe driver is
> expected to work with such devices by probing/initializing all
> other capabilities except display. However, the following crash is
> seen when Xe tries to load:

Can you provide the full dmesg log?  It's not clear exactly what "no
display" means in this case.  What's making the driver think there's no
display?  Display GMD_ID reads back as 0?  GMD_ID is normal but all
pipes are fused off?  Something else?

We already support other platforms with various flavors of "no display"
so I'm trying to understand what makes this one different.  What is the
actual NULL pointer you're hitting here?


Matt

> 
> [  115.582833] BUG: kernel NULL pointer dereference, address: 00000000000005d0
> [  115.589775] #PF: supervisor write access in kernel mode
> [  115.594976] #PF: error_code(0x0002) - not-present page
> [  115.600088] PGD 0 P4D 0
> [  115.602617] Oops: Oops: 0002 [#1] SMP
> [  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G     U      E       6.15.0-local+ #62 PREEMPT(voluntary)
> [  115.617332] Tainted: [U]=USER, [E]=UNSIGNED_MODULE
> [  115.622100] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
> [  115.635314] Workqueue: pm pm_runtime_work
> [  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
> [  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
> [  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX: 0000000000000002
> [  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI: 00000000000005d0
> [  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09: ffff8beb0c1b06c0
> [  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12: fffffffffffffff0
> [  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15: 00000000000005d0
> [  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000) knlGS:0000000000000000
> [  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4: 0000000000f72ef0
> [  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  115.738113] PKRU: 55555554
> [  115.740816] Call Trace:
> [  115.743258]  <TASK>
> [  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
> [  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
> [  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
> [  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
> [  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
> [  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
> [  115.774797]  __rpm_callback+0x48/0x1e0
> [  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
> [  115.782614]  rpm_callback+0x66/0x70
> [  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
> [  115.790173]  rpm_suspend+0xe1/0x5e0
> [  115.793647]  ? psi_task_switch+0xb8/0x200
> [  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
> [  115.802502]  pm_runtime_work+0xa6/0xc0
> [  115.806238]  process_one_work+0x186/0x350
> [  115.810234]  worker_thread+0x33a/0x480
> [  115.813968]  ? process_one_work+0x350/0x350
> [  115.818132]  kthread+0x10c/0x220
> [  115.821350]  ? kthreads_online_cpu+0x120/0x120
> [  115.825774]  ret_from_fork+0x3a/0x60
> [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> [  115.833768]  ret_from_fork_asm+0x11/0x20
> [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> [  115.833768]  ret_from_fork_asm+0x11/0x20
> [  115.837680]  </TASK>
> [  115.839907]  acpi_tad(E) drm(E)
> [  115.931629] CR2: 00000000000005d0
> [  115.934935] ---[ end trace 0000000000000000 ]---
> [  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30
> 
> Therefore, to fix this issue, we need to make intel_display_device_probe()
> return NULL if it does not detect the presence of display and ensure
> that its callers check for non-NULL display object before probing other
> display related capabilities.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++---
>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ++--
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 4 ++--
>  drivers/gpu/drm/xe/display/xe_display.c             | 2 ++
>  4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index 1d8c2036d967..c9494cbf5ba7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1705,9 +1705,8 @@ struct intel_display *intel_display_device_probe(struct pci_dev *pdev)
>  	return display;
>  
>  no_display:
> -	DISPLAY_INFO(display) = &no_display;
> -
> -	return display;
> +	kfree(display);
> +	return NULL;
>  }
>  
>  void intel_display_device_remove(struct intel_display *display)
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 3b0bda74697d..0bf8125aee8b 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -757,8 +757,8 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	display = intel_display_device_probe(pdev);
>  	if (IS_ERR(display))
>  		return ERR_CAST(display);
> -
> -	i915->display = display;
> +	if (display)
> +		i915->display = display;
>  
>  	return i915;
>  }
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index fb8751bd5df0..cb1928d52869 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -186,8 +186,8 @@ struct drm_i915_private *mock_gem_device(void)
>  	display = intel_display_device_probe(pdev);
>  	if (IS_ERR(display))
>  		goto err_device;
> -
> -	i915->display = display;
> +	if (display)
> +		i915->display = display;
>  
>  	dev_pm_domain_set(&pdev->dev, &pm_domain);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 3f92bf51813e..027690e4992b 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -533,6 +533,8 @@ int xe_display_probe(struct xe_device *xe)
>  	display = intel_display_device_probe(pdev);
>  	if (IS_ERR(display))
>  		return PTR_ERR(display);
> +	if (!display)
> +		goto no_display;
>  
>  	err = drmm_add_action_or_reset(&xe->drm, display_device_remove, display);
>  	if (err)
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
