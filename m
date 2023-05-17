Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3228C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 21:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FA810E495;
	Wed, 17 May 2023 21:12:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357910E495
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684357970; x=1715893970;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kXzMNsrj+/m0Hr+14q9Imu4THGxj9KiqlkcrMSCOgKc=;
 b=ZLS7EwFjlK6mJlhrLDE1L3GbcW8qH4op1l3IusID5eV4sYI9NVhKP7gM
 h/FviuQyh84xnNhLRuWc6kPBWWJipbMaQJi9kx0LvhS/VdsbNwlU2uFnc
 wpk1SK5naEIJvcEGkwcikWuSWiINLBoTw06qMMtFI8Uoiu3oC8r5bByZJ
 BY4dMh7Ie62euzPH5ahGuQkTLQuG82ozp58avs60CGI9YOrgDIjMIMMn/
 Pp4A7ClTtcVAK+dNzd4xn3Kaw/R1N6yS1rU/Zz+8F5G0KptWzXQdAzE/O
 LIY2Wo/ju14oZI/VFFeLy+GakmOM1QWe0r7BjA7poLyr576F9rBfUHYZG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349382565"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="349382565"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 14:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696027376"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="696027376"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 17 May 2023 14:12:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:12:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:12:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 14:12:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 14:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMf9tlVKuHy4QkGFwFQZKkqOfkCFJwaxHSI+k6LPJoJBlEo4Sj3oAdDJWM9RgfjDS59bKrc8lGsqu6uGfMm7rWN8ZLqEDcjFrsCJsiyMWqh2KOu+Xw5402td1XdYIkbvfO0q0P1bEazr16MFIuekEmaPfy8QTvC0ixplaL5R6TOZTnW8IWPcD9ztLgTDMWBdFvk+PYZP4/xQwe90/z+g6lsMJakmpzCkxz7JYTxD3Cc/UPrwW96vxnNkwFcQNc/EDgtOc+Pv7Kj55U0GxwGwLT/kXPsZeKeODFyoAxlzsbCsWQ6DDkzowgsQMRrUm8+yabwUef1vHMSoiDq/yEJCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnmYs1k42KGJe/eMeCiz9Vm2/zI2gUiKcS+/GQA97AY=;
 b=kA2jWlwymmDlTIYKJV+Sb4Ilt2VyDiJe2EltuKKyBDhK5juSjgCx9ZCkyELAi/AI1O+XxcCA95Tpkqfp2SZHfs+1qnZR/+/aLXapsSQ90f82wd9BjJBc4YLKLrzg2OkYg6uAJgyMrqYOPDUzO/b2M5u3i2Wa4V+Gr7zS1HrUUQsD0+o4IlOwrqNSjAPKn8yt8erIlhfKNAkemV16NvHXVRi89cQNi6SpCzQRtrB4GABag+7OwcdYuH5u2hITMoGfb4Yr5cjo+xp8LGCBjs/7Iy1bI9KYL/IG/vebI5J18JDefBA1LWPjAOewDe/UKB3jUiQurrArcD61bgLU3wX5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 21:12:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 21:12:45 +0000
Date: Wed, 17 May 2023 14:12:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <bremltb4s6tbt32zp2tgkcoduvsam65pacjcqidfecydkowe6d@5xiejzp4qema>
X-Patchwork-Hint: comment
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-9-lucas.demarchi@intel.com>
 <20230517204919.GU10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517204919.GU10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d5816f-d2a9-4789-4aee-08db571b7588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtGDtunDaD07nsZoHWBZ7xroEP3MnoU7BYwf8XOrg3cBEmEYCNz28D0euss1SqHTUbv1TTfS5Hpi5u8tXXLEqtMhazRpz6zcrQK4jKKxeshQsAh+3y8NkcZMcSB6vUx+vGP55BpLPQT6m33l4+TxNsqGJdKImOAwPN2I4lb2bKsgdcjynBmEwdzlQvS8BbNC5AgA7Vz+WAzxeZNqDHY6BcDG3JgR/RXZ90XKYe/0Zzb5qgJ59XYCotDte70UVB3EVaajMHBBBBsGVqwlOcir2AvunStZ6YzwRIcPj3MFVsaXuEEzUS2UwmpLjul5mlTzITz8qC8i5Ch0/sd4MqVkmBDtslpsQuCC6eOXM9n1ZwVx8A+543qhNuAhD77U5b256wbq7+Es0X6Fjg/UUNaPZffYEZvLa5BOqzJkJW+AoUUlbsoEAju8Pz2LsEB6Gd/gnHfNNZb+dE/oP4L6Mvy8qqyQr4Rga1B1jign0+lkPKwjjeQcjU1wqAz2e/Tu28hvPawCY90T72vWz/5O11fFsfKwDZLIf2rJ51jsLBDxyhJNLNAIDqsvChi332HphwQ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(5660300002)(41300700001)(83380400001)(2906002)(30864003)(26005)(33716001)(86362001)(82960400001)(38100700002)(186003)(6862004)(8676002)(8936002)(6506007)(107886003)(9686003)(66476007)(66556008)(66946007)(6512007)(478600001)(6666004)(6486002)(6636002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0fxhW3938Nu3fyjLkjRpbhLJvdTH+Az80vvsBKhvi9DL/TP+Al9KT9AxqJ?=
 =?iso-8859-1?Q?JZeThjViwd+JA+L0cgcLBKWh/Ec2TGXG99vTcfN3VkyWLMA9CKcnjPJmgx?=
 =?iso-8859-1?Q?tIKAWGCjdbKyts3aFRY1KiKwu87qDx1wY4kLGW7ROmJGbiQnFqxB2W3lpf?=
 =?iso-8859-1?Q?ofTHNloZg+MK7lO/qa+e80FBBEfMs9/CocLdBh1haiU0xKhOMEEWe1zUF2?=
 =?iso-8859-1?Q?vabBhBoV0DrILYOpxFU+gD3/MuVZyexEIdQDK5VOTt9uEqKsJWms4SZ3s6?=
 =?iso-8859-1?Q?xE6lMrl6d7KEg51dvMsxwPlqIpxSfZKJy702PNFUjOllFBop9fzaHBFAXb?=
 =?iso-8859-1?Q?5qxucrZMXu6s43bXLYWP5AEwFV3J1gWVSqQ8Z18Xnl5AipKpkldTLtwnUr?=
 =?iso-8859-1?Q?x/3yQy2pflf3sxHkOznfONjirtKewEP67R9rOY2qrmRK8yCN65YdT9z8NA?=
 =?iso-8859-1?Q?jYUbbH0dRkM9VvXuVO7MrDlIfkGA3uh2mkbl9SGKLvVGxZbWXit8Xgnjqh?=
 =?iso-8859-1?Q?IVKl32m9DnwPcLI+PeD3VaNhy3UI4eiyuV22k1w/wSYLKjRF2DEK93i6IZ?=
 =?iso-8859-1?Q?tucGttXZ9DzCpzW2I3MVBXnL+CglWrPSoX0GwfIHl6MvGq6lUbWSbclI2M?=
 =?iso-8859-1?Q?tEX6tYENbJZHbqjCuNLxE/5wDEnRlzzrQ5BVHkHLSckMYMulHjbZUja7vl?=
 =?iso-8859-1?Q?ZqDb1gydfE/LR9kghVZPAwfRMsSyZsKBajmPipAPkFkMu84RsjHdVbKZ1V?=
 =?iso-8859-1?Q?m8AHbukq1qU3mI7jXk9dAfVoxM0yDsPWWbWXBw7WkG99YudDM0+Ik5OxNY?=
 =?iso-8859-1?Q?4AK9cZytUTH22u+u+IAHP5bYrQYXxkNS7W3pljVoMHngk3hrET/Eyj9ONE?=
 =?iso-8859-1?Q?y0h1R/ATdygIYACOTEFOu9ujFjovaGy6YegkbY5xJF0oLm5EaXsTeiTFyI?=
 =?iso-8859-1?Q?/PhQ/vmQYh5hQ2BO8NmVJHO1P7xwLqRn+wz1YJf1Ledp7Rp8yZV87NR/dM?=
 =?iso-8859-1?Q?HccLi8tgXZXxH7s8J8hmPb1PY7R1nogjyyDGLZaF2vBoX297m7R+dLBUGd?=
 =?iso-8859-1?Q?ExnxwYN/c0+g9h1GQGzD1iYQTe/F+V24PZbVEYpPKzGxbRJrfdgu/iHxA2?=
 =?iso-8859-1?Q?CtcYDjSUu5bbcNXAMpoPJQORlTCVeVQEqpAqE0+p55Wnng4iYKk+4tja6M?=
 =?iso-8859-1?Q?JFcwNgZGT3wrXH/iFhxYxkLriJsxYfPTaEh/rr0IbcckesUcyGLDdN3T4I?=
 =?iso-8859-1?Q?1gjrN1fnonwXKMqw4z7T4UJErIGbW3+4Z00bvrBWrORshmkx41DNK76Rng?=
 =?iso-8859-1?Q?n219Pi/3uLTwM4rYHa656OCJzJcl+d6ke/nVHavdEuTlX3jQ71ouhlGFE3?=
 =?iso-8859-1?Q?y7tzDUO3v9LJm1WD9K2e8BqA2HHFcSaUx9/XXDylG0QaOHEvOtatgD9xsu?=
 =?iso-8859-1?Q?J1oj3IqPA19rx9Ju7soCVVQJ7kzMWZ7VFDWHKk7f+tRDMXr6RWOLld5Zqp?=
 =?iso-8859-1?Q?SypA6YrIWd15/js4BaP63It/eCN+OI91Zvo2KqqtkPUSAobKYlBRLTZ34d?=
 =?iso-8859-1?Q?DZMaXCWHg33r2+JIP5GHBVp/Z6c9yKc0IwRIgWIqtV2eZU2clUGiBaAcoN?=
 =?iso-8859-1?Q?f5qB4tkFKtsNdOLl+PoJYiZ3f4Ht88L8jDEd5KunJiDE0jIx+tHYCXoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d5816f-d2a9-4789-4aee-08db571b7588
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 21:12:45.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REW6Q+p2bnmwg0Qd+1nu6E0JWL1Ud5xeLIQvI2FzaQwvJLxJD4FgNAGFD6tCYBCE0ffGP6olGoPscLMYBYblSiEJS5w+omBoLN2udIPt+P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 8/9] drm/xe: Add support for OOB
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 01:49:19PM -0700, Matt Roper wrote:
>On Tue, May 16, 2023 at 03:19:49PM -0700, Lucas De Marchi wrote:
>> There are WAs that, due to their nature, cannot be applied from
>> a central place like xe_wa.c. Those are peppered around the rest of the
>> code, as needed. This gives them a new name:  "out-of-band workarounds".
>>
>> These workarounds have their names and rules still grouped in xe_wa.c,
>> inside the xe_wa_oob array, which is generated at compile time by
>> xe_wa_oob.rules and the hostprog xe_gen_wa_oob. The code generation guarantees
>> that the header xe_wa_oob.h contains the IDs for the workarounds that match
>> the index in the table. This way the runtime checks that are spread throughout
>> the code are simple tests against the bitmap saved during initialization.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |  14 +++
>>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>>  drivers/gpu/drm/xe/xe_gen_wa_oob.c   | 165 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_wa.c           |  40 ++++++-
>>  drivers/gpu/drm/xe/xe_wa.h           |   9 ++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules   |   0
>>  7 files changed, 227 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b6c41cd7dbe3..fcf04951a309 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -26,6 +26,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>>
>>  subdir-ccflags-y += -I$(srctree)/$(src)
>>
>> +# generated sources
>> +hostprogs := xe_gen_wa_oob
>> +
>> +XE_WA_OOB := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
>> +
>> +quiet_cmd_wa_oob = GEN     xe_wa_oob.[ch]
>> +      cmd_wa_oob = $^ $(XE_WA_OOB)
>> +
>> +$(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>> +	@mkdir -p $(@D)
>> +	$(call cmd,wa_oob)
>> +
>> +$(obj)/xe_wa.o:  $(XE_WA_OOB)
>> +
>>  # Please keep these build lists sorted!
>>
>>  # core driver code
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index ac6898a28411..45df4354ac1f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -280,6 +280,8 @@ int xe_device_probe(struct xe_device *xe)
>>  			goto err_irq_shutdown;
>>  	}
>>
>> +	xe_wa_process_oob(xe);
>> +
>>  	err = xe_mmio_probe_vram(xe);
>>  	if (err)
>>  		goto err_irq_shutdown;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index b8d7864950c4..456299836d0f 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -273,6 +273,8 @@ struct xe_device {
>>  		unsigned long *engine;
>>  		/** @lrc: bitmap with active LRC workarounds */
>>  		unsigned long *lrc;
>> +		/** @oob: bitmap with active OOB workaroudns */
>> +		unsigned long *oob;
>>  	} wa_active;
>>
>>  	/* private: */
>> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> new file mode 100644
>> index 000000000000..bf829348058a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> @@ -0,0 +1,165 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <ctype.h>
>> +#include <errno.h>
>> +#include <stdbool.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#define HEADER \
>> +	"// SPDX-License-Identifier: MIT\n" \
>> +	"\n" \
>> +	"/*\n" \
>> +	" * DO NOT MODIFY.\n" \
>> +	" *\n" \
>> +	" * This file was generated from rules: %s\n" \
>> +	" */\n" \
>> +	"#ifndef _GENERATED_XE_WA_OOB_\n" \
>> +	"#define _GENERATED_XE_WA_OOB_\n" \
>> +	"\n" \
>> +	"enum {\n"
>> +
>> +#define FOOTER \
>> +	"};\n" \
>> +	"\n" \
>> +	"#endif\n"
>> +
>> +extern const char *program_invocation_short_name;
>> +
>> +static void print_usage(FILE *f)
>> +{
>> +	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
>> +		program_invocation_short_name);
>> +}
>> +
>> +static void print_parse_error(const char *err_msg, const char *line,
>> +			      unsigned int lineno)
>> +{
>> +	fprintf(stderr, "ERROR: %s\nERROR: %u: %.60s\n",
>> +		err_msg, lineno, line);
>> +}
>> +
>> +static char *strip(char *line, size_t linelen)
>> +{
>> +	while (isspace(*(line + linelen)))
>> +		linelen--;
>> +
>> +	line[linelen - 1] = '\0';
>> +
>> +	return  line + strspn(line, " \f\n\r\t\v");
>> +}
>> +
>> +#define MAX_LINE_LEN 4096
>> +static int parse(FILE *input, FILE *csource, FILE *cheader)
>> +{
>> +	char line[MAX_LINE_LEN + 1];
>> +	char *name, *prev_name = NULL, *rules;
>> +	unsigned int lineno = 0, idx = 0;
>> +
>> +	while (fgets(line, sizeof(line), input)) {
>> +		size_t linelen;
>> +		bool is_continuation;
>> +
>> +		if (line[0] == '\0' || line[0] == '#' || line[0] == '\n') {
>> +			lineno++;
>> +			continue;
>> +		}
>> +
>> +		linelen = strlen(line);
>> +		if (linelen == MAX_LINE_LEN) {
>> +			print_parse_error("line too long", line, lineno);
>> +			return -EINVAL;
>> +		}
>> +
>> +		is_continuation = isspace(line[0]);
>> +		name = strip(line, linelen);
>> +
>> +		if (!is_continuation) {
>> +			name = strtok(name, " \t");
>> +			rules = strtok(NULL, "");
>> +		} else {
>> +			if (!prev_name) {
>> +				print_parse_error("invalid rule continuation",
>> +						  line, lineno);
>> +				return -EINVAL;
>> +			}
>> +
>> +			rules = name;
>> +			name = NULL;
>> +		}
>> +
>> +		if (rules[0] == '\0') {
>> +			print_parse_error("invalid empty rule\n", line, lineno);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (name) {
>> +			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
>> +			fprintf(csource, "{ XE_RTP_NAME(\"%s\"), XE_RTP_RULES(%s) },\n",
>> +				name, rules);
>> +		} else {
>> +			fprintf(csource, "{ XE_RTP_NAME(NULL), XE_RTP_RULES(%s) },\n",
>> +				rules);
>> +		}
>> +
>> +		idx++;
>> +		lineno++;
>> +		prev_name = name;
>> +	}
>> +
>> +	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
>> +
>> +	return 0;
>> +}
>> +
>> +int main(int argc, const char *argv[])
>> +{
>> +	enum {
>> +		ARGS_INPUT,
>> +		ARGS_CSOURCE,
>> +		ARGS_CHEADER,
>> +		_ARGS_COUNT
>> +	};
>> +	struct {
>> +		const char *fn;
>> +		const char *mode;
>> +		FILE *f;
>> +	} args[] = {
>> +		[ARGS_INPUT] = { .fn = argv[1], .mode = "r" },
>> +		[ARGS_CSOURCE] = { .fn = argv[2], .mode = "w" },
>> +		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
>> +	};
>> +	int ret = 1;
>> +
>> +	if (argc < 3) {
>> +		fprintf(stderr, "ERROR: wrong arguments\n");
>> +		print_usage(stderr);
>> +		return 1;
>> +	}
>> +
>> +	for (int i = 0; i < _ARGS_COUNT; i++) {
>> +		args[i].f = fopen(args[i].fn, args[i].mode);
>> +		if (!args[i].f) {
>> +			fprintf(stderr, "ERROR: Can't open %s: %m\n",
>> +				args[i].fn);
>> +			goto err;
>> +		}
>> +	}
>> +
>> +	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
>> +	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>> +		    args[ARGS_CHEADER].f);
>> +	if (!ret)
>> +		fprintf(args[ARGS_CHEADER].f, FOOTER);
>> +
>> +err:
>> +	for (int i = 0; i < _ARGS_COUNT; i++) {
>> +		if (args[i].f)
>> +			fclose(args[i].f);
>> +	}
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index bc2665737836..f789be2cf8c3 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -9,6 +9,7 @@
>>  #include <kunit/visibility.h>
>>  #include <linux/compiler_types.h>
>>
>> +#include "generated/xe_wa_oob.h"
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_regs.h"
>> @@ -73,8 +74,8 @@
>>   *      engine registers are restored in a context restore sequence. This is
>>   *      currently not used in the driver.
>>   *
>> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
>> - *   central place. Those are peppered around the rest of the code, as needed.
>> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
>> + *   a central place. Those are peppered around the rest of the code, as needed.
>>   *   Workarounds related to the display IP are the main example.
>>   *
>>   * .. [1] Technically, some registers are powercontext saved & restored, so they
>> @@ -569,8 +570,31 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  	{}
>>  };
>>
>> +static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>> +#include <generated/xe_wa_oob.c>
>> +	{}
>> +};
>> +
>> +static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
>> +
>>  __diag_pop();
>>
>> +/**
>> + * xe_wa_process_oob - process OOB workaround table
>> + * @gt: xe device instance
>> + *
>> + * Process OOB workaround table for this platform, marking as active the
>> + * workarounds that need to be applied.
>> + */
>> +void xe_wa_process_oob(struct xe_device *xe)
>> +{
>> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
>> +
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob,
>> +						  ARRAY_SIZE(oob_was));
>> +	xe_rtp_process(&ctx, oob_was);
>> +}
>> +
>>  /**
>>   * xe_wa_process_gt - process GT workaround table
>>   * @gt: GT instance to process workarounds for
>> @@ -633,12 +657,13 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>   */
>>  int xe_wa_init(struct xe_device *xe)
>>  {
>> -	size_t n_lrc, n_engine, n_gt, total;
>> +	size_t n_oob, n_lrc, n_engine, n_gt, total;
>>
>>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>>  	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
>> -	total = n_gt + n_engine + n_lrc;
>> +	n_oob = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
>
>Shouldn't this be oob_was?

yes, thanks. It just didn't fail because size of lrc_was is larger than
oob. I think I need to find a proper to add static_assert somewhere,
like I did for _XE_WA_OOB_COUNT, to avoid these typos.

Lucas De Marchi

>
>
>Matt
>
>> +	total = n_gt + n_engine + n_lrc + n_oob;
>>
>>  	xe->wa_active.gt = drmm_kzalloc(&xe->drm, sizeof(long) * total,
>>  					GFP_KERNEL);
>> @@ -647,6 +672,7 @@ int xe_wa_init(struct xe_device *xe)
>>
>>  	xe->wa_active.engine = xe->wa_active.gt + n_gt;
>>  	xe->wa_active.lrc = xe->wa_active.engine + n_engine;
>> +	xe->wa_active.oob = xe->wa_active.lrc + n_lrc;
>>
>>  	return 0;
>>  }
>> @@ -666,5 +692,9 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
>>  	drm_printf(p, "\nLRC Workarounds\n");
>>  	for_each_set_bit(idx, xe->wa_active.lrc, ARRAY_SIZE(lrc_was))
>>  		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
>> -}
>>
>> +	drm_printf(p, "\nOOB Workarounds\n");
>> +	for_each_set_bit(idx, xe->wa_active.oob, ARRAY_SIZE(lrc_was))
>> +		if (oob_was[idx].name)
>> +			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> index 32ab34d9237f..f7da9f5b9340 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.h
>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>> @@ -12,6 +12,7 @@ struct xe_gt;
>>  struct xe_hw_engine;
>>
>>  int xe_wa_init(struct xe_device *xe);
>> +void xe_wa_process_oob(struct xe_device *xe);
>>  void xe_wa_process_gt(struct xe_gt *gt);
>>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>> @@ -19,4 +20,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>>  void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
>>
>> +/**
>> + * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
>> + *         other more specific type
>> + * @xe__: xe device instance
>> + * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>> + */
>> +#define XE_WA(xe__, id__) test_bit(XE_WA_OOB_ ## id__, (xe__)->wa_active.oob)
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> new file mode 100644
>> index 000000000000..e69de29bb2d1
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
