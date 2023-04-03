Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDCAC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 23:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79A10E048;
	Mon,  3 Apr 2023 23:43:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA48510E048
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 23:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680565413; x=1712101413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EvDoCQ17KABhweTdgORgy0GYAyWW4hJiaG3X1at1arI=;
 b=mi248SAvev5W250VueslFZ0KADkbaYENM/vItqYtNr7/lj1fMwOws91P
 Fhcj7VmmUAec83wTyIjYP2zZ51Ds//Vl6OApIZjJpHCK/kDExqgQU6gFt
 9RpV9ga9dg61/54O9RxrjU2wh8R0p7V1/JzWyO3AfC0LMuz0RM5Gch+67
 I5PQGOgEbBH+Ot9yJQC0xnYUJh6+hB2X4n1i4MI6r/hDpyzXLDHoRXHta
 2ib7Q+oGS7a3pDxQw7o35Ta2KjQ81utNxLDv1p9qrj7+Q7KkGbLeourmx
 vX4tpp5Um8MjoDpCDUMxCCZK3ydo+lfwLRMy0iNRDOg265H2Qfn9R+v6q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369852550"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="369852550"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 16:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1015891704"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="1015891704"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2023 16:43:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 16:43:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 16:43:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 16:43:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 16:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjayFlpF3YzrLrAtXp4FUAsh5J2ABTiv5qXRb8f9CDlfpWIvULn6T2pwtr1ljVPNdLrVSbpAtbBemSZmmQ/UYVn2OUpFgwUR63W9Zq//Tt0l4qgX4aBo1QMH3TQvtXU/55q31bY1NTKt9+WdwS3yNYZtR7GRPRt7f17AbquWEdi1OE8uJzDDbVEKGymUpJtfAhkVV0kpDv7L+MN2Ti0LAk50oyOaITpO6VjaGDo8Zi/QWBfGFD4RH3ChH/TTGL5/OtF52LOhXNTykqATMrh8ybvp0N4mt1izFEA8c4bXBeYzDIk+UW6n0luo0CpdAAB376XX2lfo8so6HBwqD8yEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XWFonQfAmReH94gCUIstJw0RtXG3AXmylXr0DlfynM=;
 b=ZyTiWkWF4S1ybdb0sSjOlz0wQW3j2mwEfDVrx3AKWq5mUDaxzUKJ0VaY9Et6c82xIlt8W/ZD79kzVOfO07hpyB5hNxT0UH0r480y109TmfRb97uvlboYOSQ1xr350hWadmlf+rsu3pFaT2MEEbxx+w9xvO89wh57r0I7vL94kbK+7hkZIe+I38L/U+6EgM5abELodjvo2TDdBkJhsLNbkcgt1ZDm27+P2XX0kZjl/cFg+hVaGyFaVBkIvJV8q/G5VAf2AxWQlRx5ybXrnXh4EyMkB9JvzMBSHvb2NvkGHCpJifLVFdk2KuMwb4PwxC1o8k73zn9Es0bs29l5jLL+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 23:43:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 23:43:30 +0000
Date: Mon, 3 Apr 2023 16:43:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230403234328.pky6pthsfaqxtc2e@ldmartin-desk2.lan>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-6-lucas.demarchi@intel.com>
 <20230403231125.GC4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403231125.GC4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ed9b4f-754d-44f0-fb3a-08db349d3acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XxiAF4VEbr6PaEkHF0gdkdu/MlvUF2kje5d4RLLkUg8NAkD6QahReOAygYLKHIJmEmidds6oUd3Uz4bh9iBe1UNRy19PPv4IVeek/Mp5jS6/98NA4I9RH27BJCmRtsXLiAakVGppnW6EIR/SxEhMC1EnXJnzGOuGdhXjCN6YfLJZlnqSbOTtZsTluNZ5eYYFGBL4G8jRncx5rmjyYoRHn1Z7sEnjTMbD6OqCSOokegXZpkkcvK+G9lj9w9eSIciqWybc12ndRjdJqraHuVLbGW6+wqLycgXf4i4RF598MFMotMzbkeYXVJ32tXdlly8BrcRh5oNRdf7s6bcVQW0sh9K1SbDGqa+53oCkRK08P0EcgmUFFvcJKqUkfJuj51NLfAKCZcH2cL+7Mzu3qMvmRf0oVpD3bzD9pyvgbp+l6sxsxC2hSDglQyQaz4xKWwAknB1cZCYqzYMxqIZmH5rhQ+vT9cbFP71U4p4pThSB73261HkOjgZL3gHe7i4V7VW8ysy/3+P65MH2WtVT9aMuC0tfk8KVeU5P5dNiWE3t03kQZyyr1VbpMU1QNAa/LyXp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(2906002)(38100700002)(5660300002)(66476007)(82960400001)(66556008)(66946007)(8936002)(6862004)(1076003)(41300700001)(8676002)(4326008)(316002)(36756003)(6636002)(86362001)(478600001)(9686003)(186003)(6512007)(26005)(6506007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LQwBgGabp/pTaXgD3D+xm5xDd0mReTTjbXHNZsBgiz7UduYMMvlAK0pgfdah?=
 =?us-ascii?Q?0hH8933ETWqz9qkUuF4fvHmd7LQCIqRSKEtAJrkYE/WxybyIugjlzZ+Dgl3m?=
 =?us-ascii?Q?fAKOwZ/YwZUWmYyqCl21ppJrdpvJA5VRxZy5ZY7WR1yY/CGQItlk8vYmIvx0?=
 =?us-ascii?Q?xWGDnfyb5neeP1jNmRDwKFRO1zGDnRiZgg7uyZliWlV0ehTDJqWz90CfqPxF?=
 =?us-ascii?Q?IWZBRzZaQTTrOcJoUeDyTBwODS4QigncJTXVNs2XxHk8w5pzP9/S8LpIy3t8?=
 =?us-ascii?Q?tepnsgODbb9UBX0eBXzLJ7h6g37t2hYubYc4qb7oWbi8ctGi5WccgE1H0uac?=
 =?us-ascii?Q?BLgZ4nIe5uAE44GiRBgN/+OURq9+kYMoRWLwKDvTCiGOFMtwn9ou/OR+FhmG?=
 =?us-ascii?Q?JkcUBRmKdJg2b1UekNHyqC3S13HqQDwsSjtFZaGeHAbkWPEol4jzjW5NSuZ4?=
 =?us-ascii?Q?Kxr6HoaVSH/SzkM8G5YDImWHo/zVnlztLZDuOI7G5TKL8DBCG3d9ZGhy3tly?=
 =?us-ascii?Q?ZtstIQ+GwpYA9lEVgwEOt+3gKfGO7SWvArgtx3q9/HdkodG2eKYBCgLrmYSt?=
 =?us-ascii?Q?sowLrBczMcnM8MeJDVIkvicx5kyugNvvPT7f1395zAM5Kk699eut6A9e3ncm?=
 =?us-ascii?Q?7Hg0D2COHIeU6AWILkvNRRqiGUn7mUO9AdoGwEXucrctQ039MPp6yDvfsc6s?=
 =?us-ascii?Q?4TuGASCw2/p9/Q/EqTx9USpZxAlVAnmuuQr6YsQoNvRXdc3nKXdl2iSDCYZ/?=
 =?us-ascii?Q?8ucGTsf4KyrOJZiQO8JEvbdPKPUJSWmy7RGeZlFJPUixpIT0C6t66791f7K6?=
 =?us-ascii?Q?Q+lxvypjDVFfB3gvWr8+LM2Xp/0oBp0BUoEisIxJu7zyunrd9pkxB05p+hXy?=
 =?us-ascii?Q?XvXaKeAQ9VxAMnzXgIn1hAG3C5fH0HNQ4tP8lUOvZC6dWhcH0UVYc11eNFiC?=
 =?us-ascii?Q?mBwObgBIB8/eb4mTS6QF9af3UZxwnd0oNOHbHsaHYJmrP4klW8b0u0HNq62Q?=
 =?us-ascii?Q?FNhwSSs3mDpds64PSes+seTbqMcudRUZORtA4j2QV2jWONBuZJMPXKO+QK4T?=
 =?us-ascii?Q?mVg7jW/lPqNIplcNQoYvjdJlAiXuGIlcUqYS6A4Qm7HjdNlrDISTxHBHWwUM?=
 =?us-ascii?Q?ZssJmrfbqFytYkYBSsvhNFsfnZ/jTmHN6CT+YER4h1amkby2M1dgB37oL5rV?=
 =?us-ascii?Q?sC2KeIaDE6OFnD4cTmg8tkzOr0Myhs4O8KYv05hzAqH/iWd8pcwULdYTb00T?=
 =?us-ascii?Q?khq6ZH3kUBTLji8BHV5QZNzknGA/qK4jQiGZEPwNKpI+Wg5qgzRcr7+QodnG?=
 =?us-ascii?Q?rWHorZ/Hb+J/pTDoN8S8jfvtBdnJZklj5+GECEy5dck7lrCP6wOXK56MXw0t?=
 =?us-ascii?Q?ZI2sQwOemygbyVHvow40SnchCbfr2ODF+XcBccsTflODfOYa7W4cgQBRUsh2?=
 =?us-ascii?Q?IeyTI+6xO/SU1IS+0MZdtJBDeas3GbxbZX2n2e9Q8cfr8s9aneEnsFBs22ZP?=
 =?us-ascii?Q?WInaPF6LOq0EC6LUPMv5PHc34ocyZ9MqThnj8gIZTQthX4/BMBouLY1U/dIO?=
 =?us-ascii?Q?k4BWT+NprXtaa9bTxhOaBz5xg5hy7kZE1oSoiZ5NO0RO7JeU+/NnxfJsyUcM?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ed9b4f-754d-44f0-fb3a-08db349d3acb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 23:43:30.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln8cE629hCKHjHsdCaOIX2qz1Y8s8BPJRkmOZnC7SBzrq53wPEgUHO8ydNDnOdVbsuZxEf8JB9Os0Ol15j04ID4X1n4EQnIWH0a6kfz83oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/7] drm/xe/reg_sr: Save errors for kunit
 integration
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 04:11:25PM -0700, Matt Roper wrote:
>On Sat, Apr 01, 2023 at 01:51:49AM -0700, Lucas De Marchi wrote:
>> When there's an entry that is dropped when xe_reg_sr_add(), there's
>> not much we can do other than reporting the error - it's for certain a
>> driver issue or conflicting workarounds/tunings. Save the number of
>> errors to be used later by kunit to report where it happens.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Does xe_reg_sr ever get allocated on the stack on with a non-zeroed
>allocation?  I didn't think it did (it looks like they're always part of
>the original xe_device allocation which was kzalloc'd), but I see
>xe_reg_sr_init() explicitly zeroing the sr->pool substructure so it made
>me second-guess myself.
>
>Assuming I'm reading correctly that we never have an xe_reg_sr that
>wasn't zeroed at allocation,

when I wrote that part I think it was to allow init -> fini -> init.
But with the drm-managed part that didn't work.  For the same reason,
sr can't be on stack - it will just crash if we try.

So... those memset in both init and fini look redundant now and can be
removed in a cleanup patch.

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
