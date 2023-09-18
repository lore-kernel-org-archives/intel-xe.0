Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B5C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 19:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5310E2DE;
	Mon, 18 Sep 2023 19:30:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF710E2DE
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695065413; x=1726601413;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=LA3cj7fh9Qt7u1IWhHGy4jOhpmCy1jN3o4uXd8CHv6o=;
 b=D4D9A+Bi5ml4E3evgKTNMI4pCrTYOGiihfWyaDwG0r6giiGELAbJSL6X
 BAq6Os2ZEt01+3JOwMKii9AFXEPGecTpWDkwz0IL8+nd14CoDpmqvBWRT
 igrBtvZ+ObrutLp9StjIkhSjslLuqWvTMcekUKSVX/rtq6PHJXRYQbarT
 xcL+x2J0UP7V/ha318ZpcaRtlhg2vfR8qCXPL6zqNXnMPITCNQv3QgmyV
 P1l15H+ByQ2w0lj39WLo/Z7zS1Cp0QALOBRtY3tXHriNjbCN40c4ar+89
 ECRa4CcjfNPlLuugxpgigHsls8X0Lowu9zs3G5Kj8j/SalK/HVczGjYKt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="360002764"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="360002764"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 12:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="749136592"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="749136592"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 12:30:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 12:30:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 12:30:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 12:30:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 12:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqJeI/CLSv6v6UQR2jkT+vdZ3onaZpUycsdcdCJbXudHMwPeZpcwqwGKqmXmSXtpdbP5HvJYwsQK/PJ0mU4ah7lHhNxJlHt8BWwwKJGqagdb7K8n9CqWgKwyROEWHGeafb0T55xrua88GoUgbNnjys4MkbLNSc6ae1S2lKYWIscIhi1XL6kaSUxKzcMX543WYCVbPgHps1tNHEFMetmLCeNdFdX4sNDB//4LXCgNEYwC+bgYoKICjJJ8ShgIMsjwlWbOWjMVIUphluZ/1vUdyaNzI8we0f61J718+AWmo+HZKwQRx8ALa3dgn2eI+GqsIsLYZICjLTEy5LTkJplplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pY8komzrZ5jD03kmjScgWCwJrFoZNSuTiIiMCv6bJk=;
 b=MaepJlANHed5jBbbBSUmvbK6aZigkyz4mk1AagT8tUl/4l/Qys/YFcUlyPfsb2qTbQr4zBtyUTXHh6J/a0YyI/NFx4gPRLfb00DqmTssm3FNabRXz62VAqaSnxs7eW6va+2XW4zx7+GPsu8WkmHpwtWxWTnzRT3MB1Z3I6NPIOAzHPuOGSVw4GKjI+VWX8edPEQzJUYfgGzi1U1RSevkXQkVYV9L4L4SyLZqJZTq1OmbG4X3K17Waycm5PU5N3Q9gh0XTKUtcH9SW5dt8KAcSTIXBJVHWDsNgE5y4QI1ovYeMjvFtMZur/3dj8hEP8THtKKfbsb4dd+shz95ngtBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 19:30:07 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 19:30:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169505564035.32415.14144993363415312930@emeril.freedesktop.org>
References: <20230915220233.59736-1-gustavo.sousa@intel.com>
 <169505564035.32415.14144993363415312930@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 18 Sep 2023 16:30:01 -0300
Message-ID: <169506540155.2120.17238721642167655170@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MN2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:23a::13) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SA2PR11MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 539c4c10-80ba-43d3-745f-08dbb87da9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FRLr7U1lpj4Eo6WywAoX2vNT3OsKT3ixDaginxgytdT9srFQG3Z4znaovkCD/PKgXLsNlJfqWBVVwnVT7B4Y4v7Ay2g6vWGNhyamvnCh2h5/l/mmSYLozl1pff9Sv4USIVzImfHTB1M9cR0QJ1CJsG81YU8oO6UtftCsXhqfY9OFVW7tERuw8BeSCwzyo5c3QZd/cZ1ADrDBAbS5+bIsfcoBzy2L2TpT+C+RzxYgGdNvQKurBL6vqnFKSa3q9mjNRuB1i4VLj480GTYag18gfsLQIJ2RT/HEe6dLAImyJqLIi1lPyYgvZBgMPfKrtUSvLQysA283Xfm0d87sRnshBcpJ8rHXB64nYpWxRE3O2qROesGvf/3klIo0o7hZXnypz+BK+Sk6+FYiVBKJbl7QWwqlxrK339k5LR4FPqNHfKUUiESZZ3+97rqcohw2Yy5Qc//8qeSkr1ZBqWmhjcYSSJgE+Y50qsRa6d8XzttjMTKSY3J2dwsXUrnJpzpMD1eSVrf5+ZQRnQzSrUp/51eO+zGOJKhpSQqN/Y34jqMkgNxo3WAB89R31oAmMBTgwkb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(86362001)(38100700002)(82960400001)(107886003)(26005)(2906002)(9686003)(966005)(6512007)(478600001)(4326008)(5660300002)(316002)(8936002)(41300700001)(33716001)(44832011)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmswYVdwWUpxODVYQndwd2d4cFltaUhyYTRJMFlqVWkvRVBMSzhMVk5EL0VU?=
 =?utf-8?B?d2ROQnNObzVhQmdQcTJFQTF3TDA4elZoZDQrdnlrOEZ6ZlhTOHNrbXNMZ0x0?=
 =?utf-8?B?Z2NUaUcrTHp0V21rWHE1dS9YTTk2SWdYUkFoQ09qR1A2TDVPSWJzNWhzWVZB?=
 =?utf-8?B?SnNKMC9KKzRkakUxb3p2L09ZRzA3V2lXaHYxZzd3cS9KZnJSUld4WVlRWnQ3?=
 =?utf-8?B?V3NWZ1E2UkRCOC9LR2NGM1pkR0VhaEVJUGx4bFdrV2UzNWtRdEI5bUh0YlRh?=
 =?utf-8?B?dFpBVTA0R1pNc2tDaG8zVld4LzAwd1dwSUF2akl1RnBUMmhQaVZuWnhNWVpC?=
 =?utf-8?B?cFJIOFdtQkFONm1MWDZlS0pud0lOcE9URWN1a1RsKytjYy9BTXNodVFCbVVr?=
 =?utf-8?B?dUYxaWdJUFk1eTJaU2diaHFiajRSelZjaXhkc2tUblFocVpPSzBHWlluTnlV?=
 =?utf-8?B?d2s0Vk9wYm5lWVdvbGtzckgvVXdndndQMmtMK1JwM1RhcFU0K1hKMVdRKzg1?=
 =?utf-8?B?dXdFMzZRSG9QLzVFQ2o2ZGl6eUFhZVE2b25vSGV4QTJCSTczQ1l1S3ZydEg2?=
 =?utf-8?B?c29KZnRDbmxRNEgwZGRUNk9haSt2KzE4VzNmOEszMnNtVUkyN1NnS1A3bVUv?=
 =?utf-8?B?bmE1TmtpVlNtVU4rMUQwb1hCeFZkWHVLNDhoTDY0RlZ2NE9Jbks1MmFQTEVU?=
 =?utf-8?B?MXlWeUF5aWFyN0g5MG91RDl5T1dDTDcxakRlbDNOY21Gcisva2pMWGhVaWlj?=
 =?utf-8?B?Q2EzbGFCTlZRbVhMK0UxamI2Wm5CUjVIVmg5cDVwaFVOQlNsZVFLbjk2emI4?=
 =?utf-8?B?WGJyYmFPTm1SdkVGb09UK2lpQ2JCS1NvMk9PS1NTUnRETWZ2eGZwSFJ5Y3c1?=
 =?utf-8?B?b0gwTE8veTNKMmlJVmtMRnlQU21Vbm80a0NlQnpFaE44dzJDK1pXT0xaK25V?=
 =?utf-8?B?dWRWeCs4L0tqK3lTL3d6UXk0MVMzdnpjYzVFSFduZjZMYjZMZ3NJVGxTOUN5?=
 =?utf-8?B?bWZRMTRYR283cmhsQ3k5MXF1SVVsdXQzbTNsajNrTjJtMDN0SDVZR3h6ZkdQ?=
 =?utf-8?B?dVN6QmN3TTd1SW1lRlo3NEF0VlNDKythaVZLNkZpaXZkUVQvRkNobk5veTFD?=
 =?utf-8?B?aEluSnU0QVE0T1FsWG9vR2ovUm5sRm0zVjNqVE5nSjRCQkNLTzlYTHpGV0hV?=
 =?utf-8?B?aTNmZHVPQ0k3Z3ZJMzM4Sm0zcWFqejhOS0hBa051Njc1VXFYUlkxeFQ3d1Nt?=
 =?utf-8?B?NktlTEZjSnVFSFMreVQ0Zjc5dUlOZFZBWGR1YURvd2FDTWxSYkFKVWgyNW9M?=
 =?utf-8?B?Z2F4Z1JKQmdDd29xWmpXTS9FaWFTQlhDSlpGTjVwL1B3WnlzL0NvRjk4Y3ZG?=
 =?utf-8?B?ZmJPNGVZc0l2UXF6c0U1eU9ZdUdrV3FndUNoK2RTTG1SVk52VEh1SG1Ub0p0?=
 =?utf-8?B?MXdCQ3BVdHpSVHBKb0M5MVovdU5zdElxQ3ZxN2hqakZELzhFNHNDOVp0Unph?=
 =?utf-8?B?K0Rwa3I1a2pkd0tlYmtuRkx2anFQZ2toMHc3WWNlYVdJaTVBZFlvSWRtUWNT?=
 =?utf-8?B?aWQ3bFdzRE1aYnRhY0dmTlR4VkF6TExYdzV1dzJieTUzbG9WUFBVY2l3b3hE?=
 =?utf-8?B?U0VpMU1JMWFaM1JuK0RpaTM3NndMQUtZK25ZQ21BQmdQck5MTmEzMzc5R0pv?=
 =?utf-8?B?Z3FwQm1DWEtOZWRNY3ZwbDJTOFRtdHBWMk1QaU1MQVMyYmdGOW1uT010cndz?=
 =?utf-8?B?T1FjVXcyRG1HL3dBUmZ6RHpqQ1lFQkxqaExDcVFwQXJJVkZRMWhUQ0laV01h?=
 =?utf-8?B?YXhDcTN5alpLZy9Ib2hzL0F6TjNIMzlpSFRHMEZ4dXFaV0JZN2dtOHRtWTRN?=
 =?utf-8?B?WDJ2VjNIekhFV1FHakkzemdGc1lLMzErZnM3ZVJhQ0t1Y0ZJQkN3K2syQkN5?=
 =?utf-8?B?NiswZmcwbi9VZUl5QVpyV0FYZlM0bVhYUURlUnpwMmRtcU5OMXA1bkZ4Y2gx?=
 =?utf-8?B?TTFMR0pLSi9KcWFJZndFY1VHMUdzK3Yxc2VOa3lmeEsrb2lRQTMyY1RVanJR?=
 =?utf-8?B?UFNLZTFXK0c0Y2VxRjJCeFJqYmhqUGFSSkIrdEtQMXl5c3NiVm95RUMya09C?=
 =?utf-8?B?Rkx4NXRWQlBuUnFiQnJ2T2JwakszWm12Tmd5YTVrT3BKaEdybE5vTldaNXpv?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 539c4c10-80ba-43d3-745f-08dbb87da9bc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 19:30:07.2001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BXJG542It471vMPR8SeX+dBBUkhNsqY5Dq4Mj1hibr/XGi+fGA8J0WC4V80zby0i7b0urjB0DncYZvBHPL9vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Simplify_final_return_from_xe=5Firq=5Finstall=28=29_=28rev2=29?=
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-09-18 13:47:20-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: Simplify final return from xe_irq_install() (rev2)
>URL   : https://patchwork.freedesktop.org/series/123814/
>State : success
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-377-717f01815b20bde3f081a18f42f31673ce1f107f_=
BAT -> xe-pw-123814v2_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.

Pushed to drm-xe-next. Thanks Matt for the review!

Gustavo Sousa

>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>
>Changes
>-------
>
>  No changes found
>
>
>Build changes
>-------------
>
>  * Linux: xe-377-717f01815b20bde3f081a18f42f31673ce1f107f -> xe-pw-123814=
v2
>
>  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-377-717f01815b20bde3f081a18f42f31673ce1f107f: 717f01815b20bde3f081a18=
f42f31673ce1f107f
>  xe-pw-123814v2: 123814v2
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1238=
14v2/index.html
