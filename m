Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34204C04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 00:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C656510E0AC;
	Thu,  9 May 2024 00:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDrg+3E5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471010E0AC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715213068; x=1746749068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8KaQmuzACniL3UbKcFJUBx7JYnKYA/EHr1szvgaaDlY=;
 b=WDrg+3E5+HspahhTPXIo5t5bWRLQ6ZkCi1Ew/zfIOLTuglWDq6hZkKVE
 3KHlA08U1gC/0I4/cDjUxuFF79v6Kq74ZXH7imGGkqmlMNWfmfwih3cYl
 p1dIm8o1vIGFWj/6njGzYT3XzpqNJ5eMi6uKbA1tN2PBfYiRGEAwlk68e
 lgXtbSkaW7RcwBa0vyT0ec4dAXD3R+8ZeSiYIRGJ9qdrNzI+UcLldkw9d
 sNO24nVDt+wvQoCqN8j2oQ19TxTxLAiTkwey6dGZ+fhCNGxsoXzv2E3Hn
 NnL5DrcCnCvyKvOhMXZFnI3NXUxIRdsjNZkICy9IOL2E5rgfvM05M22pE A==;
X-CSE-ConnectionGUID: g+26xklyTSaDRRHjFavJiw==
X-CSE-MsgGUID: Vct6XzoeRry8IDIuf0vljA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11262302"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11262302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 17:04:27 -0700
X-CSE-ConnectionGUID: 0/Etnyo6T4mcQ/i9q5RHPQ==
X-CSE-MsgGUID: zY0zqP0LQ4+ppNDgGDufGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33526726"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 17:04:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:04:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 17:04:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 17:04:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGpXpX0kvxvWzb7KUyoNmB4RMbbYGFPPI2coIypIvWg5LQ21Dy/JZm9xo/Ik7S35u4pgmmncddiw59mXZLq7/pA6o7dnlsrpZ+CGrI/BIPYTJCRv8JHKVoiYie38bxURfQr9jLNp9XupB9PvgaDGVIHdu/OTNJXQ1L5A4kBS7BnYUMecuLFVLetacpbLBwrFBE98Qsr7vyOcE1iUP0mEL3icZTJ+HZ37ceNDU0KOCFL6YzfH0EOPwmtYpGBdlZH2p/1bkkS9Q/oIv0mzyInKSpKG4FbgZ9GqWALnBgGO4oRDma8TGEqV2GKcQjNWg63iZcbEGEHm8EpldcCOJaXqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tufB+xk5bvFchTxwOw44P1QBhbC64l/OeH7TdcM/ulc=;
 b=bvq6Wo2J/rOfrqp+pI/yFRCL+StDZsNOQYZnAT5notSa8Rbg83FIIhxseAmanceSuHlGY9q2Z37EdSWX34PBC1wwL9zUf+MOwoBg6mKP0b4C5CEeTyMg6Kn555NDppeS3eRSQidNeXqZRTKzaHsv1FLc3eBEdRm4Fi7ao0gV3JbyVNi4ldfMpya8UxYq9NRNRTC+VYmd2tMcOLRbiONNnzoZXPBs4XBQC8bxXMR53hedHySsWNoPB4Ykw5Mn7B0igP22p/6N20xkNs6ZcxbSmoevFuAyDZSnykRrNZP8NvZxlHAFh6nK/7hLRn3yvWE1N/6FTyAEyzU2QuNYTLgo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 00:04:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 00:04:18 +0000
Date: Thu, 9 May 2024 02:04:15 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Move xe_force_wake_init_gt() inside gt
 initialization
Message-ID: <z5xdbo5umv552irta23id5a4apwqcxmeq2xl7rcrvya3o7rnmm@pevwiljpgmuw>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425182410.2705061-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b376586-2760-479e-b2bb-08dc6fbb9235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|27256008;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S21IblNiZzBsbWJ2Vzh4czNVa0RKM2gyemhUYjB3YXZFMVI5SkVFNVh6WDBo?=
 =?utf-8?B?dmdsVUNXaFBPUU5taUw5cTcvZWpFVHgxc1g4WDlzU2tkMDNlN1dNSW5oaFAv?=
 =?utf-8?B?MEJqOFc0aVdEclNoR2lSSElsb1ZDTTM1d2NaOEd2dEFZYnlxWkVDQmI2VnNT?=
 =?utf-8?B?eE9UWHFsS3JNbzNhN3ZjOTl5L1ZpUVJVR21OVWN6aVQ2bk5yVEVwQlI3WU1k?=
 =?utf-8?B?U0d5dUF5VWtsMHdqckhxRDZ5cHNRSmJvbi9PZFJacXBReVQxMnFlVkhjN2Ex?=
 =?utf-8?B?V3FTVFY1ZEdVYTNaSDZ6RVo2K09RUHhzdWNBeHNLRGl6NFRmRCt1eXB1RWtQ?=
 =?utf-8?B?dFRNREpaZHJRMkdoYjYrbHhHYkpaaFpwSit3eVlZWHc5Q0FMSi9IbkxqZWx4?=
 =?utf-8?B?NDBpYTJJc3lRb3BESEFNK1dMV3MxUXdQWjVVYWJnWm9SRVAzVXFOTjViWHcr?=
 =?utf-8?B?UUxmaGtKVFBBWjRZWG1oLzJsQnlTTTk0c3Jyb1AvRytjdGk4RVFHZDNVQitN?=
 =?utf-8?B?czMzakh4TmhBOVVWRFZDRVhpQnFmazhSMnFiMHhWd04zVi9tRGI3K1U2emdR?=
 =?utf-8?B?c0tuSTZUZmxydEhkc2l4UHFmVkdveGdPYzZWVEZETTBySHMwcjcyYlUzQkZ3?=
 =?utf-8?B?bFRzUzhKMGE5amN2cktLSUhoV3dFMEF2cEJsaHgxWTlGM09ZVlRKclhxeTZ2?=
 =?utf-8?B?UlczZjhsNWg0aVI5aWRzZFV3dEJnaXAwaHJBWmc1YTd6Z0VLVnJlUWNkY3pW?=
 =?utf-8?B?cC9RbmQyb0xjbWd3TmxOMHo2S2FPcHpqQ29veUIvb3JEeVpaK2k3U0dKTzVm?=
 =?utf-8?B?YVo5Zm96K0hSMVhUOUFtcUF1ZzNGNmY4ZXF3WjR0REJ5ZHg4ODlqRWxUTlFr?=
 =?utf-8?B?aS8rc2FXMXlpVXVrRmZFUkVYYzNJSk1OZFM2UHY1Rm5ZNFQ0d05iNmEvc1FN?=
 =?utf-8?B?Mi9oRkRtSC9pb1NjT1FuczFRZkFvdHh1TWVDaER5SndwQmlmYnp1Ly9mS0cv?=
 =?utf-8?B?eW53d1ExYjhJdXBrQmsrZDdXQ3VPWkRqMUFodzJ0NFdlT2hmOHk0TnhDcC85?=
 =?utf-8?B?R3RuT1ZYUXRDUXFGcXNPR2w1YkFXSlM5NER0RUZNV0c0WW1meUVFWVhuZCtC?=
 =?utf-8?B?WktvdUp4MldUY09SS0hsSEIwTEdycXhLK1hYRlozV2tGdGR0ZnFMVHQxU2ZH?=
 =?utf-8?B?d3UvOGIvKzRtejVhdG9BZkhKK0QvVWlJRjJnalh4QkVTZ2NUYlhUcG1wVWgv?=
 =?utf-8?B?Y21GMVVqUmtWaTN0RHdYejVQbENOUkNhRW1BUDJ4Y2VzS01kZVMrNEtGU211?=
 =?utf-8?B?aW9TelNUc01GcUI0aVJYUVhGTDQ2NmdSaW84VXZENUlqbHBQR0pXMm5XTFli?=
 =?utf-8?B?WHVxS0tRSGFXczBvRDduVmRZMHl4bVVhalgxMXU2MlJPSFFJamtYUkhRa3Qx?=
 =?utf-8?B?WEx1eW84SjcrRDM3OEJLdlk5SE1LM1J2bEVvTnd3QVFoSkVmNjRNb240dGJC?=
 =?utf-8?B?bXprSWxsUTA2Rm1VV1J1YzFsQlRVS0lUbkE2K2xKWGNyZ0Y1Q2VEeGQ4SHp0?=
 =?utf-8?B?bE15bHliWW5VWlN1STN4VmozSzUzVEtIUVpoaFQzeGpBUy9kckJKRkZSOHA4?=
 =?utf-8?B?Z0xrT295Zm5PdTlvLzlLei95WnJJUm9oTVdSbjNHalBnTWpmSEhXNWF5dHlz?=
 =?utf-8?B?OEZkZ1lLM2JBNzZRQWN4WFI2bFM1a3d3cjZDYlE1cUEwS1N1cVUzR1Bpa1p1?=
 =?utf-8?B?ZURxK082YWxxdndZTUVKVXR6MWdCZ1EyanNLQ2J0d3BpcTRrMkMzOXQ1b3Vw?=
 =?utf-8?B?UEwzbVNaVnFSOTNEbjh4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0FxU3BPeDNyRlpRellqRVoycUZwTTBYTkR3QWZmOHhnWS9DanE2aVEvdmZI?=
 =?utf-8?B?K284RncvZGtQQkJPUjZPWVAxM0JWeEVYZFBKRVJ1OWdjU0xnK0JCa2JzYnZM?=
 =?utf-8?B?bWlhL01NNGZ2cHZzNGFES1hCQityV21UNTBGdE5yUFZlMWkzSnkybVY3d3Zt?=
 =?utf-8?B?QUdiRmlBMTRTN1NmZTNrdzlhK2xWdUV6WGhVV0xWZVl4MUVMcEV0RmxoNUp5?=
 =?utf-8?B?RCsxSGpkaG9uYWFEOEVJQ2NJOFJVaXZ3YmExZis5akJ2Z1RKSVlrN1g0U21K?=
 =?utf-8?B?bkpPa2g4UnBzcEVmTGhMSEl5K0YrUWZMa3lheGc1U0kxRmE5eEo1YWJNZFdQ?=
 =?utf-8?B?andNNjhtNkE5U1NKMm1FWGQ3cGMwVFlLVSs1dXJ2eGtDbUEzeGl2WVJkOFEv?=
 =?utf-8?B?WUdnZExXMDI3WGlhWXR2ZjBXalFFLzNCOVd6R0R1VWRBbzMxVWR1bjIyQ2l3?=
 =?utf-8?B?WTJBWWc0cTF1RXYvbk1ZZ0ZTeFQ3NmRhcmJ3c1ViazlNbGlHemFSVk1QMnlR?=
 =?utf-8?B?NHliTE8rRjRlM1hhbkdwSmR5L1czOTI5czR0elM2OU5INmFtRW5Nb3c0eTdl?=
 =?utf-8?B?Wm53SEV5YVNkUzlYY1MranBGRG1tbzZQazFWTlFpRmtCWGF1b2UwZ3p0eDUy?=
 =?utf-8?B?MEh0VCs5NW1RaTFKd1RLOXpQRzRxQUNmdmw4TkQ5SFVmaFM4aWJPUmtIalZp?=
 =?utf-8?B?M3Q5RmZaNW5xZ3Fyc2dMZW1zeEgxVndzNVd0cHEzdlhBSGpHZzRpa1lUNHZY?=
 =?utf-8?B?ZXBremxJeUFHa1pYV0V4YUdLV3E3YnY1dUkrbHU0OTJleE5sMk85SnVSVG8r?=
 =?utf-8?B?ZEI1MkF4aFovRGZ4c2g3dXZVQUNhdEt4T2ZpcnhWNnRYaFJiZS9BeEpDTHpE?=
 =?utf-8?B?VC92ZW4wcE8xNjFoNlJDVXd2ZTNqNENMTXduNGJpcEdBOWV0cEZnOFRDVUlY?=
 =?utf-8?B?Rm94UFhGVW5XTm43aHljR3RSbVdnZUVKekllWERxeDRjdzR2V1ZCdjllaGlz?=
 =?utf-8?B?d1ZncTlsRGk4QkR6dEp0Vnk5NnBHWkpMZFc0N0lnc3F6d2ZwOTE1ZE9zNW9Y?=
 =?utf-8?B?c2JzWVlld09OVXg0cFAybE5oemZGNUExMmVld3ZzWU5ObnRHZ3BtSHQ1Q3ZC?=
 =?utf-8?B?dWM4dTN5c2FpdG1QOGZYSnNKVno5N2RWcVkwdDNCbWtrOWg0MVhJeWVPVGlY?=
 =?utf-8?B?ZXI3S3ZJWXMxWHpZam5nUmc4V01WSWU1c0d3VHk2VUl2cmN2a3VuYTN1ZmRw?=
 =?utf-8?B?NnpNYzBVbHBTOTQwZFE0djByb1FCaG9Yd09OYzRZdTBKVTZ3ZTNnYmErRGdO?=
 =?utf-8?B?UDltN3hHaWtmbElta05JQ041aW1hOEZjN1NEcUJ0TUFTN09jWk95clFReEtU?=
 =?utf-8?B?VU5KTFNRRmx6WTlja3VIYnI0Rm84VmhqSExPZ2hhcnJCZlo3eEpiQU5zM2dS?=
 =?utf-8?B?WTlCRWNJZmljNG93c01CRTJLZ0N6azBZN2cxa21rR2c4QVI2c05Nb3Y2Unhs?=
 =?utf-8?B?blNTbVFmRXoreFltazR0MURodE8wNitaUVZsSFBKTGFESUFpZU40QmdWVUpi?=
 =?utf-8?B?U2lZZ3pxaFpGNUxzYnZ3NEdzWHIvWWxtQnVMZC8ycG54VkkvbUV4RDJOREhk?=
 =?utf-8?B?SWl6Wk5WMkY2RS9XU3JRVTgvZlpnY1R0L0VBV2RUMFQ5Z21xOFNrR3ROamRQ?=
 =?utf-8?B?ajA4WXdmMWR0MXl0YnAyRUhZMDcvM2k5d2p3cUw3WmhRdFU0czdzNi9lYTZa?=
 =?utf-8?B?Vkk5dVpVcGJuaDlZQW5sNW1Bb2tDcWpNSWZWQ2xrQWdTWEtiZ3YvUTZQc2hZ?=
 =?utf-8?B?Z1dxYlpzMERDYlRoNmlaZHpBZXdFaTJDakU4VG9oSFVxRHVpcVZIUlhxWm4v?=
 =?utf-8?B?U3pqYjcxZHVqUXd3eCt3bjlBT3RDdUk4ZjdJeTNBdU1jZ0pURy9HSDRmMlhD?=
 =?utf-8?B?WlJrOVZOQVhucWcva2RCMjhraVdOODNlUmc3Vkt2Q2JBeWR2dmlVZEZhSGtq?=
 =?utf-8?B?TWEvWVNIcWIzNzlDWkh6eERUdXpPVGVkRUZ4alJXQmkxcjZrWnJFdDZUbGZV?=
 =?utf-8?B?TnZQRi80dkVuTzcvRkJpcUJyT0xRMEg3c3luNG1kTHJ5aFlpbG82TGRFeWkx?=
 =?utf-8?B?cVNsQ28yYmF5bEl6cDU0MG96S0E1aTZDcHZrSGR4UHQzS2VqSXU0YmtHRW9Y?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b376586-2760-479e-b2bb-08dc6fbb9235
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 00:04:18.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXwXOSX813FkjeUoch+JKu/+/1UphfvjXwy7viWzEpSYhrCdTMWhYuLOiFWD16RA5hGMIJUScHIuP0lz3d59nmTiITEbSztYRbEUNhNb9Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 25, 2024 at 11:24:09AM -0700, Lucas De Marchi wrote:
> xe_force_wake_init_gt() is a software-only initialization and doesn't
> need to be called from xe_device_probe(). Move it to initialize
> together with the gt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ---
>  drivers/gpu/drm/xe/xe_gt.c     | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8d04283b3617..d090c4e7d57a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -572,9 +572,6 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> -	for_each_gt(gt, xe, id)
> -		xe_force_wake_init_gt(gt, gt_to_fw(gt));
> -
>  	for_each_tile(tile, xe, id) {
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 805fd0acfc03..2e8efce2799a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -328,6 +328,8 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	xe_wa_process_oob(gt);
>  	xe_tuning_process_gt(gt);
>  
> +	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
