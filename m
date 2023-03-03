Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B96BC64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 06:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A1D10E5EE;
	Fri,  3 Mar 2023 06:21:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56E110E5EE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 06:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677824460; x=1709360460;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9W58rb2PRPk8/Wg21Y505APTyg8BiJ/XJ3LcQOcuLmc=;
 b=Usau8X/D4vqFLzQ8fZsY0hQcPbJqcjZYAKThG2pgcBAeb0Gyf1lZDbyc
 PCTN6WMj/lmu+EoIauZ1DrLbe80JB9tET+3yAYlT7JxnI9del/g2peMhY
 p572FJhXk8y8XA9CAM4ut48uFe4bEoOMfIQ5eIAL1qJeFXL2lEIg4EnRB
 6VulAMvghWUgJkuDwnpUUaEyAb7ze9GddlJP4eeeLtxl39lNARfy6V9YE
 /Y7LJz5ogMgGIkpilUryvmN/dcwyIiFL+xYwsQW0c9mDNROJ7DZfvRI/v
 2XZMCzRukR2T4UE3+M+FnWl+MIGBSIPRnWo6Rf0+LipCXiV4tGj3XPf/2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421239446"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="421239446"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764301293"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="764301293"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2023 22:21:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:20:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:20:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:20:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiZYkCNP1nUA6Pb5pBAiXAguzCaAKcCB5HIWMdtDN2/ODxptSB7BkXeeBRxosftet9DgzsmTFOey93w0RwlWMq1tsXh4TdPFlsKr2V73hiEq7rsNG5He+/FtxDiucj6QdaWpttQ7z13EfLuVuFbEJy22brAT3eSckjApIe9jFFIK9lmLWL1YB4nhwkOJBoOapTJUFJ42bhvYatkcA3JrZYvIimjG5QGs67pE5c9uRFGWeAwfm7gXqN8MWVskChA+ww0wf8AtaXW6KSbApzFo6lysyvVcb+xH+JB1iXj8ocod3R5xCT9FMEoESvBvDwhrB6E5JNPIR6EsTxQd8evmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57Af2R+3S8wUoQL/TvGQAdofTMV98IG5dXJhOphaqGY=;
 b=glEQAr2aN2CKNH5xzx7ZUFaVl7u9xWSL2pjNdRq2cAjR2xYOUUttrTgn6HQLRi45mL4fo2va+JTVK8ao7cL9zjdk3b5Wj2f927ZRDavyUQ2kVWPmg3/K9MieehI4pkFXVlgzEDfKmSBoJjtVFWplq0iQwZ200JeshLPzqmzRNH0JSxYjKTT3ejpOvmeyZxBhJvZUj1D50yP85nMNZ3RNHQRXGQL32sWzEztafUBix12VGMhanyRQhG+/wcwUi36P6VX4TE6FAGAfBhWM7ykCWk++vZaPPRswwi8mv664b0dD2dJA54iJS7h5smZom0cwKjxp1ycw7vUorWZPaHuclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 06:20:56 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%4]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 06:20:56 +0000
Date: Thu, 2 Mar 2023 22:20:46 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZAGRvh1yUyRlNL3E@nvishwa1-DESK>
References: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
 <20230302124258.91081-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302124258.91081-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c29ed4-b14d-4275-1eba-08db1baf7294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WnnqPydWW5WW+jkeDxvD+emFl9JXHD4F3dsQ4dzMrjA2TtjtrUWrs5mE5dWsajCxcf/X/+NTPCLbG2RXic2qB9cMLJXM3WmGl8wnCYC3aN0GBeXbblaMoX0TztbXNWeg8HDhORwK4z5xHydUyzocyinYn7MGpVL42pO6oCXdTf8l89yT3jilK42/4HuTQz3AzlIRm4aeE5NmMZdXyBuxJgwoD2BSPgLV5jY45lvOhuy8+pMVrYZwiO8ec5rMiq8tHetpDXrmvKmHrOMEX2I3gdxBZJXvmtb1R08Zaep9KQbSO9aB1zgUAL27cQUzKZ9zsWwE1nOCWFRVjRP17kYXiJnMz2bOfPX6+UUlQ3FpZ3LjO6gwqzcHmNPG+DbGy5RZ2zNnnS4klBTua0eLxqcQ8lA9ADhBzewUA2RJmSQAK53Slj4Y6Roz0Zn4/uL1o6/2qwILEbfLPCRPQltztByyMuLWnUGE8j9ZtKoCVmNynnLLjWF49kzgDS/yVHTipMZQZZJ8J9xdur24W8TaYlbf48TiW7bd3hhmywQ3zECaqSANNHp8fzyQSiuVYXp7nxxv374CoQnWqvBJNEQsAoF0jfX1ijkMrm3amV841yYtaIRLVWCikzIfQ9n8OIt+6yGywWITFrzq6xVGuSB2JPb5yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(83380400001)(66556008)(6666004)(66574015)(26005)(33716001)(38100700002)(478600001)(82960400001)(5660300002)(66476007)(86362001)(8936002)(6512007)(9686003)(6506007)(186003)(6486002)(2906002)(66946007)(44832011)(6916009)(41300700001)(8676002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?27bHBm7YJnwfqI8qu1nDViqqyWHR0onwQTO2pMJu6i5ht1pk1caMx4OsgQ?=
 =?iso-8859-1?Q?DIAI0aG/pfgjwy1g05QUlmg1B9cH9GfyUFqTgTRHg2dMpU6xEElFHBFoWH?=
 =?iso-8859-1?Q?8+6dB1N+30XXoY0Xe00oda+89Z45Rp35nLy9CP56uU5dtsMaq/WLcfgTeb?=
 =?iso-8859-1?Q?kKd2V87cyX7sr73lTTJzizydrKyuFO78NvKfhYGzKOzv2pAfN4prJ8JSOK?=
 =?iso-8859-1?Q?mDlh1E5tlRXDr0cpOUBYsthoPEQ0CTv37LkpdhywDG3kBD4B2Dh809q/bl?=
 =?iso-8859-1?Q?jamoOLenBXdxoERaORBOLSpmnbv9C9rdwkIkYpoUN1CiQcz7q08LM1dfqh?=
 =?iso-8859-1?Q?MMvB0l/qV7p7JqGwWpBjGtFAK+KyFxa4719+E0z3vDaAnB+1O7mBF3Qarf?=
 =?iso-8859-1?Q?qZqkSEc0MHVEufaDkzr3DQO2YK3ILaLB7ZMJtfpPxDqLuJTpfYl9HJ9sOo?=
 =?iso-8859-1?Q?B0ZymF0q0kYdpjj4HpBy85eyfMBogOvR//gwVa3m54WQvNI9pb76Gr4GUU?=
 =?iso-8859-1?Q?Ng1tVuob5HtBjtbeKOLwM0AfrlE63gHfmiVW9xghp8jisLE4FpQ7Q2+IRz?=
 =?iso-8859-1?Q?J9N1U/ZTSpynaV7Rgpp3NMTWkSK5jikyuWiKpBvWpmr22qlpIB0W8k0Tj6?=
 =?iso-8859-1?Q?15KWy03raLIlGejDdbk7/fEmtfZxCN4r0LgQ2k6JUYVUC8ypl/fZqe+3Sk?=
 =?iso-8859-1?Q?orzSEMIDCCMKpf8FRW5FI6qtSgFG6IWJDPQgbofXUjIDjhupIoSV5VOBxQ?=
 =?iso-8859-1?Q?xsAamra56shlIQ7RLfA/yJVYTlLSbmFrK7DZ+WfdBCWjYwY/Q3OQRr3Otf?=
 =?iso-8859-1?Q?ZSZ/8vW43ANoI4miArjJjx1qRfkp52MEAx/xOapWop3xHzabt6T0fUhCvc?=
 =?iso-8859-1?Q?Ygxq5iqN+KUrptfLuD8ecbddaQTW+jrH1N/ifZpawWGS+3+EXWJz9l+05R?=
 =?iso-8859-1?Q?7CCwE/74WtrxOdFk7t28ct0owodXWH2SNu2tIGcHARPZXky2jOGd6trJ5J?=
 =?iso-8859-1?Q?9JaU9tkAzgNNICKrW0VHSGnrfQk+SnqjjoXrACEvnnJf0hP5GYeLzPhduI?=
 =?iso-8859-1?Q?u6AB9GgjeR50Ql7L7lqEO9I3D9n7vGIC4SnTXbplH0rJ4h0KkqS584hgyu?=
 =?iso-8859-1?Q?HvEqXAQVyGLk1pBS/CCtEBY/sfILvsMTR88HquGjIVX4RYEPbkDm/bER5i?=
 =?iso-8859-1?Q?f75Y+LHMXBIJP8Rp9RmbzrR0fy65dOCla8nvIUWp92QtyYHN3Ut1eLn81a?=
 =?iso-8859-1?Q?x52z9aurErCh2+cWouTSW/93V4tYfUZ2gewddMj2YeNMer2OU8/QEF/kvI?=
 =?iso-8859-1?Q?Nmn7Je/Rr9K5eiaIqaEuikvGaKq2WJWZ8e3MKSJEGS6BOQyIwg8obyqiob?=
 =?iso-8859-1?Q?OnVQhQzaQffqeinSFs7eo7oqraeEOu7q77hb/Oc62Jvx5+SbOnHZhCqFxi?=
 =?iso-8859-1?Q?5TqOXP7fZ2EVdUOZL45IT9hfDMUlfDwHqLazhH5Jvaf4fsDLsq586IKRyk?=
 =?iso-8859-1?Q?JEPTbV2SpJ6qM3Mnf/n5JD5fAIY7P8y9pUPmOSoayxvXtGnpwP2r/tr16N?=
 =?iso-8859-1?Q?O3fGjjofv+bD7CVRkkE/b6dT71Qr05Kse7IL5IF450RAiNO1zzWrwN6o63?=
 =?iso-8859-1?Q?vkz+tLMZMYZHeihhbqUfpN59Iccbao1QYHssFukWqLk6KXr6wXZvsY0zFq?=
 =?iso-8859-1?Q?RAsMSFNsFaF/+HJkB3Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c29ed4-b14d-4275-1eba-08db1baf7294
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:20:56.0156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKudjrqb2gYeNQLg63m1MqCtIqFBc4oUE7cwz5teWoOOciqF63psUtZ2T6F+dcdjr09HJbECmoR8THCh3V566OPFl156mZGcGyN8FjWMFZyOyAXGPKBEDVQgU9ni8LVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/tests: Grab a memory access
 reference around the migrate sanity test
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

On Thu, Mar 02, 2023 at 01:42:58PM +0100, Thomas Hellström wrote:
>It appears we don't hold a memory access reference for the accesses in
>this test, which may results in printed warnings and possibly the GT
>not woken up for the memory accesses.
>
>Add a memory access reference around the test.
>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_migrate.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index 0de17e90aba9..b7e4a126e8b7 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -366,7 +366,9 @@ static int migrate_test_run_device(struct xe_device *xe)
>
> 		kunit_info(test, "Testing gt id %d.\n", id);
> 		xe_vm_lock(m->eng->vm, &ww, 0, true);
>+		xe_device_mem_access_get(xe);
> 		xe_migrate_sanity_test(m, test);
>+		xe_device_mem_access_put(xe);
> 		xe_vm_unlock(m->eng->vm, &ww);
> 	}

This will do. Rodrigo had a patch to call get/put mem access from inside
xe_vm_lock/unlock(), which is more generic. Perhaps we can do that if
we run into this issue in some other path.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
>-- 
>2.39.2
>
