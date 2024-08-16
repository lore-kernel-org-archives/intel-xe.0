Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EECC52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 02:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C4E10E091;
	Fri, 16 Aug 2024 02:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5dWRjL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6165110E091
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723774746; x=1755310746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gMg0YwY1l0oaym4hO5yCkH4K0WOx1MV3jJBqB/ZBavM=;
 b=M5dWRjL4ykFNalWMtKTvliiibuqBTseDDxF0iJuFJr3c0QcrRQOre/Eo
 c3e8b0fyDj5eEEuDZsj8k6hKl7zqxyhx3e9HvRJlQmcGU5olYJveH+rbf
 Y77Ld+YGFCOUUXwMsfI7+pHGYuDZ7rXXXx2ntIOfD+W7t3Vq6WnvKqkUw
 p+vybyFgFzOALoPjPyrd5pRB1IB0cVb2A3xNeK34mFgoDoANkmQChtFln
 3fAyeirvnUNwXJA8oVnvraAHu1iNTSa7vnc3Php8JVolq04SN2CfIXy43
 TU6HTNwgYTj6zLhraTsHGdfM9iAuhiWtxj1b4Nn2JQpF34/lIseHxN/Se w==;
X-CSE-ConnectionGUID: 4F84o330Tlmkqlo24hfF0A==
X-CSE-MsgGUID: NN90RYTsQKidinU5/8brQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25929150"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="25929150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 19:19:06 -0700
X-CSE-ConnectionGUID: mttjZDxBRNuJFv6Yc+ONvw==
X-CSE-MsgGUID: 96hpfPddSn67jDTOF4eSOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64389703"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 19:19:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 19:19:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 19:19:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 19:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i91XZQtfs5OEkRlinzCwaSCWVoF2lkjm9snLqCh5IB7DD7aKI9JLTKN2lubvcFTrh/9HXRbKWDHtMtP9C2yayj3NvbndffqVjJWYCh8vLsD/43DkJpk72RWAytdWtLC2iTaB9cL62FUKOgZH/0hBxIp125sOqorMUCXVate0jUDkw7KsowiWoJKSK1iBIkwdBWlz8qhcwWb9OWTQDG/JLeVTUHASASaJkWiFEhK2pTPUd0TfqhjXC3efTXwxyOLXTVAndxEVrNFsD2Qi2z77SUb8WswcFV0L3F9gJOfBcxdV9/5WESGzVbICgQVc4Do6xneRQCYmUR2q7kCNUoGD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJOzTik7hiH3zNqu4u2Swxejg1lMf+pom1RPmaij8Ek=;
 b=EKOreXg6NK4TKoFn9Lvp6KEYP2W2F0WCcWz8lpQO9KQt9J2U48XYr6Bd7ON+30keunFajS5ifoXCHK6Xxwn2xOBxz+aM8tBNVB9BhpxXRtfhXwWfm2Ey4VP60dSOPD55U5kSs3Spp4IRpxWZMy+kI5O0XjlnK2gpaDsLn2o9osQhVynHgMTrI4LaWuKQpCWbD7ujmgmYrMraZ6V7GrbdtX9PGhH3CSAryucQQqmClwsiLUKYW0Oeq+HN9SZYL6wRzHfQr/+02SP0E57CiR2BriFdjpJWpco3rEmqRcfy+edolJnVNb6NghcSnpm/x8yAvtzOnVkftRtfQ060EC4C1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 02:19:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 02:19:01 +0000
Date: Fri, 16 Aug 2024 02:18:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Message-ID: <Zr622GVl0utsp1ui@DUT025-TGLU.fm.intel.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
 <Zr5gTbtkpfqlGgsx@DUT025-TGLU.fm.intel.com>
 <20240815213837.GJ5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815213837.GJ5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce0b21f-858a-4d4b-52a9-08dcbd99caf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kdzs8zO6sQ85YQ0/BKHHcyEZtUJN0HiaeWEPEAnS4uxvMe9xpMqmPdTIRF+t?=
 =?us-ascii?Q?1wASvjYx0ZzLC7g34+m911pJ1NFuMK85tCmQcLJZuvLZEbtqaYtWC7RHUSrY?=
 =?us-ascii?Q?6OSTEed2RkWdx3pKAVX/+DTQw+guAHjraj07sA330hSFWsp34R2e9ydUNWIN?=
 =?us-ascii?Q?nCCVzmP8vufDxzVs6SzI/izZdliW2YNAhS6uxLPQ49/ESxLWvll3SaF2Zs42?=
 =?us-ascii?Q?pUeHEtmk5PRtSwNWhXie0rbWfNpQTtuEQcOC/AtwXaumrogAuy4o4Gmz/Dd5?=
 =?us-ascii?Q?Il4Vz+H4NrDNQNvIfBVEmZ6IdJJ1Ki0iMdAqTDzIWQhEWAzDuDIRB/vnX4rB?=
 =?us-ascii?Q?jYgpNn6GYlTWHnBhA8JRyGFeHt/73+MUBKtGh21v8dq25YZ4TAPtKDyHDRiU?=
 =?us-ascii?Q?TQJLqSjcuUIiFouWV2hHTa/CN1g4w2Sh3lFwHYBFZknyC6/o6R3z/DkPRigA?=
 =?us-ascii?Q?JMuwuyar85XkO8RcVtNHmlDhIoZKOI3NrwrNOe6qVz2+Yh0QrOmd54pibeb4?=
 =?us-ascii?Q?fi2DLU96qX5VowKlCWWWPfaRka7+yI9LNCbdJDdnodSDa5K2hj2i40HN7wNL?=
 =?us-ascii?Q?zJmVWKkYQK2QIFWPuFZ9SIJMUSeMlS7jWptTUHssVopBZ3y60FT2eFSZ77ut?=
 =?us-ascii?Q?hsQfY8OelApqHI8SmJoPk33v0cs4pPwMj8+833b4TPB0n7SRhSAFNEKhR2XI?=
 =?us-ascii?Q?OS4DBC+sCFslmnnjtMtJposEd7wV3h7mQgX2q2Nh1G7f6JmyWBD7U/Pm8NDO?=
 =?us-ascii?Q?PAhaQJ+1aQQzLHg6QeQXfFR+dhZRsXEXcKmGKimhPfYIISMvhTawI9i1saEB?=
 =?us-ascii?Q?Jnxyk5u4517Eo5PlQcdNcQZWtyZMLNXqm3uhgH42j4yJcnjv5TpMJP1IUjAO?=
 =?us-ascii?Q?gNpxVwtXubKxckEpRexukTtiz0l8vKDRGdLv8Z/mtE55NGy0kdHs7og1RUz2?=
 =?us-ascii?Q?pLh9NbSaGcgtEKtYdtU8+FJCaA1oLrujhXvXc+MXUqWbKtWrL2WhAhniIPxx?=
 =?us-ascii?Q?Wd2PwFMwQGHq2N1djGx4oQ/9FRwGAyfp1p6OiAJ/35F09K8H8IZDQnKgTN04?=
 =?us-ascii?Q?dsB9MLztZY4ar50gwgTt0ev0RD86KDS1J9E/sqLYE8g6Z51wvlPbNvYATkic?=
 =?us-ascii?Q?ARBdY45eB3n960oN446Ec4DkBjtN32DeA3XXelCsOzpv0nBzhU0/9Q6VjA01?=
 =?us-ascii?Q?AiZBfM/P/pSmtC7M5OMvR6SKSB2jPtui/3iDC7/Vqx3Wh+fENcdB8klxKlt9?=
 =?us-ascii?Q?gSax2wMr2Ihn8vFDmyYBFowrtyMWEq+4SYODJXbzHXRvKKRpbEtHS9KTrPeQ?=
 =?us-ascii?Q?FJ7wiIe7u8pmfqclaVxFJ07c8orUQWK0bMCnaSOITqsJaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mPSQm0C5ksKuyiLnYYubX+Iw4byd9oTDXv3NtHsNBTfgLuT6iCDxWD1+qNj/?=
 =?us-ascii?Q?/ntklgU+K9tTxdg5VB3I2JZq8y/ZxHskYBsHszlxYaHj9mZrFSQdJBiuOtKD?=
 =?us-ascii?Q?tlj6awaQ8v6MR8GohpztOPI+FF5d2ErHXnUq0+RmYPv6JWJSCPXbls15jDkH?=
 =?us-ascii?Q?QBY3ap+gYQI/hMTBR/KumzMQV5XaMcJp/KAK2MY9RFKztoW09sD10q+VU13U?=
 =?us-ascii?Q?5yB5EoNl6V25qK8MWjLMalTB8Lz3vM/isHQs0MpXKF3p1WXYNzo6Sbb50fzJ?=
 =?us-ascii?Q?MiHPWbX8wrXrCKPd3AZfXkRNNPON8PihDULhiQN1LcXR5Pa42lp6qU+DGeO8?=
 =?us-ascii?Q?/LhLwbA99Le7wMiD5GJecT/w7D+GVJ1sP224YIlTyzB6fQHOK9HYdA+4laCU?=
 =?us-ascii?Q?rKonAhUMsk726JZshkKZeSNcfTczikauMmTzU31Dx2Bt1QX4hocN8LLxyP1k?=
 =?us-ascii?Q?d1PF5eo4eVEELNbR6TFa2mXqDyGwWvMIMtqOHT8ryat7KDo4/2zrWyMcWo4Y?=
 =?us-ascii?Q?Vkq5LCWAIQh85uYsOQtOwn4EbuYZLURGdXbn3y8xCnFqa5s5rRcPPLkehKSL?=
 =?us-ascii?Q?G/lniYCHgpv47tbcSRY79pnYsrCFC0AzxDe/tLiLpu4utsVARxSH25oA6eTD?=
 =?us-ascii?Q?/M0BlxDcl14G4+cH1ONrqaCzskmE4WjwEkWQgXLoKJFeKpEmlYTEc1eMs86t?=
 =?us-ascii?Q?hYN6NahM55hJAo4V1eD0lke9dfwxnJ7ke+XFfXDzsAjd56OacdFkXDVLhhYK?=
 =?us-ascii?Q?JvGbVaEVZ1TJEbA5TAiH2CF7ki18R2qpWlBJW4cned3BoEs6ex4PC4EkoAMg?=
 =?us-ascii?Q?OEyhtIhOcZqFF5JHotEoxkRJOu21Y7LPeuu4qn9zOTIj12lVCqWdmEKI1R46?=
 =?us-ascii?Q?rGXtEOJEZoNuaiiluXqlUO1bim8WSscbphRlvM7Q5W3QlyuLDbbWpshUTgfY?=
 =?us-ascii?Q?D137NTXGBexWEUhJjKklACvf60QJcnR1WfTq/uwXQMx44rBLPSDbhaNj5BSA?=
 =?us-ascii?Q?nui0DqXiu7S3rEak8PZVFPFx6JeeoeIBmIxof3rH5PUBdVXbbPJs+DmIyv+y?=
 =?us-ascii?Q?YqmrOQ9fQFt5mD4/SfuBvApsL2za5nFeQTnX3kPERvnq3KmUsMz43suLY9Wc?=
 =?us-ascii?Q?C4RezttrOKEkycbeoS1b4JA98Xe/YOgLsayvi7wVjHDcoIAmyBF37KePlCjE?=
 =?us-ascii?Q?OhZHuA7wuSIAYONOFLvKFDSf4oIUiQ8qL1YT6H922XUO/m9XArfnIzc2DC1B?=
 =?us-ascii?Q?R8KvH4s89DfCmTPjJZawD67j+KKZj8JYbqbHGv0lncyahnovEx7eZBMzK3hV?=
 =?us-ascii?Q?DjCyI2RL+gQhFzWS160NwYAYJsA7EzgBYa6Nm3CZ7Jfxq8lh5BJ5mTq/Nx98?=
 =?us-ascii?Q?ZhTYrVJ/m9fBicAcbV2ddb9elHYBWihLcYfx+jZdL2c2L6cmqVwGhiEdhkgx?=
 =?us-ascii?Q?0gTUTd2UGu0IeWW6FjKWT+SROXY5qTc7kJQbnarThhNU5O4v2tIcpQWZ7ElS?=
 =?us-ascii?Q?pYMXaBTst2OboeRmsHfMQwCE7IIiNr3u5/qQEMGsOBbqv2nFk2x9bhh09zuh?=
 =?us-ascii?Q?JPVo1TIwGZAzwXFTic2HjdSL83I5odqi6cAGwsqf7C6Od1Q8Zqu5z+sC1Op0?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce0b21f-858a-4d4b-52a9-08dcbd99caf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 02:19:01.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgCkNOLOYywj0hXFBTvLqF4XegM290OKHEvG65nv2gXfxYYPKtkXgdeaHs6i9SarPrdXKToDZ7Lo4/JAE/0cmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

On Thu, Aug 15, 2024 at 02:38:37PM -0700, Matt Roper wrote:
> On Thu, Aug 15, 2024 at 08:08:45PM +0000, Matthew Brost wrote:
> > On Thu, Aug 15, 2024 at 10:26:03AM -0700, Matt Roper wrote:
> > > Although the query uapi is the official way to get at the GuC's hwconfig
> > > table contents, it's still useful to have a quick debugfs interface to
> > > dump the table in a human-readable format while debugging the driver.
> > > 
> > 
> > Patch itself makes sense. Question though, would this be useful to
> > include devcoredump? If so we should code this with the snap semantics
> > for decoredump. See guc_exec_queue_print() for an example of this.
> 
> You mean include the contents of the hwconfig within the devcoredump
> report?  I don't really have a feel for whether anyone would find that

Yes, exactly - include hwconfig within the devcoredump report.

Don't want to hold up the patch as I said it LGTM but just something to
consider and if Jose (or someone on the KMD) indicates this could be
useful it is easy enough to change to use snap semantics and wire into
devcoredump too.

Matt

> useful or not.  My personal use case is just being able to sit down at
> an unfamiliar machine and 'cat' the debugfs to see what the hwconfig
> characteristics of the GPU are before I start doing experiments.
> 
> +Cc Jose for a UMD perspective on whether or not it would also be useful
> to capture the hwconfig contents in the devcoredump for userspace
> debugging.
> 
> 
> Matt
> 
> > 
> > Matt 
> > 
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
> > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
> > >  3 files changed, 70 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index 5125d76ccfac..8f95d3a5949b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -19,6 +19,7 @@
> > >  #include "xe_gt_sriov_vf_debugfs.h"
> > >  #include "xe_gt_stats.h"
> > >  #include "xe_gt_topology.h"
> > > +#include "xe_guc_hwconfig.h"
> > >  #include "xe_hw_engine.h"
> > >  #include "xe_lrc.h"
> > >  #include "xe_macros.h"
> > > @@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> > >  	return 0;
> > >  }
> > >  
> > > +static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> > > +{
> > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > +	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct drm_info_list debugfs_list[] = {
> > >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> > > @@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
> > >  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> > >  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> > >  	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> > > +	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> > >  };
> > >  
> > >  void xe_gt_debugfs_register(struct xe_gt *gt)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > index d9b570a154a2..025bad701556 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > @@ -6,6 +6,7 @@
> > >  #include "xe_guc_hwconfig.h"
> > >  
> > >  #include <drm/drm_managed.h>
> > > +#include <drm/drm_print.h>
> > >  
> > >  #include "abi/guc_actions_abi.h"
> > >  #include "xe_bo.h"
> > > @@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
> > >  	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
> > >  			   guc->hwconfig.size);
> > >  }
> > > +
> > > +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
> > > +{
> > > +	size_t size = xe_guc_hwconfig_size(guc);
> > > +	u32 *hwconfig;
> > > +	u64 num_dw;
> > > +	u32 extra_bytes;
> > > +	int i = 0;
> > > +
> > > +	if (size == 0) {
> > > +		drm_printf(p, "No hwconfig available\n");
> > > +		return;
> > > +	}
> > > +
> > > +	num_dw = div_u64_rem(size, sizeof(u32), &extra_bytes);
> > > +
> > > +	hwconfig = kzalloc(size, GFP_KERNEL);
> > > +	if (!hwconfig) {
> > > +		drm_printf(p, "Error: could not allocate hwconfig memory\n");
> > > +		return;
> > > +	}
> > > +
> > > +	xe_guc_hwconfig_copy(guc, hwconfig);
> > > +
> > > +	/* An entry requires at least three dwords for key, length, value */
> > > +	while (i + 3 <= num_dw) {
> > > +		u32 attribute = hwconfig[i++];
> > > +		u32 len_dw = hwconfig[i++];
> > > +
> > > +		if (i + len_dw > num_dw) {
> > > +			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain\n",
> > > +				   attribute, len_dw, num_dw - i);
> > > +			len_dw = num_dw - i;
> > > +		}
> > > +
> > > +		/*
> > > +		 * If it's a single dword (as most hwconfig attributes are),
> > > +		 * then it's probably a number that makes sense to display
> > > +		 * in decimal form.  In the rare cases where it's more than
> > > +		 * one dword, just print it in hex form and let the user
> > > +		 * figure out how to interpret it.
> > > +		 */
> > > +		if (len_dw == 1)
> > > +			drm_printf(p, "[%2u] = %u\n", attribute, hwconfig[i]);
> > > +		else
> > > +			drm_printf(p, "[%2u] = { %*ph }\n", attribute,
> > > +				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
> > > +		i += len_dw;
> > > +	}
> > > +
> > > +	if (i < num_dw || extra_bytes)
> > > +		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
> > > +			   (num_dw - i) * sizeof(u32) + extra_bytes);
> > > +
> > > +	kfree(hwconfig);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > > index b5794d641900..7df315900e1c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > > @@ -8,10 +8,12 @@
> > >  
> > >  #include <linux/types.h>
> > >  
> > > +struct drm_printer;
> > >  struct xe_guc;
> > >  
> > >  int xe_guc_hwconfig_init(struct xe_guc *guc);
> > >  u32 xe_guc_hwconfig_size(struct xe_guc *guc);
> > >  void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
> > > +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
> > >  
> > >  #endif
> > > -- 
> > > 2.45.2
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
