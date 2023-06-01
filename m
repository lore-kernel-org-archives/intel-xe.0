Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C66C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EFC10E08B;
	Thu,  1 Jun 2023 15:22:11 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABF710E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632929; x=1717168929;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=002PsgEMi4VdKRP2SzY+QaDrQQtqRnF9TZQZ9d9vcME=;
 b=PCsohHl7Jy0b0iBnakuX8Nund45dH+HpMJNpPTGEAmwpKXlqYtzZ1FE7
 QfAws/aUlxEAcsxxXCfVpRG87yl8hq41C71hZ6eyfwHDFsYM4Ilv+tSns
 L+Ga2rM0omXC+ReSaYeuZDsRt7mlxTAe9bUYRWnDIogT/rRzEmYvirQPs
 rhI2a+QAnH0iqVDu8Bn4j8OUmtdbUaFs7KMsfeeelw9dKUHqvApB7fvQu
 WvP+8zFCA8F2zaaeosGZF/zNd2ez+zXJhQ7yfU8STyj+WxUec87GVcwUk
 SXxOV7GA2NIftfaqL6MRxbo8CLvGnMPe1krb1C+oRpWkPdYcYzXVkTPt0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353083615"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="353083615"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819857447"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="819857447"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 08:21:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:21:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:21:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:21:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgWC7XpPsueZN+hfBt8dGzzEEe94hzLV/I8hLj+kRKjLoJ0sgYohDghgWtmDeiimyKD/33XheNbIY122PDnW4h6NEcrV2jDhhLL6wYEO5BAoTDMGZ0SUps3YlwnabiiVfbkQUeFNcclRmbUYN6rhe9UjktY+XS6/j8h6W3+URSOSo+e5/TYeBqOxJH/dicBIJTRe5e0ElBm9kdEx/tyZxEjUeyaCroOLISAjHWqkEOBv9miYlVpt2FZOcTpddqiah+ZkC+ECEZV1X5T/QjlXhaLn5IA9/RrwQTsHr8R/QVwEviz8qMfo6tm5HhdtMgmB4X9IrkPYJJ4OgQfxZgnw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf7+2E6yu7hWYiC8wbAtJKPRjMGEM32v0FrumhabZUI=;
 b=cu1f5B6oO25CVkTV3qF3NwQo7htWVOob6QMgFC4pr0WK9VRBxvShX16c7RMmu9ByAXZQ41R9H4kAtm2nLkEiNEJCayC1lrtOUYC3BkVW1i+CQa1JUQFw1TGeV1RXVILtN0a+Qs35/XiLaHeyZn2BNkTReLl91Kz4/d4uGwpScfQVI6KiPAd5ck3SurW70v4ZLJpKOEhyxtm5ZWiysnvBw+bkONmV9zQ8+ReWE0d8s2fRicrGWbgJ6sf8cTyMKN6c81QGGh/fo6shXMSWG7sUquT7mvBRafhgOJVHs4DYtp1QKG2wr5JERMxAwcz9PbLhOypNxDgWdYLujAZm9thDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 15:21:18 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:21:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230531235136.GC6953@mdroper-desk1.amr.corp.intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-15-matthew.d.roper@intel.com>
 <168556649753.1068887.14814865037521875125@gjsousa-mobl2>
 <20230531235136.GC6953@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 1 Jun 2023 12:21:13 -0300
Message-ID: <168563287377.3435.4707532347903152136@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:a03:117::16) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SA2PR11MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1b4e72-3d7a-4188-137c-08db62b3d939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6if/HdCCQc2VCpLa7aeMe/VsUYH/aZcXEu0KTP1y+NbwVBArX4S2LcwUG4gD2APu6SOJs/oAoEm81PgZDM3M/T5sJLzywHiO05EqBmzUlWpj+3BoKRaMWlZEQFDK5toj7EN1M1gr30zhufJMsNWRpIw4tmQWXSo0Zhgw7n+R6rp5o+DLSI9PqQtfu1ma62oMrWq0d3tThhuUuFDWbfGYNyQQL77clyNbYpBdk5CfMeD/57k3TwUQiW0v4bSqMrFe363RUD9ZFyzsb2AC7h2vLklLsib0mXPehpCMKFVGQ+sD2C0477BZJ5N2CcpKzdH47dJ9r19vr0K2u0F9HrSTYFNRChM8tSZrkl9B78ripIXeEa20jU/OdxkZqN159bF2S7Q0yvkpDNoSN8HA3vnz/F6dnE1XHgiOTYziX2PLm4A9wYbaHW2ZbTu8ZAArR4xOkJ68xvxyCmFmn1tYrnKTdRnNOi2h6IyS8ukOe2l6Jpi5FTOZh7h1oWcGMaBrudyMXOD+3i4tTlB2DV8oYA17vGdGn690MBV3IIOJuJCf6mLG0cWipRFh9Fi9ymZ/puuj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(83380400001)(186003)(2906002)(6636002)(4326008)(316002)(66946007)(6486002)(6666004)(478600001)(66476007)(8936002)(5660300002)(26005)(6506007)(6512007)(9686003)(44832011)(107886003)(8676002)(6862004)(41300700001)(66556008)(38100700002)(82960400001)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWliU2xqTmpyYlljU3ByYU1FKzFrbUNYUWMxYVNFdndra01sd0lWSGFPK2JU?=
 =?utf-8?B?TzA2cXJ6a3FVZ0tPMDNaTHhFdGJnYmxzWko3UmVUZjZmZEQyNGFVbXVYYU5r?=
 =?utf-8?B?S01nckJpQnJKMk83Q1JDbGZNWVZSWGZMSTlyZlN4T21NemwrRlFQOW5nRFBL?=
 =?utf-8?B?M3hKN3pSZ2l4OFdmWFRCdVNmQnByQlBCSEVzZVYyay8zOEZqNkpPZndVTTZu?=
 =?utf-8?B?OW96aDU3UjFkK0NyVDVoWkFOQ1kxMEdLNlRYZDRkY2xUeXZFZmVmby9yQnA4?=
 =?utf-8?B?dy9xdmF0N2hiQ3ZTdU92OWJWOU0rdkRVdXlYYVU5cng0NzNUQ0liZFNvZXYv?=
 =?utf-8?B?M0MyM1Q0bk9ucXl0V3UzQTJZVk5OODJzZSszQUNPY2RvcEpMVGQvc3ZUZmg5?=
 =?utf-8?B?NE5YUXE0RFBoSVhaVi9xL1VrbzlxcExMNHVaMjM4cGMydThmeGdYOEhKWTFp?=
 =?utf-8?B?RlF1S3RQY1dsdmlHR09JT2ZyemVwV3Q2VGZaSnUyMkg1VFQ5YWhZbTFZODR6?=
 =?utf-8?B?SlR3L3NEak9xQVkxREJaMGI4U3NBRlZmNTUyTG5GVlpkaVNyQVE0cnpSQ3J3?=
 =?utf-8?B?NGNtV3B2VnN0ZTZpUEJBZGhnbTFsbElWMXBJalJLbHFWOXR4MTJPdktyb093?=
 =?utf-8?B?clFXaERNa0pwdEYrMXZ0UG9lSUFja0I5d1FHK3EzZ292UmJQaHBtMFJzOWhG?=
 =?utf-8?B?NmlYSnVlZVBBelhuOXJ5a2RzZXNvOHpwTEN1VVM2dFp0RENlU0pQSnFRb0Fz?=
 =?utf-8?B?OVBoV3NtR3lRbXBDY0tNZWJpUkdlMG1nMnVtV1RSZDE3Rk9UcTJ4T3R0NDFt?=
 =?utf-8?B?bG5aUnJ4Q0tmU1hNTTZHb1BjNlpjNjhYZkphQnpxZkw3VkxiajlGNXpIeXBB?=
 =?utf-8?B?a3lZM0NJMHQvZXRSWk0wNUFsTjMyRFVYaGlkYXdBNDZSMUZPOTN5R3loOTgw?=
 =?utf-8?B?Y3RzS2daNU1LQ0NnUStMN1ZqeWNBeUJIZndvT2RtbTdmNXlraHRzSzlveEFh?=
 =?utf-8?B?NjF5eDRFSzdaWWg0QmlFK0ZJRlhtRDQ3VHphVldHOHFsQUNxVzhVYVo0bFNr?=
 =?utf-8?B?bTdqczV2eW4rdmlibGN2dndOeTQybm01TldLTTFnMEpkZXpPOEgvZldURDB2?=
 =?utf-8?B?QThSTjNrQlVkaHMwK0RwVVhMcmZLRGVDNVFJU2dyc1hhSnZNWGgycVBQbDBw?=
 =?utf-8?B?L0ZxSmVYMGliUUN0WGtwaEJxeFNnUDRsbm9USllsNnVlVitGdEc2VUtwYjBT?=
 =?utf-8?B?aVpMeXNHMlRYbXJST2k2eHplNEhyRnhmM00rTkVNSndtTFZHWU9QN29DeDBu?=
 =?utf-8?B?VVFOWmFtMHJ6cG9xY3JHZVdDbEpiRXdwcnBWWXlFNk1sRktuSGdEMG1aeDEx?=
 =?utf-8?B?LzhwdURKVUpueUtvRDdySWZES0lPZVVJcmttYjFadHNEdUNleXkwM0huMFJp?=
 =?utf-8?B?SEVIaTBRTTA2cVZOS1JLZ2RYWndJRVhDSTk5Y3prbksrdFIzdXg1cVhtS2xV?=
 =?utf-8?B?QXNRcXdtSE5KODdDb1dEYU1Rc1FZbGFYcnlmU2E3alZGS3dXMXlzS1hFRHlq?=
 =?utf-8?B?ZVR0RTV3ZDVNM0ZKQXNiNmZ1S0U3eEJSRmZVWGduZDNJWm9OcG9zK3dzNU5V?=
 =?utf-8?B?SFVqYVQvL1pLMVRjNkdnUTl2R0RiZi9IMmNsUUxJOFM4U1o4ZVY2UFJsZ29n?=
 =?utf-8?B?THV4MDd0MW9GSERzb1l3cDJKNEFwa2hSZnd3TG5UVnl2ZytiWEpFREZkck9k?=
 =?utf-8?B?bHdCdFJMTkwwNldvNVZvM2ZvcC9jUE9GSkZrdW45K2VYR3RKUWtIVDFyNVNn?=
 =?utf-8?B?cStWT25BelpIdml1YW9UbE92cWZ3QWc4T2FtakVTUDlPOVB2OE5YRFFSYVBm?=
 =?utf-8?B?T3o5VTI5NGlGQlp6RUVUUU5hTHVmMUM1aTNZdzdNSDB6b3p6WGEwSy8xUno2?=
 =?utf-8?B?Q1MxNjFONTA1ZW85b0pDd2gwL1dZdWlwTHFFN0pJU2s2Z1d6eEVWSXR5MW0z?=
 =?utf-8?B?SkEwTUtSV09mYUVvMUVLd3lnbU1LN0dpd2h3UXhoTXU1ZHRJOUlsclhGemRS?=
 =?utf-8?B?YTVjb2FDQWdBU0hwK2NkVlJUUXpOMksyOTljOXg1UE8zeUtYMGJCN3ZtUmh1?=
 =?utf-8?B?UmFPNHg3eHBiQnNFeWNQZTM0WTAvWHhkYUxSeTdReCtibVBoNHppSGdZc1N1?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1b4e72-3d7a-4188-137c-08db62b3d939
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:21:18.7731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+1459NDh4V/DLTHQl6OrJtQJxZkTzs4IlS3PXi9Jz0CkLbMnIfyIqHhb5kRKeN47CBtpTTTNBOa/De+37kVOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 14/31] drm/xe: Move migration from GT to
 tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-31 20:51:36-03:00)
>On Wed, May 31, 2023 at 05:54:57PM -0300, Gustavo Sousa wrote:
>> Quoting Matt Roper (2023-05-30 18:15:32-03:00)
>...
>> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> >index 74023a5dc8b2..aa047db4c937 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt.c
>> >+++ b/drivers/gpu/drm/xe/xe_gt.c
>...
>> >@@ -383,13 +375,13 @@ static int all_fw_domain_init(struct xe_gt *gt)
>> >         }
>> >=20
>> >         if (!xe_gt_is_media_type(gt)) {
>> >-                gt->migrate =3D xe_migrate_init(gt);
>> >-                if (IS_ERR(gt->migrate)) {
>> >-                        err =3D PTR_ERR(gt->migrate);
>> >+                struct xe_tile *tile =3D gt_to_tile(gt);
>> >+
>> >+                tile->migrate =3D xe_migrate_init(tile);
>>=20
>> Couldn't we potentially be calling xe_migrate_init() multiple times for
>> the same tile in the future?
>
>This is inside a !xe_gt_is_media_type block, so it will only get called
>on the tile's primary GT (i.e., once per tile).  If some third type of
>GT ever gets added to tiles in the future we might need changes here
>(and a lot of other places), but I don't think anything like that is on
>our radar for now.

Okay, got it. Yeah, my concern was for the addition of more non-media GTs.

>
>Although migration is a tile-based concept (memory-centric), we have to
>use a blitter engine to perform the copy operations and the engine
>itself lives inside the primary GT, so we want to do this init while
>we're sure the primary GT is under forcewake.

Alright, thanks for explaining it!

By the way, thanks a lot for the awesome and extensive documentation being =
added
with this series! It helped me a lot :-)

--
Gustavo Sousa
