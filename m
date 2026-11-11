Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394F0606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iweORw5j
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD9610E3EE;
	Wed, 11 Nov 2026 15:32:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09F210F997
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794411139; x=1825947139;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HwHl00RGUpfjQS6Du1nhn4Qnv0tREuVwIk8gC8BAIA0=;
 b=iweORw5jg6aJPs4XNRrRlKvsIdJfHdIMniAinKg3hymRYktQSdGbj6No
 QNdkv3XrlbfzFXkqoKIDTSqypQcwMFj/2787Qi5wDlVS4IvVDByBIZ+Sk
 1KN7jy6RlOosJYE8xSB8mio2APB01bo6NG7eO06BfqcpWTLSBefUjx2Tn
 t4mKP6hyS+F1EwQgWg3XfieZzsxX2LzACc0YmiBAat8YoaeLQ1Hl+jb4e
 HMhlc7ArT+bF8oMhrmwXb27QX1a0Y8r7auGMLF8sdeJE+aNaiBcUT4zst
 Q512J5hCRjCYqyfj58C+2sKzFgT0QIhqvmSbXxa0hmlDSrtDOkZ+u/qER w==;
X-CSE-ConnectionGUID: aMvv67q+QCeo0CtONzOkow==
X-CSE-MsgGUID: X4UJ1gbaR2ymO9wiqJuAGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3092975"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3092975"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 07:32:18 -0800
X-CSE-ConnectionGUID: kesfflXCQbS3TiQdm40u8Q==
X-CSE-MsgGUID: Fj2ipl/HS7qqW+4dyvRkUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8481455"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 07:32:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 07:32:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 07:32:18 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 07:32:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVTr2WOMB3oSm0OyPbRarjg+e9T0JdCNumbyDNdK1PMxs+XqCd7S0k0/f/Z2GIasQ6Y7RfS32V/b83MwnZptCpb2lnD5eOjOjUKVQolcvkuy8uOlqft2syShLsKhvwbdb9OnviDDk5ZU4/RRhgf1CIZK7Qe8PdXBM35yMYRZ+rDoIomsoSnJd3QzYCOJFbz5QucWK7s22WyBdG2jX20IphahAWF3qtJ6wNyhumoRFTfTU1fxeAkf0zi0YgqaQA92CPg2stnHSk9DTqpUFZPMIK6RHV3HHK2aygqALtD48baMe7+T0nCwm+BA7QNtoFi+OmcMHvmLBoUHP8dSUCgAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJTkiJJnKaHUYLnapMInjhSTCZpk06deQFf7zDr0wQ8=;
 b=gHsUWUQe3G9SPc0O6kNmKBGxVdK3tvGS3I0HFzFa2x/Vnx9X+pHLp7Do35qYMR3pNhjljK8pdMlwDEazl9UFwDEBB+QhlqT7p5tyFUFKREVaEBaZ0S11CN1HyMs86jQT/ddkBVYGzhZxXsIprH6OWj35VhE7+j0+0H3FPoMDNIPCnrKBm4Qr6xgD5o8qeMaF5oPm1gTcRqbQsW2DsDrxgGks1wYtIez8czUzP75NEdZV31sgl4UrbbcGqOU4nOw62eOe2noGYxB56kKHfqLU+yuN5J0+O1tTFukhPK2U9Ayyeqs8ZIOpWPBpj4mSGHK1clai7jGsBVtZB0vVMrwATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA3PR11MB719904.namprd11.prod.outlook.com (2603:10b6:806:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:32:11 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 15:32:11 +0000
Date: Wed, 11 Nov 2026 10:32:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/nvlp: Drop force_probe requirement
Message-ID: <avSKcvEXGAsoJLEo@intel.com>
References: <20261110-nvlp-drop-force_probe-requirement-v1-1-3dd6aeac38fc@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110-nvlp-drop-force_probe-requirement-v1-1-3dd6aeac38fc@intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SA3PR11MB719904:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b938346-49f2-4d26-1214-08df4008f3eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|10067099003|56012099006|261021123027099003|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: STax/oy+DDL2dddL0N/Afmc6svzRxRGVVE6jw9rI8HuxUTCvMGItrbtf53iqneoGOqsYMZ+GShB6IgmpGyyyzqgZZGJc5QUJqWfnNyyYFGnv/oCoQQQ6e2Xd/CbUZmvoaZ9/YijCiEB7jrMNXsO1l+A5lfslDYLDO+zqwvBv26KjYbEaSleCSnQ39P4KNoKg8eZWAc5X3L9x6e7/x0toM4SBs6BOlyhuSOnHPKHzH68uKfBa6HsiAPvCvyVcHlcqVEkJ9yRU6xkjZfVlRl3WR68YfW9ekOY8TvqAdkeE4z8eMxpLiM/nabXUeZldrLA0wtXX32uCQ/SJvSxkLMRTVCL6ZUWYuCjrAgcpsrXLmpATLJaPS4QZd+3WqupicUpqsc/fbH3/8j+1pzRi7QTAex4J4fvk9PuYM5uhvxToAJsvGiqgWB99y7TrmVMtGRIGjK25ennhSYo3fzXZCkELNZJpTP45ocFH2FDG91nW+2hE16tYl7M9xaQ8d4715qKV35vXMLJX4B3jx1b16Riv10+CMbDMKP+wDdKCUiyy5Sp1WpDfppc4vyq6yQ2PguVgYKKwjhRW7+E6xhueQvv0g745S681Jx5xxEZWlGxBALnogLL52a+0OwiHtZ7aWGXjOpGgVfNpy9pLNCYmMlTKbG0eBSAFeOngwSj5ZQtakf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(261021123027099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w+rbUOTloI1kdU6+P1mWjYCSx0HeTAngJztxT/0E7HDSj4k4xQdGeSdXgs?=
 =?iso-8859-1?Q?K1q3AKPET/WKcMl3T2vX4mLg0I2pUW91/pLffrCFGaj/75nLvTmllTMSzP?=
 =?iso-8859-1?Q?Cd7cO+lxxM0GcpqB9zZzItwZuggW+vZT4hyZqGPLFFuOLfmjFcA8Hfgd7d?=
 =?iso-8859-1?Q?ODbBgGlXknZWhOzjDgCQa6RDf+Yw71GxqYlvcS3k8SXBCpBuzlN+8R7tfB?=
 =?iso-8859-1?Q?+/XKaYF1DgR8luMiatCs9m7gBLArsTx6uVOcT5ubJsTcFrCb5KtwmeYdIY?=
 =?iso-8859-1?Q?ev5F3wvMD4lGAzIBYoMhrD02bwKyTlFKmEcoNFWbx+1tJfeMXh3hjVt7za?=
 =?iso-8859-1?Q?GcyAQQ1y0ODP3/F48H+0jPI/X+PoOjj33zQWPiUb8PSY+GQjjPCALG9pYt?=
 =?iso-8859-1?Q?5K9nMVpD6I+RXk7q8ql8jD8NrK1leTCKUz3mQz4sXIWJXTdphH/NnQE2E0?=
 =?iso-8859-1?Q?RV5Q+O9P8LGnNP3YgF828H9MgA9/wHnDk7OFrrTFj+aTsag0EE0LF2uTO1?=
 =?iso-8859-1?Q?nkj1Hp3xNGkzYldVwjQG17d1D6XOp/ybtbdBW9RKtSiqF1TlBaT35+Xbb8?=
 =?iso-8859-1?Q?0xX0nQ1GduAciYe2vQ5qEjA8RNk2iT1OYbZqdqUkI6UYqoHVA+jQa/5Hn9?=
 =?iso-8859-1?Q?MqxBMJTnQTwXZfYlvMcJRBqas8R3KbCfPJTBS2FdiYQkyDh6vd9HdJyr09?=
 =?iso-8859-1?Q?CAqAxv5QzOhl4utloVr1KqfzSx/NuMtkTE3FnIJ35XvDHt036400bXEkaQ?=
 =?iso-8859-1?Q?iMLcIN0ULOvPAedX0NEE9YNiv1wIOSyWbeTHDzT/8vM2Fj+yK8OwHVkWw+?=
 =?iso-8859-1?Q?gIbIDET73PwIhhT3XH1MNoU1Osui7kAEUtJm/ceF9ilBklS0G9y2k1KndJ?=
 =?iso-8859-1?Q?tB069AICIOD6h4RENzEscXTtK255fXKYda7cW5HaP1phFgfles5OAeNuP+?=
 =?iso-8859-1?Q?rV+A3W2qpxuA5NH8Icihs0CF1aiLXkbNk+WIYhkvIbHgk3YpbHqzGxGE6z?=
 =?iso-8859-1?Q?xYGtFwcA5l0yKtXvVrYvdxwkLsbBxZVjG7gVz0p4ji/6giClIIs4toCrWT?=
 =?iso-8859-1?Q?vCzp7R5ox3jTmqs+bBaKy5xgMiLSR7xH5zGfUA3u43OsfBktBgEujticXV?=
 =?iso-8859-1?Q?FiAPIEV0vafc/WoI28J7BFYQZhT0C5ZLwG9om7kZtj8HVAPB4LAIR/IWeT?=
 =?iso-8859-1?Q?pkxz4UBZtRVEVDFtl+FD6r1NNXo7J94uTfwxNXhvDSXgO5nTHDrAHr2FI5?=
 =?iso-8859-1?Q?A6hA6Ose7bK4w7rPRS8fjzLJ5oiU3pydz2U10rePk1+um7/hPSH6G9Kb9Z?=
 =?iso-8859-1?Q?MJMPphjMEnvFtg19cduq21fFxvQi/YGeV5Vv6JZE8aw6Ovwtg8UAHLPtuq?=
 =?iso-8859-1?Q?YEaEqP6rmo1cRUiDom9spPYdK/snfIoCZ7QPhWO5V0dZ2EGtfTNtX7/Wej?=
 =?iso-8859-1?Q?tyL2BlPhKO+BsJrVnbAM5tvwfzs97Gp6c28S7slenKcGebzFh7UZQP3iNU?=
 =?iso-8859-1?Q?wenyZ1+SVngTwVE8AwPAPAzToL4SAEz8o4aMbGSPU9KzmZECe3YNT6sXP3?=
 =?iso-8859-1?Q?vvVvc6mtXMi7nXpoI6O+S23+Wm30Yz4X0yD5XxbqL1UsjMk5qXWhRmJOAE?=
 =?iso-8859-1?Q?T5HjXG0mPiclWea154PgoRDXN9gvKwzycTwiQEG0ksMleTv9w76YUtwVFn?=
 =?iso-8859-1?Q?+HqXFjGHnm8TMMC7XWmyQIQnz3238tAOThLshlB/78NnKLo2Qx0+sexE7r?=
 =?iso-8859-1?Q?HlOjkSIggXcEmPSJ/7cvNSJ0xZipOTrzlvBP7n7mxErHFgn5U+/LoTN7aL?=
 =?iso-8859-1?Q?vh1xZYvt7w=3D=3D?=
X-Exchange-RoutingPolicyChecked: DkzCcES6tktps4fSL3YCxhz0koB0wZquh/8Xp+22W5zv2HzAmio40r5RlfL6QfLudJBfOLzdRyrYk+t9+wrPdKrPoyiOZH1CzyeA/PKC2HQKeMEM+EZ8QGXsBECgC6i/v5AS7f4JdK/32jHZYewoYh8EcBEGoK6HOm09iCfeLCPdI6h0olKNsRcosKrevi8u8GL983uUkEzUum9da/h5Qng8R48b3tpm7MdUN9AIYokvpu8IZcljK4nWF9DcGYdRDBD6mNK7aoyIVb+KukfecWS1GaNyqJg6Xn+lZKHF7FMVs/Z+oBlv6gwiI5C2lauc6yD8Hn0/5a+hIEde/d7gcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b938346-49f2-4d26-1214-08df4008f3eb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:32:10.9695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEkL6C4P5JCKkvhV2Q8R8Sr7IKqTk3sbbnIHX+TnU0MFsYebUE2qiLnIvWGEzS2XbKYqshChy1uAbPnsMHDStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB719904
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 07:52:23PM -0300, Gustavo Sousa wrote:
> NVL-P is stable enough for us to drop force_probe requirement. Let's
> do that.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index be1b063cb68d..fefa600b7ff7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -508,7 +508,6 @@ static const struct xe_device_desc nvlp_desc = {
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,
> -	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
>  };
> 
> ---
> base-commit: a6a3cf6cc0759788b1b0ce63f9cfd855d5785449
> change-id: 20261110-nvlp-drop-force_probe-requirement-7deab7e4e3cc
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 
