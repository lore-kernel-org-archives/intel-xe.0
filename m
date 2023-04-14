Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF8EC77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 20:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486210EE78;
	Fri, 14 Apr 2023 20:51:11 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD4B10EE78
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681505469; x=1713041469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o/AuY6GREp5ihypVg+muDg3awTxu09LGNDJ5p2NL55g=;
 b=OB+WqXfOSciMHnZ/Z+879FG/gfnobzEOMv/sOY8sKtrvUAeeCDuNxplp
 Y3ruAcNVJRUd0BbomCh/4lDAxJJ09PjPhfmK4Rwm6XO/KE6660BUk751d
 7sH4p40ohavaXgMhVF/XYy8m2tf6VVmK0YsGmzK3yMGj8yjMAI7UAwTSz
 HhFyeZkr2I9bwiicbC6k6z+YqMVRSnjcBl0gh+afOP6rIltXIrg//OjjV
 /X2+ggXj7wNjdhmkM2ECQ0MYPQOOUWAmkzhc7/apOC/tuuRJTPTbECg/G
 NZwVwkgntinzw592nhXM3YC/DGDjvobBSmvvax3Pla1USicvmSgT9blb5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324191992"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="324191992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 13:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833689433"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="833689433"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2023 13:51:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 13:51:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 13:51:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 13:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btXp8rURV8rdrL/SkkvVUN4U6fMwjcHXbEeggUkyUQVhd1bgh0mKls5zdrCtbyhqTwZFYjA4Z432MyyP47xO/eLS9UQa+o+O290Y3A1PiA1wsqF9GZy4Il3YlmXm7OUzry+7R8eTdX+5QEZQpe21wFJYNyAzjE9zCEbwmg2PflAz8TG3GKDwNut9uu+MraiW/Xt+ejHrR9wiAh5j7EjxJmtQKmeHj0jIuNEvVHhHOrwYH2p83RkXp5o1wtgLehR4+KMeDqgH99GdIB76w0Hq34mR359Des1gOJi3cTCU7kZ9uE1N9XhUuQBVX38dnz75adlUHDJfIvrKnq1swrohcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/AuY6GREp5ihypVg+muDg3awTxu09LGNDJ5p2NL55g=;
 b=VqxAI105n/UtE7hwYiPNaAJcy7pCTd54jls8cNif9MsW3Zdr0rQjQwmZBu8ynesZwVtA58WOKlLPh0TtUlW6XCq9pDKOHmeLYAOB94h5R6timDzOG0j+0oN685t0/I8pg9MUT6hJz6VhIcFoSCwbwP6Iat84V9fkPU+qP3Dn4vHAte1J6lCC41yvPB9jujgau1CCB8vke9Gv+JsIuxXZdfZpgn+b+0YMv4IhCNLYAv0aAPmr0nRiZWeTI0ViokQIKZPEY4qyfIJKlUDyhiVd1h0WE0LT0BdTBeBjwCI/aEviykkrwVNAkp0YflxFPlFr7BRezfBdYhWJ6xNobOvZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 20:51:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 20:51:00 +0000
Date: Fri, 14 Apr 2023 13:50:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <t6zkaezvo6hmbovfk5nb5veix7hfj2553vge6ls2onaeoyisqp@5id3yuzryo63>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2aff39-e525-483a-81dd-08db3d29f41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HehzNHpX337jWqV3Pr2ajAg+AQ/6bwZTUOc8FCmfFNQxkDrj5S4Rm2/tTsJpqgMsAwv89weh3YIiYD1ns9NzFsegR34pZpmSDBiOSRJZENer+6EK2Y06mrlOoNZwKwu29bv2mGEtJaTzVBtQQ5cpGcnLb5JYSnQhctuxjEB0Z0oMKsfn1ug4mmLzsLFAnGrwP9aor1bIVwO/aiLez7VfXbXffODVRR3TE8jKNuQ9wWVUt9GLuFATjorvf6faTcW1jEzirWqVXMCeMIO89DGZOeOn2B0++ocD/QASRRwFCXaUBRbzSuBO3bMS2/i6XONJ151Dppgu3weFVcRUDzZLT0Z7xoBR2FLQmNA5XUgw6OQaE+rH1wdJDisfzEvVfnCxK8U6ajkkI6Q81xae+BTRCp+UkCaVQxa+qgOxpU2wm4mHpyWHeH9arI2GBdvLEHcMcyMqeP+VP7CLM53VaDXIV1WGtTHD5IQXQPMz3Oij0lu5SHxnLK0Whc+pGouaHd9wtkuU+TM157gLwcozMnJTwYhg4AR6XglPBmNSdr8sPbqxUjRNA77xd/RGd8xkI/fJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(5660300002)(6486002)(66556008)(2906002)(66476007)(4326008)(66946007)(558084003)(33716001)(86362001)(38100700002)(41300700001)(6862004)(82960400001)(8676002)(316002)(8936002)(478600001)(6636002)(9686003)(6512007)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gVlUVr7oFbSMBuZRBwK+tcFqYBo5lQu3xi2+IuB4IXHvL1k9ITKBDVVC1erA?=
 =?us-ascii?Q?45CmXDLC3j8E6OwpQB0Bf1fS8p6wn+6opZQ97MeaAHT0MgYa5L17ZxTnsTc6?=
 =?us-ascii?Q?sDMzus6z7E4T0lQ8KfdlUW5O2RuNhhPypY8tp+72tOLKxUc5X37GOqkoNJS9?=
 =?us-ascii?Q?V96C8i9/GWK/dR2vaX84tup3No/tjzyfsdGDC9sa/Z7kWn7rc7O6cXOD4B4D?=
 =?us-ascii?Q?VsPgTyn4VKgPCWvNJINuqybYPhP537dusGJ/ZCZDcXbSB2LfRe9b4RbNrntY?=
 =?us-ascii?Q?wxjYD+ZreZZbyUMdVjtfBfVgUjs+j1G6PgAkUtIhxA719yVoz0o9h8cp1m/M?=
 =?us-ascii?Q?qWhMzSqhGyHVGZleiLLt5k7DBl31sd08mPluZrsls2M/vvtIpD2g7xY865/a?=
 =?us-ascii?Q?f2mmccyO42FMuzf1FQqntCiK8qeKG8rS+4HaeT0Udd/47lbUQRaD+lXUpUTz?=
 =?us-ascii?Q?PVZjZeWsL3LD7MNzeLJXV3qwS069Zavn03iCWvHmJGpKLR5ay/DbtP3xBXD9?=
 =?us-ascii?Q?/991p1EHUa+4EIiV9DXhuMl2nY2XDbJ4meDU7J+APH5C+EAxmArWicQdoSu6?=
 =?us-ascii?Q?3qYRy6rPhcipvbc2NVIRUimq8yDndeV99EfadXeMFR3/D7LWvvqts+sfCofi?=
 =?us-ascii?Q?q4+YPdHUyKTfWXnIoq0/L7NgPDxho4tVt0GDLSuAFKoPx8AhCT11sA4fKxgk?=
 =?us-ascii?Q?vDYSon6yFHPh2kmBec//v6YcWJXkMRr8fBpwtZOBVEihK1oPU+ms7ekYDUbX?=
 =?us-ascii?Q?SbAv7tkWXr1M9FoVRDMfkeIcPEOJURaz58I97edRdzhdm0IbYsjN3kFz23es?=
 =?us-ascii?Q?OH+yLs4gEwX1QGGbRsTBIEVjp7ZxtEFPgMJA65oZCtHouklxvxPRhAzUvz+S?=
 =?us-ascii?Q?rvVSzExwzPymTgjE2CGLgB15M/U5vJcUq8tx3ITCdOdf7K80QRjBdBMGtA+L?=
 =?us-ascii?Q?bLFnWz98V3h/8+hfB8cau6mzX42srcSdicgY0vNnFGaIVfXj2AfbruzcY73A?=
 =?us-ascii?Q?fCFVvCMn/gNbcuamTNxRlfBbwCvTKJB7n+kL7ZIrIYED3nJCS5VlbdHSmTUa?=
 =?us-ascii?Q?Q8m0vy0QOQJUqtFhgMcaDA4LE/u4TMm36gyyxYneOJjzNsIdOPZ1aD3/nFY9?=
 =?us-ascii?Q?OOEqKXa6kEWodzOsQTbisWoftlRVsJFeqQFri8oBbQJ0JsIOs+xl/Ogf8fhl?=
 =?us-ascii?Q?c9TU3r/Zv4DLE7Dir6ZgBwOW0PNzwCFq0DWe/XLd3GW3olg5wyC0pmMB7nDV?=
 =?us-ascii?Q?RjE9RkBbd57XE4t2WKubEXf53zJ6bIysGPwV2LafHdW0RnfdqS0JcqdCEeB0?=
 =?us-ascii?Q?ktccr2GBhKdT4HzoDsEVmaKcwGcCPWkH8z5wj5x2WiWGbiOIfJPm0oAjONMH?=
 =?us-ascii?Q?1gIoOkpTgeueU4jInJwc5jertRqZ8D7gbblf5swnmgDRzw2uMrw4MnjMTBgO?=
 =?us-ascii?Q?JBHRXAKZelsystMsIR28iVAEyIaWn12nsbEyVA5CvH5qxL1xCCse2Incgu+P?=
 =?us-ascii?Q?TUaTu0JtY5eZ5/IRSOo0NXNdyP44JJbE457DrH3nU4uHPPE1zfhr6Qh2rpOc?=
 =?us-ascii?Q?7woeux9ZYyihCdQnzL2VVohWoKq7FW0vQJCxdT3TTYrBCQPGkq3a+fn9nqTU?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2aff39-e525-483a-81dd-08db3d29f41b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 20:51:00.3878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zrb79GGx+oBXUgr2XpRDulyg+d/4wDEyTT/t4e8oqrrNF9tlmhii7gYYOdrwc86eQjAhuL3In2UcEj3u/Q3RFOLHxM7JymTLdsjoi31Iias=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/8] drm/xe: Include GT ID in error
 message if TLB invalidation times out
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 03:52:46PM -0700, Matt Roper wrote:
>This will hopefully help debug TLB invalidation problems.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
