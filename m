Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F14C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A51710EB27;
	Thu, 11 Jul 2024 17:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INIQ3Zha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883AE10EB27
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720718775; x=1752254775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=q4CPObAub/HuS8FHPeo8Cr4wpRpBWKurHXAQyd1SpK8=;
 b=INIQ3ZhaLOn67qhLA7RW1ifzZrl1s/pCbvGUwM9EiOuBfR2zPX8DOOWN
 9/cs+Dvf64+55uxNAuej9wVbAu6Z2sW2KgHi5SHhz8iaKSYajjf5OIru+
 /USIDUDXiiCltA6Ns/YqttB5+ur6l7r92W1pziYgAy7XwTPrCbC8j7Oc4
 e0KEDX+IdzLoE2L2MBSzgitpm8Bam2Lj9UgfCtGXzXXrWSDpYJHyQpDOC
 oNipfXbzkq27CEQSHAoBCqpjtrGBhjSB5zMDcT2VriVwamdouyVAIdT+W
 1pghhX63ADCeMwd0iB07S1H/B8KntWrphi9QfatchjJHGcFtBjh7WG8Ar A==;
X-CSE-ConnectionGUID: OJpeS7WrQWGS/XVuAUSw9g==
X-CSE-MsgGUID: eUx+jdiNSuWZgRmfbytfxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28793182"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="28793182"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:26:14 -0700
X-CSE-ConnectionGUID: bzp/gGccS9GgUiqzvRaGeA==
X-CSE-MsgGUID: 9+w/jVj3RTihLbXNSCZzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48610748"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:26:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:26:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:26:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwcHamzw9WDpN5UXbjWNpb5SBDJDLm6Qwr/m6yO2fSFunjPX5LxdS+o+7rlymANNmd2sZnmyc22Jovbyq8OyNfRatXD48jcvR/rGgCyS0uok6enoHwFdTjhjp/z8Hl82NpeGe40EZCC5RvFFFbfeFowNeMAG9yLJUS4H7xTK27cE4SmTef+HA7k4aLYKbMvzXByA+0de4VIimX3nJxhBFQzXR4Vet6Jt+VSApeAYTv/jQaGOL6oZ4ZOnl/3aJLKFMOUpjSOtxAl27/a/bmoAtuXw5AAKMhV/yNzCHSZBa48uT1tqHRdwDLXtKhleLQxa70cExp8M7g317rIF/hsc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4CPObAub/HuS8FHPeo8Cr4wpRpBWKurHXAQyd1SpK8=;
 b=evqQQit8SkXDut7NukLpTKsir1qZW+9yPp04u5fgYEejPuXiYq9hg7nzrKRlkUBOVtJDZFIxBlw+0QRcv4GZ5zyR+QUlvzK5Wi4CfDbwtO97ATVjqlRO/GI6wP5duknS3HS8RWBvsHSvq8/Rw6GgypCydgCfhwKyHfUdYfUF4HoVbMtsk2UW1uNDnj47afhVqyfzzswIY3HBt1+oAzTb7rDhLnGJ9nN6IW2efdNG5oT6MeMwRS0Qi0Wdyz6Ux/z0/IQhCMYsU5aam50P1DgtobDRc6D1TL1UKWFTAOVEkhtqc8+ycfE1iZUbE4C74WFvMdKlbxBp1/aypRbJ1tHx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.36; Thu, 11 Jul 2024 17:26:11 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 17:26:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Topic: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Index: AQHa0i+fzQ2GW9y/kEOG6riv7NsSs7Hu34uAgAAhn4CAAslMgA==
Date: Thu, 11 Jul 2024 17:26:11 +0000
Message-ID: <77f474f3d4631fde9201240e200c1d29680355b8.camel@intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
 <b50f7ae95234b15bd08d4cebd61a564faea7a8d9.1720550129.git.stuart.summers@intel.com>
 <Zo2jIfm1ceFclXZa@DUT025-TGLU.fm.intel.com>
 <d13595de1186ff8e1ed96d9231f406576ff77ed8.camel@intel.com>
In-Reply-To: <d13595de1186ff8e1ed96d9231f406576ff77ed8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6310:EE_
x-ms-office365-filtering-correlation-id: add69bd3-3647-4fc8-e62b-08dca1ce8ed5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SUtxbmF5Vlhld2o1N2dXZ0NrRzg4TGJZMElGZzVRYi9IUlo2UTJvOXJ2Y0Ny?=
 =?utf-8?B?Vk12eTUxMjh0SnVVMUNIQ2NFbCtzUEI3dFZZNUR2MzhJaENUNWd1bkJQNDNk?=
 =?utf-8?B?MEExUllINUJUUHYxdmMxbE1VMzlSTXhFZWx5VWpkclQzeklHVElMVjYvLys3?=
 =?utf-8?B?K3J3akpYaXVLRlZLaVcrQmJ6NTVmMDkyUmplLzgvSmhRV09tM2Vpb0JZbXUx?=
 =?utf-8?B?amlodEpNeUprOFZma1BNQWtvM0pqWXlpUEZyUysrQzJaUzVEMmRUaTMvYnhK?=
 =?utf-8?B?NWdEY1pXTDBqQndzeHpLcjdKMUp6dDRiTnU3RzFha3E4emd2ZENUc1pQS0E2?=
 =?utf-8?B?STAzZW55dk9YWTFnK2JoU3BVWFRZMHFxNWNadExuaVIxK00vN1AwMTJDbzhj?=
 =?utf-8?B?L0Q4ZS8zaVphYjlTQnh1Qm5IQ1grRzNEYmVwMWliT0xpZzBjSlRKU1JESjUr?=
 =?utf-8?B?MXdSTzV4NHNERzUvU1YyUnZJODUrYXFsVkhiYXNYa0xNdUgrK29QaG95YmxJ?=
 =?utf-8?B?ZEVtaU9Jc1VxQ2Z3VkJrV3ZUcjFjTlRqTm5iQ05vZ3Zsc2c0bzlxYkt1U2Iw?=
 =?utf-8?B?aVlGSkErOVR6OXZyYVpVTlVMcTdkMzFoTExDQjByR0JMS2UzL0M2Ynl6ZDFR?=
 =?utf-8?B?bjNuVjhMQzgrNFNXU3BFb0Z2ZGZCOXRDUEVtdmVIcjNrWGYrZlYzZXJDR0Rn?=
 =?utf-8?B?bjk5azViUEtXQ1lpbjk4aExlc2lYcmwrYXdLNmNzZTZ1UDA3QnlFVkRVNXpn?=
 =?utf-8?B?a2N5VDJkSUI3STVKekdLZVRBNjhPUmtWZlN0Qm02VDBQcVNyVE5xM2NvZWZT?=
 =?utf-8?B?OXJoUUtqOVFZcWFZTUFnU2pmdHkvbEZUa2dVTnBWOHV2L0poR2RmTVNnY1FX?=
 =?utf-8?B?d3pHSmpITzRCYWhiUVRDbU02b1RmMjhraHZKKzU2cHJxN1FyWWVsRU5tT2NT?=
 =?utf-8?B?ZGdqME9VV2NITldIMGFqYjhUbVdOMTJ4KzViRTIyYUxjN2xlSC9yZjBUSCtT?=
 =?utf-8?B?MXdIL2JnQ3JFRFdCS1YrU3diVlFtRjh3eWZZcUR3YzVoUlFwdnV2SDVIT3FT?=
 =?utf-8?B?dExLWlRYRFpHVnRPbWQ2ZUNzQ29vejl0dmRGRFJYaXA5OWRObldPZDJybjZ2?=
 =?utf-8?B?d3IwckNPMjV6VnFENGEwR1dDYVJlMmE1amJ2SmNUSkNudnRSWTZNdmZQR2VU?=
 =?utf-8?B?TkZtdHRkd2VzMWw4eXJPUU9rMWdPeHhzcGRHV2p0WHpOKzN2REFQMUVvK3hz?=
 =?utf-8?B?TkxVbWNvOTZhTk4rR0t3VWxGaWlKQStjRksrNEdHV3IrYUhjZktxQS9US2pu?=
 =?utf-8?B?Y0FLdVpvNy9SWWhFS2tabnhnUDdlWDg1clRiQklPOXA0Y0lFYTVQeHBFWjJ4?=
 =?utf-8?B?Sk9tVS9UaFoyTFpaaVpuVFNMZ2lBcFFESTVxejRvQ1JaV2tQUzhnWkJlYTlR?=
 =?utf-8?B?NFNYYjZsYXpvWGVENVFFYlNpZkUyYm9ocWdIRHcrNWI5aGkzU20wcmdFTjZX?=
 =?utf-8?B?azZ6cGZQQlNkZG00WkNqU2xhRjQyRytvMEpISmV0KzRDa3FrZVBDanc1NW5z?=
 =?utf-8?B?Y1FPSUFxTHpPTzZIWStkcUtDTXBWS3dlaDI2ZDM0OXpzVHZOa2tpVjdUU01T?=
 =?utf-8?B?TUFXYkl6cDMySm9nZ0tQZTZ6OWsrUG5EL2xyV0lKMUlwUmJmTU9UY0pDbzR2?=
 =?utf-8?B?ZXIzUEE4T0psdDdHUm9kK1FWWlpLSkplNXNaak5BYS9qUHRhTE11MUdzejJT?=
 =?utf-8?B?UmIySHNnYjNsQlBsQmk0WEpwSWNlQ0tpNFd4SXJKQVkxT2VHeWxkUE9yUTVV?=
 =?utf-8?B?ZnByT3hwOC84RnZKdzd6ZDlyVzc2cEkxMU1qVDYxQWpGMk9TazJ4eVExdjJo?=
 =?utf-8?B?VkNrMkd6cjAvaHk3MlcwcU9FcTBtdi9UeVUxeGcvVkN1blE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWxBNzlMZDRnN1I1Mjh5UjlYZ01yZ2RVMDhsVGhhNlI4Y0dic05WRGkzQSth?=
 =?utf-8?B?WUFCZXRVZlpsL3ZyNmlIZmlodERySmI4Y1VHNG9ZM0s1d0IwMWFsVGcrTlhL?=
 =?utf-8?B?VVdiUytJbS9VTUJrRCsvaE0xVHdyRWc3WEdBSVltK1NkT2hVR1Q1ZXZ5ZnM5?=
 =?utf-8?B?K2JZWjVINEZoV0ZLS1NnUEUvUElrdnBUNVVPWFhSNk4ySW81dC9rRGlzUTU2?=
 =?utf-8?B?d0lzWjh0Y1lsRnRWODFwdXZIRllHVUVmNUZCUU1Ec2daZis1K1p6NXRHblQr?=
 =?utf-8?B?OC9ENk5VY3VDWkR6cTZRVktrbHJPVUM5bVJ3US9CV2ZzRFl2VG0xNzZ0YUZr?=
 =?utf-8?B?TTVnaFgvK0FGL0NTRjFVbXZZWWliL0JmT3pZRm5VRzgrMWRqelNpYzd2a2ZH?=
 =?utf-8?B?aXBITlRITTMyUHhPTXR5TGZTK2d2c05RODVUMXg1TkRjZXBpSlB3T3VlY1Ey?=
 =?utf-8?B?d2JDYUppMVRnQ1FEZjNzR3R5VkVZNXhOakMyam9Kc3FvRFpyM2p3UEtFaStR?=
 =?utf-8?B?SkU0ZWRoZjdOcWVUcG82VXNseEx5ZkExeFREMFIrTHNIREN5MzlWV1kyWC9U?=
 =?utf-8?B?cHJPdGZmQ2xmeWZCV2JaVzNWcERadjJpM042S3VJbXNtWStVbWt2VnY5aVll?=
 =?utf-8?B?NTlianpxYTkwZk5HL09OMmFSMk8yK3NXaWVudXF2ZS82ZmlRbVdLVEpjYkFT?=
 =?utf-8?B?YlZFSndIMCtMVmpwMURMWUREMUIybk5BNzV3d2Y2Q05GOXN5N2tiV3o2Nzgz?=
 =?utf-8?B?U1REZTVDd0trdHkwT0d1Y0R2SGFTOC9QMXhuaHZESndTQlF5R0FSRklBcCts?=
 =?utf-8?B?ZGtrL3JwdGVrN1lSdGVhNFFUclF5VVlJZ1lyVnh2WFlGNnVTZFc4SGc3c2t0?=
 =?utf-8?B?UDJJdWNFUXp3bkJTYjlVNFIvTnZ5WCtNaHM4YXU4Qnl3c05Cd2hnWFo0dEpQ?=
 =?utf-8?B?VUhVb0V2cm93RjNXTUNjOTNVYzdpc2I0UUNKTy9VQ242aTR2Rlh0aElXYUI3?=
 =?utf-8?B?MVorSHNEOGFlK3lNSmhwWUE1K2hOQVdaeWJwaG1POFVwcTZZMy9ZWmRXY2tr?=
 =?utf-8?B?OTdZeWxBNDArb09UNEUrOUFLbmw2YTdsSzhra29VWWxQMHhnbHJwZFBOMlhO?=
 =?utf-8?B?YlhDNEF3N0lwL1c3dklTa2I0SWFPTm9lLzd4MUhKbWRHTGdjMU5uVE9rSHAr?=
 =?utf-8?B?NllpT1MzRUlTR1NKRWU1Q0FhSTBjcDdydlJ3U1RacFpzSnUwVTM3WjdLbVRt?=
 =?utf-8?B?aHdIL0xKZ0Fobng5TnVsZjM5NXZyV05KZE85NGY5K1dndVBwMlVNalRjTUZZ?=
 =?utf-8?B?aVYveE9XZmwzSnNST0lNZ2lvWFpkdzBqcTRlYVhIRk5xZGF3c2RZRWUvOUls?=
 =?utf-8?B?QTNNOWdvT3lqVi8wRy9YME11MCtEdFFFOEVIaVpoUzYvY0xCZkd5Tmx2NDFa?=
 =?utf-8?B?Rm5UWmJuL2UxcWw4SlVucFJtT09zWW1RZmpNL2c3VCtWeENLUkQwSXFHYWN2?=
 =?utf-8?B?b3RYVDFDUlFycDJ6QnZuSXZqc0JxL2ZaL05WcXB4YU9USXU1OHE0blhOeGk1?=
 =?utf-8?B?RDhKSzV4VktnTnBpL1FkWEpuRitrak50NTZTZldXSERQL3EyZUl6bm1odGY5?=
 =?utf-8?B?NlNCME9nL0QrVnNOVEdqNmR6cmh1dDRZSGVpTWExMWtQcFBwUlJXUnVWWEZL?=
 =?utf-8?B?RlFaUkNOMW1IaGpmUXd4VHJzY1ZkYzQxSjFxY29rRlUvRnlOejM4b2ZKajA2?=
 =?utf-8?B?R3owSmh6ZWtsTEpTZ29JdzlZTkhsQzI3NS9ERy9SZnA0Z1Fmc05mcTRHU0FN?=
 =?utf-8?B?VGU4VGZSOERjZG9QY2Q0QTN6YStudDQ4RVE0ODVNRnR3a3VFSEEyTzNmMXNz?=
 =?utf-8?B?NndJTmp5S3YyRS8vdUYxVHVLOHJxSU1FNFZDT2ZrSzBOWVhUY2FCTDNEK0Mx?=
 =?utf-8?B?clJUbEtka2gxWW9oTlk4ei9BK1l4bXZ6ZW9OQ3VRL0dNRGxzRmdZOWdVSTF2?=
 =?utf-8?B?bDdjclVRU01SMGtmYkhQY09tR2M5VGVPWkQyYWtJTHVOQnBRZDNYVTN3LzBB?=
 =?utf-8?B?MXovMWR4elBCSS90R2pGc0JoQjNOb3NIUzkxbmlpTkIzc0pyWEtxTG5MSjR2?=
 =?utf-8?B?aEtKalhVRFAzSUtrREZHN0xWb2h0K29Bb0phV1VVUXY5M0xRSE10aS9RYmtG?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81480879E3D1EC4590076380C59AC1EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add69bd3-3647-4fc8-e62b-08dca1ce8ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 17:26:11.1297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jJb8MgI1bySJLhrihl5rvLrsGpx5GIjiG6mbDyhefoettHqhrAmlS7/Tgc3OEw4Mrzkju06LkGXN+O2PmK+aNqtwzL8SfR3IEAfAnjWmrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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

T24gVHVlLCAyMDI0LTA3LTA5IGF0IDIyOjUzICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
Cj4gT24gVHVlLCAyMDI0LTA3LTA5IGF0IDIwOjUyICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3Rl
Ogo+ID4gT24gVHVlLCBKdWwgMDksIDIwMjQgYXQgMDY6NDE6MDBQTSArMDAwMCwgU3R1YXJ0IFN1
bW1lcnMgd3JvdGU6Cj4gPiA+IEN1cnJlbnRseSB0aGUgcGFnZSBmYXVsdCBxdWV1ZSBzaXplIGlz
IGhhcmQgY29kZWQuIEhvd2V2ZXIKPiA+ID4gdGhlIGhhcmR3YXJlIHN1cHBvcnRzIGZhdWx0aW5n
IGZvciBlYWNoIEVVIGFuZCBlYWNoIENTLgo+ID4gPiBGb3Igc29tZSBhcHBsaWNhdGlvbnMgcnVu
bmluZyBvbiBoYXJkd2FyZSB3aXRoIGEgbGFyZ2UKPiA+ID4gbnVtYmVyIG9mIEVVcyBhbmQgQ1Nz
LCB0aGlzIGNhbiByZXN1bHQgaW4gYW4gb3ZlcmZsb3cgb2YKPiA+ID4gdGhlIHBhZ2UgZmF1bHQg
cXVldWUuCj4gPiA+IAo+ID4gPiBBZGQgYSBzbWFsbCBjYWxjdWxhdGlvbiB0byBkZXRlcm1pbmUg
dGhlIHBhZ2UgZmF1bHQgcXVldWUKPiA+ID4gc2l6ZSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIEVV
cyBhbmQgQ1NzIGluIHRoZSBwbGF0Zm9ybSBhcwo+ID4gPiBkZXRtaW5lZCBieSBmdXNlcy4KPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0Bp
bnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdl
ZmF1bHQuYyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4gLS0KPiA+ID4gLS0tLQo+
ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5owqDCoMKgwqAgfMKgIDkgKysr
LS0KPiA+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9w
YWdlZmF1bHQuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+
ID4gPiBpbmRleCBkZWQ4ZTNjMzNhODIuLjhmN2Y2ODAzMjgwNSAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gPiBAQCAtMjk1LDcgKzI5NSw3IEBAIHN0
YXRpYyBib29sIGdldF9wYWdlZmF1bHQoc3RydWN0IHBmX3F1ZXVlCj4gPiA+ICpwZl9xdWV1ZSwg
c3RydWN0IHBhZ2VmYXVsdCAqcGYpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoFBGRF9WSVJUVUFMX0FERFJfTE9fU0hJRlQ7Cj4gPiA+IMKgCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPnRhaWwgPSAocGZf
cXVldWUtPnRhaWwgKyBQRl9NU0dfTEVOX0RXKQo+ID4gPiAlCj4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUEZfUVVFVUVfTlVNX0RXOwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5w
Zl9xdWV1ZV9udW1fZHc7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
ID0gdHJ1ZTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHNw
aW5fdW5sb2NrX2lycSgmcGZfcXVldWUtPmxvY2spOwo+ID4gPiBAQCAtMzA3LDcgKzMwNyw4IEBA
IHN0YXRpYyBib29sIHBmX3F1ZXVlX2Z1bGwoc3RydWN0IHBmX3F1ZXVlCj4gPiA+ICpwZl9xdWV1
ZSkKPiA+ID4gwqB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBsb2NrZGVwX2Fzc2VydF9oZWxkKCZw
Zl9xdWV1ZS0+bG9jayk7Cj4gPiA+IMKgCj4gPiA+IC3CoMKgwqDCoMKgwqDCoHJldHVybiBDSVJD
X1NQQUNFKHBmX3F1ZXVlLT5oZWFkLCBwZl9xdWV1ZS0+dGFpbCwKPiA+ID4gUEZfUVVFVUVfTlVN
X0RXKSA8PQo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gQ0lSQ19TUEFDRShwZl9xdWV1ZS0+
aGVhZCwgcGZfcXVldWUtPnRhaWwsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdykgPD0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9NU0dfTEVOX0RXOwo+ID4gPiDCoH0K
PiA+ID4gwqAKPiA+ID4gQEAgLTMyMCwyMiArMzIxLDIzIEBAIGludCB4ZV9ndWNfcGFnZWZhdWx0
X2hhbmRsZXIoc3RydWN0IHhlX2d1Ywo+ID4gPiAqZ3VjLCB1MzIgKm1zZywgdTMyIGxlbikKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBhc2lkOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBm
dWxsOwo+ID4gPiDCoAo+ID4gPiAtwqDCoMKgwqDCoMKgwqAvKgo+ID4gPiAtwqDCoMKgwqDCoMKg
wqAgKiBUaGUgYmVsb3cgbG9naWMgZG9lc24ndCB3b3JrIHVubGVzcyBQRl9RVUVVRV9OVU1fRFcg
JQo+ID4gPiBQRl9NU0dfTEVOX0RXID09IDAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgICovCj4gPiA+
IC3CoMKgwqDCoMKgwqDCoEJVSUxEX0JVR19PTihQRl9RVUVVRV9OVU1fRFcgJSBQRl9NU0dfTEVO
X0RXKTsKPiA+ID4gLQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KGxlbiAhPSBQ
Rl9NU0dfTEVOX0RXKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gLUVQUk9UTzsKPiA+ID4gwqAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGFzaWQgPSBGSUVMRF9H
RVQoUEZEX0FTSUQsIG1zZ1sxXSk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZSA9IGd0
LT51c20ucGZfcXVldWUgKyAoYXNpZCAlIE5VTV9QRl9RVUVVRSk7Cj4gPiA+IMKgCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoC8qCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIFRoZSBiZWxvdyBsb2dpYyBk
b2Vzbid0IHdvcmsgdW5sZXNzIFBGX1FVRVVFX05VTV9EVyAlCj4gPiA+IFBGX01TR19MRU5fRFcg
PT0gMAo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZ3Rf
YXNzZXJ0KGd0LCAhKHBmX3F1ZXVlLT5wZl9xdWV1ZV9udW1fZHcgJQo+ID4gPiBQRl9NU0dfTEVO
X0RXKSk7Cj4gPiA+ICsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pcnFzYXZlKCZw
Zl9xdWV1ZS0+bG9jaywgZmxhZ3MpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZnVsbCA9IHBmX3F1
ZXVlX2Z1bGwocGZfcXVldWUpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFmdWxsKSB7Cj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtY3B5KHBmX3F1ZXVlLT5kYXRh
ICsgcGZfcXVldWUtPmhlYWQsIG1zZywgbGVuCj4gPiA+ICoKPiA+ID4gc2l6ZW9mKHUzMikpOwo+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmhlYWQgPSAocGZf
cXVldWUtPmhlYWQgKyBsZW4pICUKPiA+ID4gUEZfUVVFVUVfTlVNX0RXOwo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmhlYWQgPSAocGZfcXVldWUtPmhlYWQg
KyBsZW4pICUKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwZl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmsoZ3QtPnVzbS5wZl93cSwgJnBmX3F1ZXVlLT53b3JrZXIp
Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkcm1fd2FybigmeGUtPmRybSwgIlBGIFF1ZXVlIGZ1bGwsIHNob3VsZG4n
dCBiZQo+ID4gPiBwb3NzaWJsZSIpOwo+ID4gPiBAQCAtNDAyLDI2ICs0MDQsNTQgQEAgc3RhdGlj
IHZvaWQgcGFnZWZhdWx0X2Zpbmkodm9pZCAqYXJnKQo+ID4gPiDCoHsKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBhcmc7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaW50
IGk7Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc191c20p
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ID4gPiDCoAo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVldWUoZ3QtPnVzbS5hY2Nfd3EpOwo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVldWUoZ3QtPnVzbS5wZl93cSk7Cj4g
PiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IE5VTV9QRl9RVUVVRTsg
KytpKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga2ZyZWUoZ3QtPnVzbS5w
Zl9xdWV1ZVtpXS5kYXRhKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCB4ZV9h
bGxvY19wZl9xdWV1ZShzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QgcGZfcXVldWUKPiA+ID4gKnBm
X3F1ZXVlKQo+ID4gPiArewo+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZV9kc3NfbWFza190IGFsbF9k
c3M7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCBudW1fZHNzLCBudW1fZXVzOwo+ID4gPiArCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGJpdG1hcF9vcihhbGxfZHNzLCBndC0+ZnVzZV90b3BvLmdfZHNz
X21hc2ssIGd0LQo+ID4gPiA+IGZ1c2VfdG9wby5jX2Rzc19tYXNrLAo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfTUFYX0RTU19GVVNFX0JJVFMpOwo+ID4gPiArCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoG51bV9kc3MgPSBiaXRtYXBfd2VpZ2h0KGFsbF9kc3MsIFhFX01B
WF9EU1NfRlVTRV9CSVRTKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgbnVtX2V1cyA9IGJpdG1hcF93
ZWlnaHQoZ3QtPmZ1c2VfdG9wby5ldV9tYXNrX3Blcl9kc3MsCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX01BWF9F
VV9GVVNFX0JJVFMpICogbnVtX2RzczsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiB1
c2VyIGNhbiBpc3N1ZSBzZXBhcmF0ZSBwYWdlIGZhdWx0cyBwZXIgRVUgYW5kIHBlciBDUwo+ID4g
PiAqLwo+ID4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3ID0KPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEFMSUdOKG51bV9ldXMgKyBYRV9OVU1f
SFdfRU5HSU5FUywKPiA+ID4gUEZfTVNHX0xFTl9EVyk7Cj4gPiAKPiA+IFRoaXMgZG9lc24ndCBs
b29rIGNvcnJlY3QuCj4gPiAKPiA+IElmIHNob3VsZCBiZSAobnVtX2V1cyArIFhFX05VTV9IV19F
TkdJTkVTKSAqIFBGX01TR19MRU5fRFcsIHJpZ2h0Pwo+IAo+IFllYWggdGhhbmtzIGZvciB0aGUg
Y29ycmVjdGlvbiBoZXJlLCB5b3UncmUgcmlnaHQuCj4gCj4gPiAKPiA+IEFsc28gSSBiZWxpZXZl
IHdlIG5lZWQgc2ltbGlsYXIgbWF0aCB3aGVuIHNpemluZyB0aGUgRzJIIHF1ZXVlIHRvbwo+ID4g
YXMKPiA+IFBGCj4gPiBzaG93IHVwIHRoYXQgcXVldWUgZmlyc3QgYmVmb3JlIGdldHRpbmcgc3Vu
ayBpbnRvIHRoaXMgcXVldWUuCgpIZXkgTWF0dCwKClNvIG9uIHNlY29uZCB0aG91Z2h0LCBkbyB3
ZSByZWFsbHkgbmVlZCB0byBtYWtlIHRoaXMgY2hhbmdlIGluIHRoZSBjdGI/CkZvciB0aGUgUEYg
cXVldWUgaXQgbWFrZXMgc2Vuc2UgLSBlYWNoIHF1ZXVlIG1pZ2h0IGJlIGRvaW5nIHNvbWUgbWVt
b3J5Cm9wZXJhdGlvbiB3aGljaCB0YWtlcyB0aW1lLiBTbyBwcmVzdW1hYmx5IGFsbCBvZiB0aGUg
cXVldWVzIGNvdWxkIGJlCmFjdGl2ZSBhdCBvbmNlLgoKT24gdGhlIG90aGVyIGhhbmQsIHRoZSBj
dGIgaXMgcHJvY2Vzc2luZyBtZXNzYWdlcyBhbmQgaGFuZGluZyB0aGVtIG9mZgpxdWlja2x5LCBh
Z25vc3RpYyB0byB3aGV0aGVyIHRoZXkgYXJlIHBhZ2UgZmF1bHRzIG9yIHNvbWV0aGluZyBlbHNl
LgoKSU1PIHdlIHNob3VsZCBrZWVwIHRoZSBjdGIgc2VwYXJhdGUgYW5kIGluY3JlYXNlIG9ubHkg
aWYgaXQgc2VlbXMgbGlrZQp0aGUgbWVtb3J5IHRyYWZmaWMgdGhlcmUgaXMgY2F1c2luZyB1bm5l
Y2Vzc2FyeSBiYWNrcHJlc3N1cmUuCgpUaGFua3MsClN0dWFydAoKPiAKPiBBaCB5b3UgaGFkIG1h
ZGUgdGhhdCBjb21tZW50IHRoZSBmaXJzdCB0aW1lIGFyb3VuZCBhbmQgSSBtaXNzZWQgaXQgOigK
PiAKPiBMZXQgbWUgY2xlYW4gdGhhdCB1cCBhbmQgZ2V0IGJhY2suCj4gCj4gVGhhbmtzLAo+IFN0
dWFydAo+IAo+ID4gCj4gPiBNYXR0Cj4gPiAKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBw
Zl9xdWV1ZS0+Z3QgPSBndDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmRhdGEgPSBr
emFsbG9jKHBmX3F1ZXVlLT5wZl9xdWV1ZV9udW1fZHcsCj4gPiA+IEdGUF9LRVJORUwpOwo+ID4g
PiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmcGZfcXVldWUtPmxvY2spOwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJnBmX3F1ZXVlLT53b3JrZXIsIHBmX3F1ZXVlX3dvcmtf
ZnVuYyk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+IMKgfQo+
ID4gPiDCoAo+ID4gPiDCoGludCB4ZV9ndF9wYWdlZmF1bHRfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0
KQo+ID4gPiDCoHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
Z3RfdG9feGUoZ3QpOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgaW50IGksIHJldCA9IDA7Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAo
IXhlLT5pbmZvLmhhc191c20pCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIDA7Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwg
TlVNX1BGX1FVRVVFOyArK2kpIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGd0LT51c20ucGZfcXVldWVbaV0uZ3QgPSBndDsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHNwaW5fbG9ja19pbml0KCZndC0+dXNtLnBmX3F1ZXVlW2ldLmxvY2spOwo+ID4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSU5JVF9XT1JLKCZndC0+dXNtLnBmX3F1
ZXVlW2ldLndvcmtlciwKPiA+ID4gcGZfcXVldWVfd29ya19mdW5jKTsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2FsbG9jX3BmX3F1ZXVlKGd0LCAmZ3QtCj4g
PiA+ID51c20ucGZfcXVldWVbaV0pOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKHJldCkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IE5VTV9BQ0NfUVVFVUU7ICsraSkgewo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT51c20uYWNjX3F1ZXVlW2ldLmd0ID0gZ3Q7
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gPiA+IGluZGV4IGNjYjRmN2Iy
YmYxNS4uZWM2N2Q2YWUzMjI2IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdHlwZXMuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMu
aAo+ID4gPiBAQCAtMjcyLDkgKzI3MiwxNCBAQCBzdHJ1Y3QgeGVfZ3Qgewo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBwZl9xdWV1ZSB7Cj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAdXNtLnBmX3F1ZXVl
Lmd0OiBiYWNrIHBvaW50ZXIgdG8gR1QKPiA+ID4gKi8KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndDsKPiA+ID4gLSNk
ZWZpbmUgUEZfUVVFVUVfTlVNX0RXwqDCoMKgwqDCoMKgwqDCoDEyOAo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5wZl9xdWV1ZS5k
YXRhOiBkYXRhIGluIHRoZSBwYWdlCj4gPiA+IGZhdWx0IHF1ZXVlICovCj4gPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyIGRhdGFbUEZfUVVFVUVf
TlVNX0RXXTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1MzIgKmRhdGE7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyoqCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogQHVzbS5wZl9xdWV1ZV9udW1fZHc6IG51bWJlciBvZiBEV09SRFMKPiA+
ID4gaW4gdGhlIHBhZ2UKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKiBmYXVsdCBxdWV1ZS4gRHluYW1pY2FsbHkgY2FsY3VsYXRlZAo+ID4gPiBi
YXNlZCBvbiB0aGUgbnVtYmVyCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogb2YgY29tcHV0ZSByZXNvdXJjZXMgYXZhaWxhYmxlLgo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBwZl9xdWV1
ZV9udW1fZHc7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qKgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKiBAdXNtLnBmX3F1ZXVlLnRhaWw6IHRhaWwgcG9pbnRlciBpbgo+ID4gPiBEV3MK
PiA+ID4gZm9yIHBhZ2UgZmF1bHQgcXVldWUsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG1vdmVkIGJ5IHdvcmtlciB3aGljaCBwcm9jZXNz
ZXMgZmF1bHRzCj4gPiA+IChjb25zdW1lcikuCj4gPiA+IC0tIAo+ID4gPiAyLjM0LjEKPiA+ID4g
Cj4gCgo=
