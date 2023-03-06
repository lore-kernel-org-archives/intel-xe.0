Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757E1C61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA6A10E263;
	Mon,  6 Mar 2023 13:35:52 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9998610E243
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678109750; x=1709645750;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PZqAmXVuAf4Ll4Lc2mLmMVwekxBf2rcsslTL7/J2BJs=;
 b=AiM38HB4LzIBUwo4u87Svk9P7BH3Qn9HqgB0HBIjkFeQhm6tDFEFSmx9
 pUHOv/EOZZQXInylaOdZAQdnTqTZUZ9CxWVKipG2o3CdkvtH9IaSey77Y
 jSYXiA3BgASzPe6qgUZxSitZCh3dyYDo67UdST25BnUtdxvHc9qNyzv7u
 KOlsrXlyoF1fRIwRgNEcvUf7GGxvbwDGNjzJEgp63pNvKrY6A8ruyOISm
 6h21Vhjm8EqcAs98tgYb3NBX4oKkKxtfozG3WyCecy8Bu+SQz1QGAR4SK
 0vblJPEFau2Y+l/r/YVWRaFtIqsKfJGp2T7UUuNAQhj0VIEnG/b+jHFoJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334266752"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="334266752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786233999"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="786233999"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 05:35:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 05:35:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 05:35:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 05:35:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXQ2/ZnNHFN4I+6gCVk1vVZR16uSfaYtD5cmtUP/OUg416vYRYbvSVSABlwwCAccaqbH3nKDBw8AfaEryvWUyQEJfxmrlncUbWjIgq1z9f1NVNUDsaiU7oHArmWKnfCg4oJHOT4PS913Wu5FqnvDkzGYJQnX/5VSYvPX6Nlzvg7nP0X5nf1XZ9tR7s8Rg3nH5kU41Os0mdlKx1+Jqnjeoq8NQFAsygPY/e65MUnnT6IZIcfZmvc8DUrOiTAdU0pnxwcDZJrWvc3f3LcE6ooCeiMthB7zPZJfOXkG4zdtQnI2MMhKzRp1ztN4PHNeY28LRi4bcc7LPkVFicb09YwvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2+ygFXfVu3IU2K39oJnKi6QJNMK0WGbNUIqD5QDdLA=;
 b=BLfA6oXj+JE8fcnlb4JhEUrbPSJqWB6Se81CaNYRIgMtxle7iZPSe0y40MKUqcRfK1XTpfb7eixnDVHeKL1vNh2tK4SKK99tgAU5gpI2xWrNjn8mkiD7X4CExFRdNcueyQOyDYlv/NxICaFk3M00IYKIjDE68zv1QZ7mQVsV2YtppWE0Ikl83MKWYPcKU/FZUJaS21Z/3lAUy8VhdqMsxyyBsDMyN7cCv+SfaVWht5SEpudRlTw8eyowtTqIkYgdF6jiEk9t6XHBPaBMKH1px/am6cbRYYqBfuM/tGxBdr6Rbm+1CytomnQAExFbfsNWTWRsXvjqXQgJs83MvPz0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 13:35:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%4]) with mapi id 15.20.6156.021; Mon, 6 Mar 2023
 13:35:47 +0000
Date: Mon, 6 Mar 2023 05:35:35 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZAXsJ1OmzKmwyFbn@nvishwa1-DESK>
References: <20230302095528.20469-1-niranjana.vishwanathapura@intel.com>
 <238e79d2-4d99-b526-eb0d-049506072fdb@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <238e79d2-4d99-b526-eb0d-049506072fdb@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::28) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b27be85-e9e0-4ec5-1d82-08db1e47b125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U00Uf4/DUrWr3aRHfCLIauaIi/bDrI9ov/51NVcbDCEoXIHPWPaqqaalGOYVZpg9uMzD0prCxC9rVm0sG6AkVn5qE5P1iRmACPViviQb/VEW42MTmznvYc/QbopQ65CcuEFtF61wVE5JlultoUm4ezf9ODmVw2ELQCtR3b7JlnYABTAmfp3S/h6f4gd+xTJU8EfhFLtXuLUV+Gt40n0UK+O0XUa+pflhJ6hIXY9dTSi6atE9Q/mAvrUSfPFZDjKploqE69DDdidd7cGdq1U8UFyS+Qk6xNuVIwZEBAJWjyQX0cd741ioZUpEeu/iPYXR6UyQBpn4BLwdaWTAkX1xULMIo7U5cbUe/DMd00EtgnQcI0OYuDRyXj3qm7Jq9URH4ZVszbBAOFgz2zx2NYiI+cU/iWW1PEdP3Mhqh3cArlJ0fhhEBwSyI5IBK4LqVNt9neKT13b03brmedJnqv/VK7JC4/7NrZjcVjSYsH2+85dJnuvfBMZQQlPJZaDXoPlJrvw5inSc0JkUEELoodQLvoA8lX5Kid5Lf7DRV6GFzFoA+PM67g8P44Dff6bdThQTTHXhbQRZYtiZpe5iSN5FRTl6eZmEj8YyaG6ivtjNyq67omO1BSkH++H6nB2U4LZpN1ytWEteGqt1WT4E4+Vklg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(9686003)(186003)(38100700002)(8936002)(66556008)(6916009)(66476007)(41300700001)(4326008)(8676002)(66946007)(44832011)(82960400001)(5660300002)(2906002)(26005)(478600001)(6666004)(6512007)(6506007)(6486002)(316002)(86362001)(33716001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z2+fbRhB5pruyl1qhhcKkJx+HgUcAcRQHfwdb29HEFxKq1+QMxY+HZOAZa2K?=
 =?us-ascii?Q?4Neq2bWiQ57nL02vBAMyJ2ZRtBReM+Ut7jmgOwKEK8Ow81lEIve709WVHhql?=
 =?us-ascii?Q?QYIPg5HFz8gsicdNvsG0a6tlxMhGptfmOk/a3XG5Gezx8yLFFq6tuWUdHIW2?=
 =?us-ascii?Q?kzqnwBl5q6vm9SLe3C6ZWNgZyriOWqeG0b3OTng8078hy60miSAk981ceBYF?=
 =?us-ascii?Q?9RN2Qb4aO/Go2ORbE71yqMFLjEz+61QxnUaMx2bhQvurr1oLlzKiXqdPYFhJ?=
 =?us-ascii?Q?b88qU5BM6LuGyTCT3QJfI30hZ4RiNeUrgP95dAl0PoBud0H4Ke0m07/1l9G2?=
 =?us-ascii?Q?cTnM0gfEMwE4039cci+fvH19skhaMqfMpP6oAh+DwUtLN1KaJ2uKGcW9hFMu?=
 =?us-ascii?Q?7VAWMNv+iL0yF9AlTxne9tjAdgXlxgQlOByNl3Q8qTooGcMj+X5htEdtCXVE?=
 =?us-ascii?Q?RTytsLuX/yx9iTN4x4P57XSjnUWNr6GtLPZ6KjvmoN2zB83TX9kU2JuF3dC3?=
 =?us-ascii?Q?llKWQcERPiWmaIub8ETvYXuLkiXUw74BCwOg+B6u1eX+OVT1Me8M+VGQ1T+P?=
 =?us-ascii?Q?KGK8fB6fOFVjt5Jo24J1hyNKikAeqLJS9mdBEiRBco2lYiX7IvG9+y0571xO?=
 =?us-ascii?Q?gDHbO9x+waPmy44d8wiQrilCRO6b/Gj8WimelQOdpsFn49qv+HQseEAMQG7p?=
 =?us-ascii?Q?12JivjtAaahf0FxnnYcrLA/uiNMTuO+9/SZbGUbr/cJLfX7b1eiudzbRHM8S?=
 =?us-ascii?Q?NVdFfTnofigXj/bSrCW+UpGu0ZSsJeDdneR2gHMs/JDzzSh7GU9KeVtuDgwh?=
 =?us-ascii?Q?H/OpTMRSfh7ZbwBT3LV9e+XDTMufZILvRBTJkz1npzNym1ZLlZxHbRhOB9kR?=
 =?us-ascii?Q?n7hWWW46jKn4p003TIvaXb+98rOw/Au6O2SIS13pfRVDvpP+C4YIs90R3h8u?=
 =?us-ascii?Q?QQ/AIeaMjf44YyinorzKPtuPHLu2KjaOD6Q/ghkf9mx5caFyyVuCNQuqpaw0?=
 =?us-ascii?Q?qGTFikq2j/ImuP+zCR9PS/D4wnrBxSF6jC8R2BuT4nGLND3owM+0NyoQssII?=
 =?us-ascii?Q?jVGONFL43uRviQIpuxstcFRYB7/gizTizoQuX4kaMNkieLlXe+vzkOp0vzpc?=
 =?us-ascii?Q?nk/XXZtmQ+568cvvksnSAo91gEofSHUNpvheTnrEHTnDEqrF2otlP4SviEzv?=
 =?us-ascii?Q?Sdbss4U+Gz1kEqNpGj5bO/HViXvPvK9CYUEtJr7/a+CavbJ38HVyIJgCT4SO?=
 =?us-ascii?Q?g7IBPhl5BdMe1yvo+1cvD7btCyUKNMPM6EImb6BVaHDLKGY60mhIX5M/JnmC?=
 =?us-ascii?Q?wASdmvqxACIkDWGw5eWgv8lR5esnN5dk3c7Wj+xBI95RUc4gkaTuGuZgxGnC?=
 =?us-ascii?Q?38A1yX6Nb6ihRngQ7qvA98D//r8gJvXUqI5CUvBwhhJB3HQKW5hTbeFRUDMo?=
 =?us-ascii?Q?/XLCPlsv0OrAZ9lwC5/f6wSLBAlZFMUhLs4nTneZFLDcnsp4g75NUH6flGRa?=
 =?us-ascii?Q?mn6ItFRy5ntkAxkEMWi+6wMS1BDyvrZ8OV4Z5fU3kJWnXY+oXbaeYWkfh/V6?=
 =?us-ascii?Q?YHCg22vdA/siayPyh3vC7Bt5cYN9RBrDCHHeSAd+PU9Qt7Lq84ANl1bo4OkA?=
 =?us-ascii?Q?KAOzbkW+wRUH0wueeOxIjiw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b27be85-e9e0-4ec5-1d82-08db1e47b125
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 13:35:46.8143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0M7VwEsWY8GyuWdeuyfbFs7kjduzQuQ9dfFFgdTLwjweI0WFGTVnL2TpSoMCj8A2hImyGw6uI+Bf26QtunIiV+Er9C2xiACj0wV8Jx7ckHRCBP77Ute1W9J1KObEf/rZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/migrate: Fix number of PT structs in
 docbook
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 11:25:46AM +0100, Maarten Lankhorst wrote:
>Hey,
>
>On 2023-03-02 10:55, Niranjana Vishwanathapura wrote:
>>Update xe_migrate_doc.h with 32 page table structs (not 48)
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_migrate_doc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
>>index 6a68fdff08dc..584972c4d3be 100644
>>--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
>>+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
>>@@ -21,7 +21,7 @@
>>   * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>>   * pages.
>>   *
>>- * Currently the page structure consists of 48 phyiscal pages with 16 being
>>+ * Currently the page structure consists of 32 phyiscal pages with 16 being
>
>This leaves a small typo in physical, the next word.
>
>With that fixed:
>
>Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks, v2 sent.

Niranjana

>
>>   * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>>   * several pages are needed to setup the identity mappings (exact number based
>>   * on how many bits of address space the device has), and the rest are reserved
