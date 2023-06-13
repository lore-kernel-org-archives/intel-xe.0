Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAE8EB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 13:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A37810E25F;
	Tue, 13 Jun 2023 13:53:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BF10E258
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 13:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686664388; x=1718200388;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0J1EmCkc7PCGkWbrT6hRgfAXpq//JTvbjCzvl7ya/Bc=;
 b=GS7d3FkJdmmLkbocEIcRmKdmqW5IF5CoFQtTWaBwOfnhv0HN+kw6Vh1S
 AAzhTQZj9ffWxA74uI1cE0D/IdoiTed28Q02KCbMviR5qAoHJdiKRT0s4
 /WychlQTe4DLrejclkp4IG4V+4JJsI4rQd29AmnyzeuPNIDPxPjCZ7ObL
 kOAa0I/6kyWaOKyDUiETsYwX5e6Y8KLlLFEHly7hqR/alRCzrJB5RWYGP
 gQm4OP67KPsA7Rwskqg7Nv4QO1v8DBnc3rLp1T/2dG/tzUl/5Y5b28lOd
 aNpd9zvfrA3RhOO3kO0u/INcM2Q9owsCSx4NNrOmA8oqEkkZta65QOhRT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="360815943"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="360815943"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 06:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711652748"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="711652748"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 06:53:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 06:53:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 06:53:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 06:53:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 06:53:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoijY7muMtbo1mGqX2dbQImM5f/OzFYon9owEBx1ojsSYjg+F97x4DvPWIs4az4GXPpAb9uTVmfPZtISraNNJvZ/DFem5Q7mNCQZxQVNX5Qw5uvXFRx32Lq5JMxngm+0uUUK6v7StnJKg4VJr768/o/Hhi0AI1sVVQragKK8z9jJyHZBMu4IKFw7tbZcHhtZn7tYNkvtuGr+TqmrMvoDdTGKtEBLohzDC0QnZurW8fZNeZUWRDaFf2N1VkprYOhJBMOxwHhll1zSpNsTfRGEuH7BT64RbaNv1+HDSmVp8v9uhuYm7as8A/TrfQL8xNU388qi3/G8RzVSAf1Q10ttaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMUAtnKdlb6cNI8N0t1Sb4V3QSMw2BOl315ZIdBlQ3o=;
 b=L13eJOBgjFDbLeRPmyEoDk+IY56f2ZS30lbzew5dHHvDZeHAQfgNEUg2t40kFvoh8FW5tuvPR4H8sQuQfE5wOWbg4qe+eJ1laNSDHdYQv+DXxSxPYwsHVa8z8w0STv5w7rgM3K35FJE07XlCBeHp6vW1XmjcY8VZZgT30Mv4ISmBVG8mpfIanI+Qb7Y+D+ZTqSrCssVvHhGQ8y148h4Y/8U58F9SVKbmbGuqihVWVY4GoUwbNOBqcVJ/etBBn8KUDZPcxFW8ayequJvEqpTU9+EMj27Dmc4YQ/2i2VNxonHwBrUis37hWNejJMZizBgf0vIUNPgikYJBVBqrsf9z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3567.namprd11.prod.outlook.com (2603:10b6:208:ed::31)
 by SJ2PR11MB8452.namprd11.prod.outlook.com (2603:10b6:a03:574::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 13:53:01 +0000
Received: from MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e]) by MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e%5]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 13:53:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230611222447.2837573-3-lucas.demarchi@intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
 <20230611222447.2837573-3-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 13 Jun 2023 10:52:54 -0300
Message-ID: <168666437436.20985.11484968260287612365@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::26) To MN2PR11MB3567.namprd11.prod.outlook.com
 (2603:10b6:208:ed::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3567:EE_|SJ2PR11MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 4104d260-98a2-4d40-74f4-08db6c158089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: royK8ePAZYuIqd11VLvg8Mx9qvcYULMg70deBBYq1ZmJKCof5J11VkZS/nJ3il2TvovTO5cIhOdPPocm4SvEdnrsVmEjlAmY+xWXsh4a0Aju4CTvI5O00LGeq8Me9+m0pHgQnHQ/qldfacGk6wVd/TNbvwLwI194btDAFQZOt3W30xBz/QR88VWo8RPgPkj7N0eTJaWUWsTNfSwKzihZH1hX54y1YEgTt8tAR6bt5oJckapwTnHz4ilSjQ0cWfpNtCLbmb4Arr5FaL07AKq7GRPhs8Z7bMgXsQZHvLfCj++Mn0wjU42Orf6fo9kO7LmhWQCPpEg2rP938f9BLiZypkUmVdUKOf4yCMJLmEtb8mPHYUtPrQ4PWj8lBAVf8VhwkoZFEQdW5r6fr7LPlOdykpHEAtbLac6SC+N5uTJYhjTyfyuy+uUUFl7IUlQ0/65YXjegb/oTI3XSRk04AUPb6jGqEu20e0IEm36hoxiETLxre/zaH7NCEDyph0Q7owG25aaWExya9nQW7wI0NSBx0xZZTkEP1tAiTotOUpFx+g/HjVVtJLNtaf+7xohM8aJK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199021)(82960400001)(86362001)(38100700002)(33716001)(6486002)(2906002)(6666004)(44832011)(186003)(107886003)(9686003)(6512007)(6506007)(26005)(316002)(66946007)(4326008)(66476007)(66556008)(8936002)(8676002)(478600001)(5660300002)(41300700001)(15650500001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZPRDdNRldweWNMa2NhQ1FETytvbnVsRlh2MFRoQ1dNd2dpc1hDYTBaYTRm?=
 =?utf-8?B?VVF6VGRNMCtkd1J0RENXbEZBVWEwa0lKbkhia2syWWRSamwyeVlqdHA3OXRO?=
 =?utf-8?B?WGFvUWE3VlFJOStXZmNkWXZWYW90ZTJzL1UrdnlyaUVPZllIZENkTjR5OTVZ?=
 =?utf-8?B?bmNMOXM3L1dLNVdIRlZVeWZzT01wZVg0L29CMFVJZXFBMjh1ejYwbllGcVhQ?=
 =?utf-8?B?c3JLOVQvWnBTa0taenltSGtiZzlKK3dObXVIdjR5aGkzRGp5TXYzdXA0TFJJ?=
 =?utf-8?B?aXpoQVBpaE90WlkvTUNacjk3cUhVYkVjeTI5Z2ptNW5LZjk2RHBQS3FsVmUv?=
 =?utf-8?B?OEVXQ2JHcDJuS2RnVEtEUHB1RmMrdThCalp1VG00V2g1RjJ4SXVHQTJCSUpq?=
 =?utf-8?B?UjN6OUJnVVNQc1BRQldCR3pBOWJ1Q1lFZy9YalFET3d5SzFZZEtqdmZOcjAv?=
 =?utf-8?B?WE5YN0puYTR0NmdkRFJhN2pKVElrZ3g5dDJCUCsyNXdieHRVaVhBVE82YUNm?=
 =?utf-8?B?QTBwcWYzU2JXQ0dYUHZ4VXBod3hvWk9XWW4rcVZvTEhXWkZaUS8xSjlYQ2dZ?=
 =?utf-8?B?Qjg3R0EweVZOSnp6bG0wZ0llMUVzYktJWnYzMmdxRVptYkl5Z2FKaGp3c3Fm?=
 =?utf-8?B?U1g5cjh1ZXhFcWlLTFM5dnNpT0hONFJ6K1lXNDRGUC9NeXdidzB0ZHY4U0h4?=
 =?utf-8?B?bWtCZkJ0eS90dVdIdWNrVEVpQ0lPSGE1ZlI5OXdYNlpEWjAySXNDV3BtdW9D?=
 =?utf-8?B?OG1jdFhyazJoUEd3Q0cxRFcvYjkxTnljK2dhaTczME5FcDV2RkM5eXdUWUtE?=
 =?utf-8?B?VTFBSGdQZk5QVkt0YVppRzhXbmhBankvMlAzRE9BUUdFVE5rNnVRS1BjbGFy?=
 =?utf-8?B?Nk0rN0NhU1BiSURXQUNmcm4wVlVUQlBINExNT3N2eXZWT0Z4aE4rLzNNb0o4?=
 =?utf-8?B?Y3NUVmFYT3ZHd3pYMzJ3Q21jZDV2eDB1V2c0WmJnQXJUTDlOODdxRU0wb0hh?=
 =?utf-8?B?cHF4N2V2Nm1xazJOZWhvYVp1ZlZPMitOOElsMjNoNEVIZURDM3lWMHVhb05Y?=
 =?utf-8?B?cGgwMFZJK2EyWVFaWDU3dTZPTkhwd1ZHME1kUFZxdTB6bnNScTNpeGw5WjU5?=
 =?utf-8?B?RytrMTdxRko4c2lqL2pkOUVBSGpDdExxNERCeWVjdHlDRWR5UUo1Mk1xbWFW?=
 =?utf-8?B?RDRGeElOZEV4MmZ0bUxGT3ZPUkVEdy9wazJ3S0F5KytUUjJpRGtRRlRHckVY?=
 =?utf-8?B?cTV0QWowZ0FFdWlVZmx3NWtlbTNCcmd2Nng1QUJEbnFablJkaTM1djRyam9r?=
 =?utf-8?B?UjhPRk5aKyt1b3ViN29Md3pocE9xTWE2T2tzNTFMYnM3M1VOMEVyUDBFT2R6?=
 =?utf-8?B?LzNLUFY1UEVoRXVYWFFxb3RkMGVUUE5obFBBdEVSSUVYdW5YRTVWUXIrZHNJ?=
 =?utf-8?B?MHA0UzF0ejBHOGtJQnhLdmVReEJCczIyM1VrRlZnQkRWNnJzTjRBZVd0WHpa?=
 =?utf-8?B?a3BPbUdzbmxIc3BPZmtFakZRdG91eHF6b3NMWXV0bVNKcnNZWGI2SGVvWXYx?=
 =?utf-8?B?RnVTZEh1TVUyVmZnSzlRcVI5MFZ6VVVVbGJtV3F6N1FjalFHclVLeWJkUUxF?=
 =?utf-8?B?Ymc4Syt6eXpNQ1MxRC9DdVZpNWdlT2tTYUgwdkJuN21XRUxmdS8vOFlTcnhB?=
 =?utf-8?B?eWJVYVJhVUthYWM2ZjVQTzlwMmV5Zk5reXFCaTlNeWFmU3pCZ3pZdzBVTzVN?=
 =?utf-8?B?a1NhSXdGem8zWS80ZjE4eURqV3E0TjByb3dKak91RWo5S0FPYTJ4cVY1ZENI?=
 =?utf-8?B?bjNzTkloOURERnBLWEV4cmVVQUxRTnFHRCthMWNOa1ZvSHFrWmprMlRFVVFT?=
 =?utf-8?B?cW9mdGhTVmJGTDFlUjdDOXVnTURHdmM5NCtiZXJyV25QS0daMkt3M2p0SXhj?=
 =?utf-8?B?MVpOMHZTVFN4cDNVaWQ5K2FPbUtya1NUYnp4bHJMV3VSTE1oeVZkY0pCVTVG?=
 =?utf-8?B?M0s0ek1rODNSL2s5SU9rOVBRT0NHT2IwMW1uY3dZbW5Hbjl5VE1zeEVNSVV5?=
 =?utf-8?B?Q1FrbThFYWcwOFdVTEFFS0hDTU5xNnZMWERKcWt6NU5NK2FLeUgrbFdUdTll?=
 =?utf-8?B?SUpGU09RUnhKdlVubjBIaTRHTnJLaHRhbzdpcGhBRzMrVTNnMXRPS2pmY3pt?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4104d260-98a2-4d40-74f4-08db6c158089
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 13:53:01.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8p6MpHzham8HrMtc+mvySCHkSQejGYqqz77VeDTm+WwuJUBbM9m9xbe9rRy0GCTWjQi/uqPBI3PNny7G+ZQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8452
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe/guc: Normalize error messages
 with %#x
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-06-11 19:24:45-03:00)
>One of the messages was printed without 0x prefix, so it was not clear
>if it was decimal or hex: make sure to add the prefix by using %#x.
>While at it, normalize the other messages in the same function to follow
>the same pattern.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index e51d8fb4a354..43f862aaacbe 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -647,7 +647,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u3=
2 *request,
>                              GUC_HXG_MSG_0_ORIGIN, 50000, &reply, false);
>         if (ret) {
> timeout:
>-                drm_err(&xe->drm, "mmio request 0x%08x: no reply 0x%08x\n=
",
>+                drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
>                         request[0], reply);
>                 return ret;
>         }
>@@ -673,7 +673,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u3=
2 *request,
>             GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>                 u32 reason =3D FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, head=
er);
>=20
>-                drm_dbg(&xe->drm, "mmio request %#x: retrying, reason %u\=
n",
>+                drm_dbg(&xe->drm, "mmio request %#x: retrying, reason %#x=
\n",
>                         request[0], reason);
>                 goto retry;
>         }
>@@ -683,7 +683,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u3=
2 *request,
>                 u32 hint =3D FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header=
);
>                 u32 error =3D FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, head=
er);
>=20
>-                drm_err(&xe->drm, "mmio request %#x: failure %x/%u\n",
>+                drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
>                         request[0], error, hint);
>                 return -ENXIO;
>         }
>--=20
>2.40.1
>
