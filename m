Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F1AEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6249210E632;
	Fri, 16 Jun 2023 14:18:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5421210E632
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686925123; x=1718461123;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=2zgCz3265At9vXoSd71j11asSy1eGq7fo9tBelrmYcE=;
 b=Zni5d2+0yW4g4GRw7YBwoC/D1il5SlG3dUmdZAaPea7CrQeKHuWZb1zv
 nYKWQ6fziIvsFl+GezVMhXogEi6/l+pwTwjc4kr7ypetTERK27PlAoDim
 yR+QeQAUDiWc3K61916cD1QMLM7jkYCqKXGew+TGRq6Kh72Vbc2EVWVM6
 ZBpICwJFNUGgUdByslwoeCOjZe5nNOpAT3Ak/2D4ioCj/gT8SD3j5OI2l
 jrlJT/gxc3eKvWUc3jetCF1rIELMG4uS9brSPF6FISprPhqphQ6j3iqN2
 kCdlLzxs+1wRNYoQ41FbUkUkhVLKA60eeT84WbtvVnVrSvxCGCQqM0A5e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356712382"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="356712382"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825762117"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="825762117"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2023 07:18:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 07:18:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 07:18:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 07:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ3Gb6ZFDI4XuMIn0Zg8rkBfSIiYmaGpxVubBKjwIom1QfFLfHmdORodxfQswVAXXEQYUk4rzvY+VGtEsGPb3SCoVCvj5h514vB/9EMSbuIpCrl0boVjasVr61I+MIG3lpdmDqdHpEKE2r5DOZgl0p8sfyUaFC8lyePH0oybU/EBIxW6aAAsL9E2VkHqj5zfF4cpemy4laif0j13PzR3PSihWk9+yS0AfRAkOjdDjEGrguiEWJRBJ1+QSkKD/OdivhVxo1CYnBAPcpA1zgQNl7cimaRiXI385bAPdzFq9FYMt425lZ2Ao5gK4NiEQpsq9YiLY4YtgsBbqYEbEvQY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIn6kDHpxZlMM5ndMLn7xJQXPdD9/bL6sCzyPID4Q6E=;
 b=BBUk5N7fbxIPTqtA4bpol3RkVVzDWvb6RdgnVE7xtO3mBmnXpZF4m+gNly7wBg9QuXxTFGzXLroQPw39aaXFomkX1P76bB8HRyT+ffgPkCLiyT816/Cs3BZIcQTJ7wKfPi1OZSU0VaV5Ay/5k0x/mt5AXICp+hSQSkVVuBsPhYJiNIy5foWfjqAzWhjWKkkKdBISMX0sszDoPIiLyMnNzXbKTqrL+OP9LpMqeGa9v3UnEf6FHr0Tm2AkQc/xVcbLAI89vatur/8Q80cK1RMJVdB6Zgqivz/xM6vrTEXN3YMdtykw+maPbuxEVTyrsSHrpUul2E7S8IgfuJotOqFpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 14:18:40 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::e819:33fa:c583:f09d%4]) with mapi id 15.20.6455.043; Fri, 16 Jun 2023
 14:18:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230614205202.3376752-3-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
 <20230614205202.3376752-3-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 16 Jun 2023 11:18:35 -0300
Message-ID: <168692511535.4441.4338402465199104186@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:303:8c::26) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: e48e6a0b-e2ae-4f2b-0b20-08db6e74950b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+9UuVbWAx3B8bK5vCbp3sucX+6rIHRHQfpC9JJ9oGYX7u2qfXRewRRvT60UqngyPLj+eLXr2UQojnTylVP+ipHtvW+WbOSkmfZ5C3ymy8dZ+kmUoEv5YSdhnC72lJTqYXUzkgwQa7Ju3UGKAatXOIyWaq2D0Q3/20NibiwvrUO8lON671qlflfLjeWo7MVZ14mbwpapflUHJhYjoYH2/TTFuRcV7dUcENTQg3lnUnVrxihGx/9ESi24tUoXqBpYkRvZ4FUXkx/EUw74oB0lf7NGmoOD8Kr7D9rKLaWsqqmNYEHK2lrm1pFr8NL9kmgGhST0UFWYRKWfnlfIaqOrcLG1f0bwJi/H8ZnsHHAUjzr65qxCUrnBzNBvqL2L0vmRWc/glSa2WYzDlG9FVKN7DpTd1cn8k+K9Uy2F78xApejU4z0y+s9D1myWcytuLXbwsOkP1tY+tl+508TIjXVDvGhnIf+wGSJGjRtiUhhaCnH/pjMLlcuQZcg+nRlpidzp42GtBzDVH9sRhj8a3+x5MnKfeegYYKkdUnXLnpDlBKfmqvoBYBJ8hI9BBMe42M/i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(5660300002)(82960400001)(38100700002)(83380400001)(186003)(4744005)(2906002)(6506007)(6512007)(107886003)(44832011)(478600001)(26005)(9686003)(66476007)(6666004)(8936002)(316002)(6486002)(66556008)(66946007)(8676002)(33716001)(41300700001)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhRem5Rb3J3U0o2bjU1SXMySXBtaWxndmhYTkl5VmhWVHBrUU94bnlQSDlY?=
 =?utf-8?B?WUdjWlY4emY0V2c4MTRra0RoUWwyZTdCbmlkVTFSOWdiWjFaeHdETTVhaVRR?=
 =?utf-8?B?bllpUi9qN1BTelpXWWxRZFY3ZlFKV01ackhkRE4vT2tnRklad0JHaEx2NEti?=
 =?utf-8?B?UGZKWktjUzlNWEhuUW0vL2dYOHFRTEhHUTZhaFlIQ2diOHB4UHZZb1NJWlhY?=
 =?utf-8?B?MGIzMmlzRnpNQlBtanUxL08xS0lsR3lXZHh5dkg5L3JBVXhVZGpEUnFOaHhG?=
 =?utf-8?B?NHcyVExNTFcwQUk1UUZkdUpaWTQrYjFXUk9rVzhqbmI5TGJyOUZHb3dWUHlQ?=
 =?utf-8?B?SStPQkhPSko3b3AvMHpzM2QzcHR3QS8wQ1lOVUZNZ2lQN1FXWnljakZGN0lk?=
 =?utf-8?B?ampPVEJVR29IMVFyQlliZUNrR1IxMWhLTjFuVk5qUnRqQzZyWlV6REdLendE?=
 =?utf-8?B?SzRubm5VL0JoU2M3TTFkeWpDVWdaQU1aUGE4UURWR3ZjY3RyeGxHZGpGY2ZC?=
 =?utf-8?B?R0ZGeGF3b0NpQVpabGJrZUtCU1kxbXkxMzZpUDdUYjdIdTBuQldaLzU2WDAx?=
 =?utf-8?B?NzNxTlRXejBzOWdSQ1dPa1RiMVJnd0lmMFdlaFRob0pUZGJaNjNmUWRobnI2?=
 =?utf-8?B?aUdRWG1rZHZ2Y2FUQ2RJNWdnWGNpS1k1QlZmZjhQYnpiMm8yMmx1a1RxanVs?=
 =?utf-8?B?QlpEKzdKUWRNS0YwNjNLd3hscFNoQjd6R3pMaUtaZUJydEEvZDIvei9LblhV?=
 =?utf-8?B?TFBSTlJ6aUhMdE90NzlPalRDQkJMRi9NdHM4YU16RXVZUFozQ3dDcTg2TGVB?=
 =?utf-8?B?VVk5Yk1kK0xNVEgzRkhZd1BDYnUxazdZbXhYVWgwMW1EU3cvQjFDL1dZeEJp?=
 =?utf-8?B?Nm5CNEZ0UERVRVVZK1NPMXBPR1Z1UHQxU01BaG9SYmhIVUlBYmpaUm9CdXNU?=
 =?utf-8?B?RDhCcG1qMlRuWm1sUnBaN2tjZTNvTm9FZlkrNWxHUUxiUzVRTWdVR3o2Wmd3?=
 =?utf-8?B?ZU5sS2hCbGEvSGUzb0JtbUlSWTEzcUpCamRVVnBQai9zTHVKRkw5WVVaL1ZJ?=
 =?utf-8?B?WTg0V1hGclVLNWhFV2R4blBFdXUvU3lUMEZaSE1MUmlDUm5mME1rTVBZMm9u?=
 =?utf-8?B?RnhYbnAvNGFJRHJEVGcreWRDWkN1ejlQVDcwRG1FWXZMRmd4WEZnRFZPVUFC?=
 =?utf-8?B?eU9LNTVkV05iZUwyM0IxZEM2ZHBRVDJHV205ZFlIODdiQmFLTTNvNzhueGph?=
 =?utf-8?B?Zno4RWlLN0FiYjVIaTU2c012NStxYUwvZFI4NVdFZWlBS3FOemNFK1A0cWlX?=
 =?utf-8?B?UkpGTzZ5SXF5eUlBbWpmMGYxSlJ5cy9qZ2w4eGtucVk4YTdjaWgzeEF4Q1JF?=
 =?utf-8?B?SFpDVDE3VjZIbWlqYW1nWnU2Tk0vaFF2NWpuclZGT3M4ZmIra2gzNEV3aTNL?=
 =?utf-8?B?SVYyakJKQjk5ZWxtREI5bmMyU1RDWmNyOE13U20wNTJMVDh6b1VUK2JtY1FR?=
 =?utf-8?B?TUFJajBRQWhxRDZ6MXZKclQ0OHZ1d1J3VktlRXp4VU5GWXlTM1QxOVczcXRE?=
 =?utf-8?B?aWI5aW1mT3FlMXRhT01HbGxoWVh1MzNGMUtmQ3VWWXdlZXZ1eUtyQjU0U1V3?=
 =?utf-8?B?N2tVd0ttbkF6L2NZellTdlRzcUVMbEhUZW1WWm84R0oydWhRb1czajJueFdU?=
 =?utf-8?B?WW5vMC9ib09SWTFZclNidUdXblNOYUh3WmlVSEpuWnNtZk5yV2RwOTUvOHhx?=
 =?utf-8?B?dVppeWo2NTJ0YlM1SVlJZTV1VnRxcXI5ZGhEc0ZpdUY4dmZHNUdNZ3JoNENF?=
 =?utf-8?B?ZXZWZHc4NTdsTTVuRVFMeFNIcEdlbFI2Tlg2N1B0YWpWZTNnakFrNERlSVdY?=
 =?utf-8?B?dXhvallNNVdDQk15eWk3bzFIS1JpV0JMUDJQNnZ4aFRSVEVra2ZYOHZwNDBn?=
 =?utf-8?B?dkVMQXpDVzdmeWZIWXlBM3psRUlEOFdSbDVZelkvb3VJcE1WN0hOcnIrc2N0?=
 =?utf-8?B?MFNycnNnSDFWOWdNRGVUam1hRXBuNE92U1RtK0F3TC95MVFOazhBbEJnVlU1?=
 =?utf-8?B?ZGpsSGZQQTVIYUNWbGxzUkMvYjgzK1pKaEE1djQyNEhBZVFDQnBRb1FTQ1c5?=
 =?utf-8?B?RlhBR01idzhWNnlQZ0NxMlNpejRrcEtGMU1HT0swY0lienZ1dkxlL0lrSWZw?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e48e6a0b-e2ae-4f2b-0b20-08db6e74950b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 14:18:39.9974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIz2E+VqRIlUB92Kq6a+YqsqULXPj7hQLA1sJZG7NZy81SrO+4kqsGJhYigbnw4rMXwnNrzKHtu/iHoKj1GToA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Don't raise error on fused-off
 media
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-06-14 17:52:00-03:00)
>It's legitimate for the media GMD_ID register to read back as 0x0 if
>media functionality is fused off or otherwise not present on the
>platform.  Avoid printing an "unknown media version" error message for
>this case.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 7926c2fa1433..b5bea42a458d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -465,6 +465,10 @@ static void handle_gmdid(struct xe_device *xe,
>=20
>         peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
>=20
>+        /* Media may legitimately be fused off / not present */
>+        if (ver =3D=3D 0)
>+                return;
>+
>         for (int i =3D 0; i < ARRAY_SIZE(media_ip_map); i++) {
>                 if (ver =3D=3D media_ip_map[i].ver) {
>                         xe->info.media_verx100 =3D ver;
>--=20
>2.40.1
>
