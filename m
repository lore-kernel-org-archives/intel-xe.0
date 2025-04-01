Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E284C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCDC10E65E;
	Tue,  1 Apr 2025 19:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WuRhxcLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ECC10E65E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743535320; x=1775071320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K7UoizLrTx6ZQ4hdyVC9iU9+mNS1Ed/lcmwpD0nBDWY=;
 b=WuRhxcLrrTGA/CNBMPQSD0Q+RGY0K3W2W0YmS8l4xdxcE0auEJEp7vFG
 w7p2QJs8YBXS1msdN53mAz8KxrBggp8RvL9+Q+QipCt3VnCvjBW9NEzK/
 af7V9oOp/ktdb5kIx9GyhcsT9x4wxLUzKAG0oFN3rO3+UPWFflnjt5O+i
 xmOX3DnwyDZARfLRs3vzPModra9kbNN/u2IPHahI3xwiCKbcjkqLxDnfT
 JY1sIntMlYM36wviVesjaIsafLgaeeb/NZYuyycHAqxcpl8C/QIE78qCD
 M5x0wy0nJaBmHQlLjEzOb0Tkq3/mJF85U81peCRlcK3rVbOf3CTP1fYgG Q==;
X-CSE-ConnectionGUID: vtBsGtt4Qbmn0Z4KvLFNAQ==
X-CSE-MsgGUID: 02jfC3xxQSSubnG+SqSGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45049810"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="45049810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:22:00 -0700
X-CSE-ConnectionGUID: uCtAV6+qSYKg2JxnmnuHnw==
X-CSE-MsgGUID: DW0BCPPTRjubTlCcUf9aAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="130591662"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:22:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 12:21:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 12:21:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 12:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B46UCBdrF3osmUc+MiHRcYLi/2Ojn653BQMMioz/29/KRcyc62vvmAfbGDNaxd8KfuJBF36uJs0+GQxRUr8vFQOYGWbnCNMespqM03Eq+dQQF0NmZSamDK8elp7hztOsv4eLoQ38EFIPGSDYymxaaB61OR43EO2CP7IuAA/nzg9PLxKxcVxuN4murT/bT/Qv3UcaaKrJluS87B1JBG4tnmQiNk/5jx9ZiXBIgmZuBPfjJe+RWOSMYIG0wkt8rkPURO0HeKLNCsFP9+xMwdEXdtNTKdN/aHswlVPkAT6Ydw5Fhgt+0w+fXPTzXygd0WvsUUzPOf7hSyrNfCvpN+dskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7UoizLrTx6ZQ4hdyVC9iU9+mNS1Ed/lcmwpD0nBDWY=;
 b=YP4+3XYcjPofZ5ZTknVplnfVOGx2vnqMQB0hPdaV3HaW1ukd2yhjpIAtnpVMNYxZ1RkdN/Tu8XAQaKSR7/dmSPBicKBxMW0rUs+tMvaLzv5hupwoalAahzANyhD+Sw2wR7UqwGadu6VZED1gWoDsJ7SxYxyy962eMWIx8IMiA+BnN25EUUMfB3CJFEwfx1dwR/O8hYS3D7lHsQy1SYMccJbiGv6WvfYQPovgx898RN063VUGlaS1STxOkFD2C8zQvt5Us7Kh1eiTnB7bFrZsAPiZrU2179CC9dqjzriA/9CRUsOP07Iju7+0SdAo4RkXLq0dYmTIAyDu9tFgh3pwTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 19:21:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 19:21:27 +0000
Date: Tue, 1 Apr 2025 14:21:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/xe/gt: Inline all_fw_domain_init
Message-ID: <7skyjkes6hxywuagmvbv24dqysoflphzldw2mmcsje52vw6kv5@5wbqouq4slvz>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-8-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250310200653.89731-8-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:303:84::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 53469a2b-f8ba-42b0-f7ed-08dd7152663a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KHIbul5py9/KUHKjAuy5DQF5IY2kwksJCpNknDNruK4xOqZDUjbmqIzJw0QD?=
 =?us-ascii?Q?jVbFxQK23/RThfNexGHHuJTWNYkNpi0brDf1G4yHMaQ9gIJnOtdSv58uHKwm?=
 =?us-ascii?Q?iYiVVf6Ywj2IiSrNHB2ZGlfYeNgmyRUYAOrY41RnJmV0O1CPDGzamszOi5Cl?=
 =?us-ascii?Q?HuF+5/Ri0vLut179DbozLPwBvxBG6oDRbpGC9UHDebY8XBTJQZqqDzQ+qsiM?=
 =?us-ascii?Q?Sbfn+0Bq/yxk+zIcYWjyc7uyVXUMBLxQ0+5tnM2yz5bmpZPitzecmXHzFobx?=
 =?us-ascii?Q?yCq0AJ21r4TWlXZLeddr0cGsD1ES7Mnp0v+7ENFidtjF3c3n3/buCgsS2dqs?=
 =?us-ascii?Q?tJdcQLXSJKwcltsB+QST+BAQz4mGjqLQgbMgCYhtFPkrqlkcfxv6GM/XV9MI?=
 =?us-ascii?Q?+ILqFyJ03tyaLHBjUXj0llFX13Vn1oFR9bCjDqwDVT0NaXkBrxpaI2CfMiVQ?=
 =?us-ascii?Q?XzOvpAvL1dMsNyLa5eRQ5WiKktyYfvSF33ZY1SwhQ4alZh7G2E64laqyDjXS?=
 =?us-ascii?Q?zxW3MamD7i+lSkjTNavxP4LYUTTup3gN55KG6vyDaxw1tJRhdZ9XeyaS4ehT?=
 =?us-ascii?Q?FTGuSWHX6iKOt8Sft/O0jLla6YjTIZ5u+JNIt88yzrIchPyEqCnPtAkKLViA?=
 =?us-ascii?Q?5SLfvEgQDqaCMDHJYBvKoQUPt1nhdDBy2KviA4XKCr8zs/JMveFNuOxhnIZS?=
 =?us-ascii?Q?kpjZq9y4N6V5wcKqpRko2tEooEcHzGZuRi0OWglke0Bueii7UKkJsTyAUeap?=
 =?us-ascii?Q?6ZPthHiOp3QgrrHtkEe8YurlP5JVrX9Vb+73ZdqJidBCxB12bpcnqiddMXWp?=
 =?us-ascii?Q?aIy67V3k9r6EFxBvPM4/JR3Hj64ihwlzLjbBUwq6dMUkJmRsmfok/e7YBvMM?=
 =?us-ascii?Q?t27ThjyZpiJCqHx6QzgrxbcCmBxwfK/AYjokDHOissR407PuD4LK0pMcRfSN?=
 =?us-ascii?Q?pYfKlv5OhhqxGTpVgFg2qXijyfTLvINSySxo3pEogjBkTy0w1iYDz7k8PT8f?=
 =?us-ascii?Q?c0HRYBatjgYiIgMXyt6OF3iI3sUqf3XCmzAee63nFPD+CP7epbwBW0p9cjt4?=
 =?us-ascii?Q?Ij7N/PUub5+vChkYttzPXQabTDxge1lqZCbsAqy3B4WtFXrn1zjfJ42XV2GD?=
 =?us-ascii?Q?cZkLp8/3/Dwoc4ODf96gp93tuKl5ccMgbeK1U6oP1GaxQ8WmnM1DTCvFqV7C?=
 =?us-ascii?Q?vX583NhuHrPXWx/vt4xdGu0kJE8I7YZYC2+iCK76iy9OJTHQMQAjCUPRBbC4?=
 =?us-ascii?Q?0/YSyQumqBRhiO3oSvGAyY/2k3ih6VVXbvsjn6wcB/+Di4CTWF7GzIaJk6Kn?=
 =?us-ascii?Q?XZZO6IvqLbwp9S/ZZHR3yyMo1jrpEqEp/SBGiDvDJKZUFPmA3WFDjS77GEnH?=
 =?us-ascii?Q?rLcdOqhShYGcxMWcvtgWI0sSuzKc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocDIfO/NfrWTxaxVLT+sHUiKUQ4FkOoC48Fo713m9ImEWat8Nj2X3Q28KlwY?=
 =?us-ascii?Q?26RdnOI64KosY9CrOdK/PpcBjuk/Z8WWZJ8MDP+m/nQ1mQtFwM3qqUP+K5Fr?=
 =?us-ascii?Q?sFRXXL0CDAk85v+UatRRK+FWyA7Rgz00x7rV5QKpJJr4/x6ZPg2rrrxkqOLN?=
 =?us-ascii?Q?Xtyf7VxUTI56FcunoqO5XlX0t2rCwSFa2FQ4oYw3U6AFNd14egDHbyMhi5IB?=
 =?us-ascii?Q?8DHli8t7bIpFomE1hsGE8QU+zHX+CWsXZcxWYOIHxBaq4FkndDs/VCsVdq1L?=
 =?us-ascii?Q?s7t+Eg3jJBu3yiwRrLwS3V7tcW2jBrdSyb0HCdQGn5quo0ZZJYo+kgnc7bU7?=
 =?us-ascii?Q?tkAPm9j9e4XP4/tr1p++EQrSykuPXNM1NRJvkwq7bR3Td/fq5xBofbmsFmUz?=
 =?us-ascii?Q?jOHUJDaqM++qQ9dj0dXnVA+z/lIAqOavw9qS0lFMopwHEPzRe0eXhKKLNv2C?=
 =?us-ascii?Q?1v5yBfbMxSAYc7EBRjjf/BYnfjgz4Y4g5mSBjnkeV+An9iWNrobsVQKdoCf9?=
 =?us-ascii?Q?MJWo6/JpgwLpkYpX3KPKKJVs6e/YwakfRE/I3s74l+zHbaZS5BZUjZIt96FV?=
 =?us-ascii?Q?ydF1FVYW6kNfA8l/u4lgzdJt3yiZworpUzs/C+hyiwoG9/CRT/dADY2lSrKy?=
 =?us-ascii?Q?wmlk1/ephhMoOfSKvExk+k/gFrf60H6lTpXBgMC7h5BJ1DbXJOTm1SP6v94e?=
 =?us-ascii?Q?XqHSA7JOiZIkgRk/7/OqE2cl9xB4ZlY7bs0HYnhL1JlSMuvmgEAOoDeGPy8s?=
 =?us-ascii?Q?J9ERezH6gipogeG/hiX1UdIwHStJzx7YRTOmWnAGRJXqPvlvxI7cBha6p6g0?=
 =?us-ascii?Q?ckQlYaO7lgbFluRghqMCFlMgvYgXDh9xsfQEnbFcNVLHHI4wS4Yhm8HN34nw?=
 =?us-ascii?Q?FeWNm1Fu/NAL9MUr6B8/zXFgsw4TvgfBg+rt6Y565YaExglErdfPjF1rFEWY?=
 =?us-ascii?Q?O5SOgNC9EU2hLyVFIWHOpQaPOjOwEHUCSqSBnkztrHkzuj2MgYEcbrh8XJAW?=
 =?us-ascii?Q?LpE922Mx9S2FtTKALF2uqIuPuBWLPhQawUXNAGWlK42tzUex+0OIkOBTrYbY?=
 =?us-ascii?Q?6IeMWfjKZSu6ACAqPMXbwqsSVhvJAbwStOtMnMDQTSWTuO0DryLdldI9c1wR?=
 =?us-ascii?Q?pdrYbbjLy9SajRFAd8k0Do82dKO6v3nXN3OpYxCFSYhERfDz7Lfk2VaSEhnV?=
 =?us-ascii?Q?JJSCtPYcGsjNpQYimgwFed5iBCGz/YZwsh+AoTGUXkWCWJHouLo55LmcMUlz?=
 =?us-ascii?Q?wVjiHcB3czNqDDVvJEMuuCBtJ9wUe4Vw9lOSRFBe6g8E23XVZCQJ0mKe39jE?=
 =?us-ascii?Q?FAYI5WnPm9H3r8O9tSAOWS4P0//SoGJoumCUkjbQ8IdMZkOpA1wDU6PLpF/h?=
 =?us-ascii?Q?fzKsB/YVgJjq+afr2DH+Ilxvs6lZmvGA9a5hghnTcaxliiAI0UE9mUTc0tKm?=
 =?us-ascii?Q?+KuyavxHnwWM4PuxpZS6e74PAzAIkhPVHukP94AKn+ocaG+VKtynXtrncjhQ?=
 =?us-ascii?Q?M0UuuITqz0gDAI1zgkZ7LIu49eiCQqvG3ONAs/4Tn2ysB+vGN04It6O61vG2?=
 =?us-ascii?Q?swgwk+YlHXt6lP9m5SA34S3YVGAKRumGbGsd31NqkOU/ondydrY3O/xEoU8w?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53469a2b-f8ba-42b0-f7ed-08dd7152663a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:21:27.3868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlCfQViPW6zJlip1wYXgmIqYvc4BkB1Q8Evo81744Ud3ccdkSbZtDiFk2gyPrTsmadTA8jdHq7+QRx2aWoZzishkXkoMHCS9ArUyPaa48Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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

On Mon, Mar 10, 2025 at 09:06:52PM +0100, Maarten Lankhorst wrote:
>Have only a single init function for whole of GT to keep things
>readable.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
