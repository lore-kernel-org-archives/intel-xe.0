Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FADBCCD192
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529E710E80C;
	Wed, 15 Oct 2025 14:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbKxNIyc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755F710E801
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760537046; x=1792073046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jK838XzAekelYhfFG1WqAx11rp5/YOTopjqMzAx5x0Y=;
 b=DbKxNIycVUFHOmBSRx5WdmXLR7Q/P6OaIqf2CinQk2TuQsQsmlIOz46r
 zAd9j1Jj0ePuAOQRlhXckKnPJmltLduyw0zVmKu1b3YTWRzgBIn6lkoza
 DDQ6eLF+PWV/Z6+k7aP6SyNGWnUjjsOPfbgWIEfmNUszKZDzSuCxn3OXp
 J/0ggSlJLF5dw2WIWkmfBjinri0PG4gLBMs/7thJ2mJG82NEem8fk4yUh
 gZ92jkxL2BM2CG8C9QESaXD7u/JbIeJA6/1EUsSi9CEhsJyFY4T7sCPeU
 EIfyUW11YEwncGtaVV0jkf38i0napOPQS8PiCOZdOPIiaxD4+9m3mvB+g A==;
X-CSE-ConnectionGUID: oSDBxnRBS3W1paBLReM4GQ==
X-CSE-MsgGUID: eNOl5MtHQKaN4xEzJnXaag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66542807"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66542807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:04:06 -0700
X-CSE-ConnectionGUID: sc1sIqXOSLaoJFjzswO+hQ==
X-CSE-MsgGUID: yClAe99BSImT49v1RVVMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="186201792"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:04:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 07:04:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 07:04:04 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 07:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtefFZ1G4tfB3ZzpfK06657mUrf4OTLyq9LYH0VFSBzwlHFG/3Qh1Rv2gg8LaFEsspb+/Jhc+By1f8hlxfyMGPS4MrfrmwpV6XqBovmMm7Ciz2zl9xXGQCBHFdBaWrfkyDk0r/3BUt0u6skztmhghI0ExZEkm0/qv8ecxuTkrPDIqTdQKlOOQKU0KsZ7WCPq/u09ZCrVobjv2t6tWjSsIc0tTSk07Z1WsVvEXB/umHZ9gkJ9SoeD3N86ge8HuBAh7fH87HtG5gddvFW8+QA4mV8X2T82Om671eryLjs7Z1argChtZthPcSGl1mlpndSF93Q1u8LltJdzbsH0Kn14ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwrNedQyQgD0kP4yIn7fZ9/eQuCbu+lDeXLJaQBxrfM=;
 b=fSDSMR8k3YRHevxJu/hf/VF2lKX7NCUNfj7y85k/atbDo3JYyQeiU/UDDRvrHrKVUXHtE0gMllefBKAGDfb/WBsO8KU/CJYxfOi5/ENOLzWG7sdKSKgSQIdJsGddYXYiCv4CMoJDSrgUWsY0Cr2nEpiUHPxEqStP6X7hXF6RUhb9xiTaHpNe9EdYQ5LVAAuRzm1rXUKiJ6OLYlLSfb2Hy44ZCHUO8yujNHNOR3oiV0zayDEU2aQweBaj4iJhrO01NGV12UDGG/doq7ShmUXhnzgzJTQfgCcGOQ2TB+fJn93TOC4neUL6RmB0BgPBrgkJOA/IhR/tC0om/b92SGQVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 14:04:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 14:04:01 +0000
Date: Wed, 15 Oct 2025 09:03:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <jvumbsccpra6yu4vqn5xtjlmfn5n5cflr6yaofjazfylrbfk7t@qd5lkufxluxp>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-3-bfb74f038215@intel.com>
 <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
 <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
 <aO9BB6ZagPke7o71@bvivekan-mobl1>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aO9BB6ZagPke7o71@bvivekan-mobl1>
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: c93fc6ff-d181-4751-2a87-08de0bf3b186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q5VNtHawxDCdYla4stp4RlTy5udWTAua5L3SQ1fe9mS6fnwer6l4cleJj+l2?=
 =?us-ascii?Q?O3FiKYlUJ8UdXrKPi/5BR/qIioB2NZmvKZNJ/p11IOO5He8HQUjJJxr2E4CV?=
 =?us-ascii?Q?vv6BNvcANbfwXlADMAyV6j92405zJwn4Vh96UCWdhklsh/72I/Jh/DVh+r4r?=
 =?us-ascii?Q?HJHZ0QsYzc4RMXm95LCJjuId2TQzIcKmdHp1NvyKjq7kEA7atFkzDvfNEaTm?=
 =?us-ascii?Q?/KPt4+n0We0iEg98NG2hnQKTqP/tfiC5H3IAH8iXHnY5rbK7TbTimKYyDrTp?=
 =?us-ascii?Q?iRFSli7HEmcAJk6P3ibqjuruyhBkFvME0idUp4rI7J0g33hCXqVWTjEDapdA?=
 =?us-ascii?Q?q03FPIE1m3Nnh57HrahI/7ImBrEq7ic8tvhHOgZ4zP9mmYOJYPNR28kJitQz?=
 =?us-ascii?Q?Dz9K64OvrX30tJFTOeLHH+rW3XHXIMrUxgl5ZoIoDlpzRZwB31SBcVQ2PI90?=
 =?us-ascii?Q?rOLId3EEmpseKC38Ij+ClMjwgI+b60d+HXQhuXaC2367sHeajHmgDp2gOnwz?=
 =?us-ascii?Q?AY1b5El6S1Xzn8IsC5NJerYYTP4V28QR4LTYkpwyf9mpxqW0gZTpUm22oOYr?=
 =?us-ascii?Q?HAEyVsaT54XgRKx1LCnDBjvKUrlw3k6fFoRYRr1zTzDThkcPUovpbDmahlV5?=
 =?us-ascii?Q?IStvMPLaOx/r4uunBicadRmuxynKjyUrdrxVQfgS6cnV7KYbQP7c318UatUV?=
 =?us-ascii?Q?hrUZL6YNYbjzHUdiOVBOmddRpH2FILFgLO2WUoAAe4bF8lav6XGjOiX5rcaX?=
 =?us-ascii?Q?msFVYpGdSTvzsRSUG5XZxLrTWDdpJxxLqQH9eh8TQKG1UY/zJ/6j2emGgw9G?=
 =?us-ascii?Q?t4vGmmX1TU5GhNjp0HbQq1K+kfpjw6uY9vk5zbm/3wN+pK6Tac9dmQFsXAAr?=
 =?us-ascii?Q?/Pe5RyTg7TtPt+1DuhsAxgDhjRf0oEr2eXZbGfrj3sdqAtL9EsPPZ1uT+xxZ?=
 =?us-ascii?Q?BjwVqk5UHJt+F9vkFUEuzUgD2gjqJhOGbUj3XxqMAskOOQFtiwlOzh/NihBT?=
 =?us-ascii?Q?LyIFCWEHc4iTny4eo3rwiPemL7vKHFqWDV59kJGOIyUovNCxpS/tDuBLfnb8?=
 =?us-ascii?Q?MareQg9ZMe3yXWLIOpsX6xXcTarNxPjxyo7hcD9I+TCkzq78VC1fvX/IA3s2?=
 =?us-ascii?Q?JDY73zwQERDNyk28YHw6GJy7RAGkUQvSOouus0PuZXDvAfRII4EFPwwWn810?=
 =?us-ascii?Q?jUFvmoVYxHw6CWQeYrEI9XJz5QULVGUE5sxUjsil1CmhjMfNgTc2bcG/IJQN?=
 =?us-ascii?Q?/kb5zxCbsvngICMdIDMiq8wwY+TPlIyXGu+sD/BDRTlXNm0YEEXCd4E8x3M2?=
 =?us-ascii?Q?4lDyyOjOMTj5MCOlpEIvKOyLqJrIwIoRTaHCbhNAGYcU/pCj42ZQ+ASOkzTV?=
 =?us-ascii?Q?5t7lZ5/Jtf2RQE6hC3nz9d0tnXay4Xho0GOn+KvPhxfmSw3ejMMKynhnvPOB?=
 =?us-ascii?Q?t9jfN9EvHtENFCO3xSFYWenmnJ34CJXT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0YXF4xbGX4ePrOv1zxUErvD+evRziCaBtE9BbYx/Q6VP+L9pgR7mFU2WVAS?=
 =?us-ascii?Q?jSuiNuqlhsemWKXTZpn+JVyJibHfcMyVMBRIVoULE8HCBZcVcCHykiaG3J6l?=
 =?us-ascii?Q?7ILjuILoHrEi/d9emU9c8pi0q7rliCcsuv/M4MPVSFo1H1gKDMhqxiIY5faC?=
 =?us-ascii?Q?E7dmlsV/OC/DD1eXAg5ZAk0DwVGphOTwdldLFbn2udBWRxlVlu4mV57YRQ6e?=
 =?us-ascii?Q?f1fTHcQTnYkkiXRhLSwYGiSAxJYoxcl63orn331FxY7W2S/UImi1KGn49QUF?=
 =?us-ascii?Q?JlDQrCIZ/Gu9SSlC1IoGmlkfo1mYIPrQTZgD+Up2MWgBPF+TDzMA0OLAgpR0?=
 =?us-ascii?Q?0fQEQl+yYPVIyEKqq5ZBpjOoyLVxuLsrYa403mGmgOsSy8RskUUjEHRUxL+G?=
 =?us-ascii?Q?L3CFxozPUjLhp3uxXKsh8ffee+1H/oGTe2vQG8gK5S5VT4Sx1dLfZPkulbjR?=
 =?us-ascii?Q?HpDU4hzVBZbCBAXERGB7Sz3onHU3srN1d0D7aYtDbaodC35Tf8Bf2LdulO8Z?=
 =?us-ascii?Q?8bbiMCzSu3A36d/2JuaZ4xOYUnhvqLKsYe/UezPrT6id6PAGBMskwlOyHR9f?=
 =?us-ascii?Q?FIyf6e5dh6KFPB0O7J16DYSHgsNkudTl5iE5iUGEtZZo8SqEf2qCp9LOuCCg?=
 =?us-ascii?Q?bQYgqcNhuyvtdu3MHlvMLVjYrl9gMBfyHcyNBqB0K5nduVVeDMq7LsjIU19O?=
 =?us-ascii?Q?w62yqOE66ObiVpGyRB7bhEpQYJCNRKNbhnk4chNfd1hGg+N9kh3TGvs7HnSx?=
 =?us-ascii?Q?e02MdejPpgtWLmdyf1gEBB9sVpWmFL/o/ZlrrCC2UjMcxexuamk5lQCN+FaS?=
 =?us-ascii?Q?5/Rz4q6q0R5Nq9TWQySveXNM2FvIRFThaJOXBZiJJWnZOeU44iTu2LbVLvS3?=
 =?us-ascii?Q?jTDm9Z5u4qy59AitIooetPQ/axgIFNlCQQd8GTuUwdpI0JTIlszxRR0FKVzc?=
 =?us-ascii?Q?MTvp2ZAsKxHJzaPKFW+LecZJ0ic7c9IdgLQpKbl9O1ylpxD1pSBlHzK0q2QI?=
 =?us-ascii?Q?RqH8vpOcrSvFT1Zke8RZh9Btv9S+ossQTD+ZJeHPVy1cX4jGGu8xZVETSFNW?=
 =?us-ascii?Q?pz+NuVr6RBrEJtpixiHFuYBfaUSukTRvkdUWe/tem/Rsmrikd994xriV1OM/?=
 =?us-ascii?Q?ZAW4W6iW0Vlj/c7zuxSZFq6y7wp3qT3BgN8MzXLbzPEksFcxuV6Q0Tfrigeq?=
 =?us-ascii?Q?kj9LmJa77+K4WJYZaAkcKzung1Ximq7d16555bg32DjFqjcdswKlVIh639BU?=
 =?us-ascii?Q?WasxTZJY339fktGaUWoS3DKHBABtDtlbB+M5aRYwgKmVHYEMtiHu5d90vI32?=
 =?us-ascii?Q?1M/LcZbHxNpSXxDmUAByVkBPL+w+/cHniO/vC/XbkPAAuewPzia2EguurQDW?=
 =?us-ascii?Q?xbJOA8kb+uqjOy+enNeZzxv27bm4NqKxU0yqbjqmhaU2eNI5t7Qdo320RJBF?=
 =?us-ascii?Q?qopO/XORarglPUHHziHk/ArMyXzz7vNPO3wmmVGfeVFjoZU6FYlctgLMHIhJ?=
 =?us-ascii?Q?6vzF/VfbxyLCbmaRv1uG/3FHZjhjEPsZvwoZzw74Q+c+zJqwL9adowp2ZyEN?=
 =?us-ascii?Q?7ShbQSU6ltgUDMgMfhRdyh0huraJOXq2X/As0HhTAoR77fqiffnR70BIkiBg?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c93fc6ff-d181-4751-2a87-08de0bf3b186
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:04:01.8258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2N1w+wWhlixazc1exfDYadQnCiszgsNA0Uq+4/Y3dQ5D/66zLSYkR7Ytteg6ACd0LuI8kJr4UpZl+/R2R/fwJrfIrSUIVuoqUpRYaJ/lEHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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

On Wed, Oct 15, 2025 at 12:06:55PM +0530, Vivekanandan, Balasubramani wrote:
>On 14.10.2025 21:28, Lucas De Marchi wrote:
>> On Tue, Oct 14, 2025 at 09:34:03AM -0700, Matt Roper wrote:
>> > On Mon, Oct 13, 2025 at 08:24:35PM -0700, Lucas De Marchi wrote:
>> > > From: Brian Welty <brian.welty@intel.com>
>> > >
>> > > Starting from Xe3p, there are two different copies of some of the GAM
>> > > registers:  the traditional MCR variant at their old locations, and a
>> > > new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
>> > > these registers directly, but we need to instruct the GuC on which set
>> > > it should use.  Since the new, unicast registers are preferred (since
>> > > they avoid the need for unnecessary MCR synchronization), set a new GuC
>> > > feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
>> > > new helper function, xe_guc_using_main_gamctrl_queues(), is added for
>> > > use in the 3 independent places that need to handle configuration of the
>> > > new reporting queues.
>> > >
>> > > The mmio write to enable the main gamctl is only done during the general
>> > > GuC upload.  The gamctrl registers are not accessed by the GuC during
>> > > hwconfig load.
>> > >
>> > > Last, the ADS blob for communicating the queue addresses contains both a
>> > > DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
>> > > when using the MAIN_GAMCTRL queues.
>> > >
>> > > Signed-off-by: Brian Welty <brian.welty@intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>> > >  drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
>> > >  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_guc.h          |  1 +
>> > >  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
>> > >  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
>> > >  6 files changed, 43 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > index 51f2a03847f9d..47e13a3fb9072 100644
>> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > @@ -545,6 +545,9 @@
>> > >  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>> > >  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>> > >
>> > > +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
>> > > +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
>> > > +
>> > >  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>> > >  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>> > >  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> > > index 5df2ffe3ff838..9d710049da455 100644
>> > > --- a/drivers/gpu/drm/xe/xe_gt.h
>> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
>> > > @@ -22,6 +22,12 @@
>> > >
>> > >  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>> > >
>> > > +#define GT_VER(gt) ({ \
>> > > +	typeof(gt) gt_ = (gt); \
>> > > +	struct xe_device *xe = gt_to_xe(gt_); \
>> > > +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>> > > +})
>> > > +
>> > >  extern struct fault_attr gt_reset_failure;
>> > >  static inline bool xe_fault_inject_gt_reset(void)
>> > >  {
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > > index d94490979adc0..37e3735f34e63 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > > @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>> > >  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
>> > >  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
>> > >
>> > > +	if (xe_guc_using_main_gamctrl_queues(guc))
>> > > +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>> > > +
>> > >  	return flags;
>> > >  }
>> > >
>> > > @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>> > >
>> > >  int xe_guc_upload(struct xe_guc *guc)
>> > >  {
>> > > +	struct xe_gt *gt = guc_to_gt(guc);
>> > > +
>> > >  	xe_guc_ads_populate(&guc->ads);
>> > >
>> > > +	if (xe_guc_using_main_gamctrl_queues(guc))
>> > > +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
>> > > +
>> > >  	return __xe_guc_upload(guc);
>> > >  }
>> > >
>> > > @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
>> > >  	xe_guc_submit_wedge(guc);
>> > >  }
>> > >
>> > > +/**
>> > > + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
>> > > + * @guc: The GuC object
>> > > + *
>> > > + * For Xe3p and beyond, we want to program the hardware to use the
>> > > + * "Main GAMCTRL queue" rather than the legacy queue before we upload
>> > > + * the GuC firmware.  This will allow the GuC to use a new set of
>> > > + * registers for pagefault handling and avoid some unnecessary
>> > > + * complications with MCR register range handling.
>> > > + *
>> > > + * Return: true if can use new main gamctrl queues.
>> > > + */
>> > > +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>> > > +{
>> > > +	struct xe_gt *gt = guc_to_gt(guc);
>> > > +
>> > > +	return GT_VER(gt) >= 35;
>> >
>> > Revisiting the spec on this, I'm not sure whether using GT_VER() here is
>> > actually the right thing to do.  As far as I can see, the media GT does
>> > not actually have a "main gamctrl" register range at all (i.e., bspec
>> > 76445 only lists MCR gamctrl ranges, and 0x38EF00-0x38EFFF falls within
>> > a reserved/unused block).  That means that registers like
>>
>> true
>>
>> > MAIN_GAMCTRL_MODE that we're trying to write during xe_guc_upload above
>>
>> We do have MAIN_GAMCTRL_MODE for xe3p_lpm in bspec 73540.
>> The tagging is odd, but there is a reference to the register at
>> 0x38EF00. It wouldn't make sense to have a 0x38xxxx register instance
>> for primary/graphics GT.
>>
>> So either
>>
>> 1) we don't have it like you said
>> 2) we have it and there's something missing in the MCR ranges
>>
>> > don't actually exist for the media GT.  Furthermore, the tagging on the
>> > register detail page 73540 also seems to imply that this only applies to
>> > the primary/graphics GT.
>>
>> so... in that case we'd need to check both the gt type and graphics ver,
>> so we load GuC with those different flags. I will take a shot at that
>> and check if anything breaks.
>>
>> Bala, since you did the patch following this, do you remember of
>> anything related to this?
>
>There seems to be a conflict between the Bspec and the HSD. HSD
>16017994409 and the HAS claim the MainGAMCTRL is supported in Xe3p Media
>IP whereas the Bspec page 73542 and the Steering table show the
>MainGAMCTRL register range as not available for Xe3p Media.
>
>For me it looks like a Bspec update issue. We have tested and verified
>the current implementation which enables MainGAMCTRL for Media.
>I would say lets keep the code as it is though it conflicts with the
>spec and raise a Bspec issue to get it clarified.

I'm circling this back with HW and Spec people. I also did some changes
local changes to test. Although since the old queues are still valid, I
guess it will just pass, but without this optimization. On the other
hand, I'd expect it to not work at all with the current code if it
didn't apply to media.

Another point is that we can delay this patch a little bit, since the
next patch turns this off for media with the special bits set.

thanks
Lucas De Marchi
