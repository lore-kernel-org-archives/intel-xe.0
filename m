Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7D7C98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 23:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B0910E009;
	Fri, 16 Jan 2026 23:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddJoC+Uc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0B710E009
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 23:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768605339; x=1800141339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nThswW+lDya4K0hBqPLJ0d8KQxh8AiWVC1X7kwxeFe0=;
 b=ddJoC+UcJvZOYADSCQ7Tk4DXiTTgemCOUXVdzL5xKv7BzanKKEGQ0R8V
 pVpCJ71IvZR6Kx40h9pjxmTeA0wsIHIwhuLPyc/6ez54cri0/du+xaJa0
 oq97N64RGHYkqfbziFuBxnuG2F5ZS97kvzsHLfFhTEEHgpLKcmqcvTWpJ
 Rv6fDZs0isCvIzMMvepHR9YgFKWzfILkKvzIeA0gx4XJE8Vil+7C/N+tz
 4mHoGa2yprRa+SVuXMfQmBl+aJ1D7tnAgIPbzqab/DH7gkhNFpV0fXzc3
 ay4NEvgAqi48Rls2uBIjK0Y0pSc9N01qC23dQKglUcS8qm6U0g8jLDBjR g==;
X-CSE-ConnectionGUID: lUpxkx9hTWKr9deztLmyxQ==
X-CSE-MsgGUID: KnuUh4BtS/y2XJ77Uau7qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81294577"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="81294577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 15:15:39 -0800
X-CSE-ConnectionGUID: HOScdXdMQsuciF5Yi3LLWQ==
X-CSE-MsgGUID: uylGgGlUQ8+8G0fWuyFzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210373302"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 15:15:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 15:15:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 15:15:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 15:15:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twnDww/Zx2etnWrssQxjJybsNFoyhcgWomDzTQRBCPxLefVMcxD2av8s6CsmXutEpRYlql6oRd+Sc7D1yVsmc3v442aWuaB+/PXJnxeT9K5DaeiDTfKOLSi1e36cTTJh4ZzKoHZdh4ykUYTRygEWLBiNtoBeZ6K7BO9JcPWmCGWODAorxn1XhHeBhuV2qDo/+hcRmWiRqALKR8dpftnGqtKba4d6rgFzyeE3+Rf6Te23wJMkDdkyaWFQBsCvpyDcAHxFqc4g55HKbF0tPuB0ObKlbeHLdAHXF9yPk515lOXzFov8TfGv1vYIZ8zjraG6ue4zwqgfVvtJ+YjkIfel5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hNQZsWsORG1DhA+SbvrwhmcmP5V/ju2K5e13/TnMmU=;
 b=uHfmicqEngkiFVKLgycg8C5TPwkcjj98X95uqtn6FeXePQGvvV9oqrYH23TajbNkVKKYesbinAtpB9W6O2NlZYvOwQbMCzM+GZvVAyd660AXtfjXbdN0/xLZAfexm7j7Or1FI6PyG4yAsxcEo2eIzgDF3BEu1KnjmfgSQEl8BMjNXKij3G61cEKssbHxd8a36kYKi1H0MxTemFzTdennvKas2uWaK38mNAyzIPFGq+FKC1LxXD+O7LEWrpArC+aiN+jRw17A5wAc8ue0g5TFitk3akzy6HIeEdwZbwvWAvQISw3gMqnsWYFCGMijP8vOu0WEguuA14kNTgCSW8mkvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 23:15:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 23:15:33 +0000
Message-ID: <203dac4b-2de5-4eef-8bee-e274701db2f2@intel.com>
Date: Sat, 17 Jan 2026 00:15:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/xe/kunit: Abort test if MMIO operation is
 attempted
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-5-d420b9c1a327@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260116-rtp-mcr-check-v1-5-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1402903d-ef4d-4ac7-dc3e-08de55552632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmlOME5LUjd2cGxpZzJDeXdGcUNwWWdFVEo3V2xHWFc0MytDTzQ1bU9hVThV?=
 =?utf-8?B?bGJKN2xZSFp6UEJ2ZEpRYVA0K1BRU1NRdTg4c0h3VnJ5UGNCTGU1UHFyTG5F?=
 =?utf-8?B?YnBvVlJqTUU4dTM1UFUyazdSUVg0K1ZERER0aUVZcUVtUzFPZWwvU2xZVmNz?=
 =?utf-8?B?UkRad1BDVEwxOFhTRnRUT1FIU1NCUlNYNDZOUHpqdWs4VXNJeGhTSTZHc1Z2?=
 =?utf-8?B?ZE5yQUxxOUhCUlFHTnBOcnl5WXZGZ3dJWmw5amIyMzhZZjJhZVZZUmxCT1Vn?=
 =?utf-8?B?elEwOElVR0ptTGRDejZUVzR1T2ZOUTdxSGhVbjBlLzZlVlp1SjBuSUVNTHhh?=
 =?utf-8?B?MDFYZnRXc3VLMWJTWGQ3TlZLOTZ0WGZwN0l4L1dtQi9EbTVJZUVMWjRVOTRz?=
 =?utf-8?B?TnJqMGRkMW9jejlqQjZTUUVheERIY0lGWFVibEJ6SXZaanBiNXFmc0hZVGwz?=
 =?utf-8?B?NnYra3pGdE02ai95aVZWY0dZQ1BYc1BtNHdUZzJWbzEzUzc0UU9QWGREZHhj?=
 =?utf-8?B?Z2Y4anJwQ1Q3R09FdG94U0NIZWZad3pNZFU5aUtwT0Y3OUpuQ090ZGRDZ3Zs?=
 =?utf-8?B?ZjcrZENtUEpDNEYrNjhGd2l5eDJlT2JpZEtSWE9YWFMzWHNMY2IwSUxSd29q?=
 =?utf-8?B?amhLdUZFeDVrMW40UVk1bWNsaE1ZanpxNXJWbld5UG9MVlhCRHJTNmROMmpZ?=
 =?utf-8?B?Vzg5cm9jQWRZbmQ2bG5CZXdVZWl5cHpqYnFrWTZyS0w0b3BCTkFJbjZyQzBr?=
 =?utf-8?B?R0hvb0NranluZW5nV0FmS0xxTlZFUndIRnk2aWdaMnZtbkNGdVRjdjRrbUp2?=
 =?utf-8?B?QVZrd0ptRDA2S2dENTI0dmQvZlhabkEzemMrZEsxR3YzNWQ4WlE0UndBenY3?=
 =?utf-8?B?M2JBZjR6TVk2T2NkTzRIdE5ZWXlHQi9Ec1hlMDVpSnpWWXNubFFzS3ZQOVFa?=
 =?utf-8?B?WEVLeDVhWGwwSmR0UGMyeU9hbmw4cE4vWmlpOTQxcjBpREo1b0drdXBOdUI0?=
 =?utf-8?B?c0Z4RzZ2aTFud2FZNGdZdzQzY3o1N20yQXJvL3h5dFhyaUpFdTRGQkF0RW84?=
 =?utf-8?B?ZXRqbHluSlM4emlTOHpENWE2aWV0S1N4akcrWHV0dUhpWEZlRUtrdlpjZXFq?=
 =?utf-8?B?VUZZNTlVZkNNU043ajJxMTcyeXNLQ1h1aWc2RTVVbXFEWWZUckJ3dzhFalQr?=
 =?utf-8?B?M1FDQnJ5VkVOV2xzc0JlY0E5TS9yWjRZdVUxNU5nN0xnTm4xTmFzWE1YU0Ry?=
 =?utf-8?B?SERLUy9mWWlhUkhkYk80WXdwZWNMdm9Iek5HUFJMMGc2bEFSNjFIVklRRFd2?=
 =?utf-8?B?K25TbFo3cFBQUHdvYlk4cjAxUE5XRlhydVhSMDUxQ3ZyUjZqcGFxV09HMFVo?=
 =?utf-8?B?NWQxSWx4Q3gxMEd0aTY0U0prY2pONzNnZWtHbzVla0VVMDg2ZHpySDdScVQ3?=
 =?utf-8?B?clhWSmVZL0pCNVhCbTNpZjJTQlRjdjIzOENGTTdrQUJxd0g3emRuRTA2S05p?=
 =?utf-8?B?QXdPUHBHNWUwWjY2eWV1T0VXWWJMcFlkUFRkSnd2aTVnajcxcERPdit4eHBo?=
 =?utf-8?B?ZktSR0dQRUFXdk5Sb2hjeHdMazYrN3Rhak1iYlIwMWhFUDVBYU51V0lSMFlj?=
 =?utf-8?B?OTZZY1JidnVHMGRMVjg1U0lHVUtkTjZrNmFPZmRSc2J5bjNEQUVBUjlZMTY4?=
 =?utf-8?B?eWlpckUzK1VSZnR2NUc1L20rY0ZLZ25XcTgza3lQNVJiY084ZXloN1c5UlVz?=
 =?utf-8?B?bmFIalBIT1ZQQ2MvVCtFMjhLZ3BhRHpEMlJ4Y2YxTVUzVlVjT1BwNWxMMjNN?=
 =?utf-8?B?enMvbm1vbEkydUwvbkhqSWo1MWdGUGtlWGgwS3B1a2xTUUl6Qno4by9VTDQ1?=
 =?utf-8?B?QUs0YnY4N3pXWG1yWVBJbytPQUIzVkkxVEl3R1gxbGczTks3UEF1cmxBU0FH?=
 =?utf-8?B?eG85NHo4ZkNUWFk0MXBpSGhSUXRjOFl3eHV3cUEreFhxYWZXYTJsdllwOGtu?=
 =?utf-8?B?WnFoK1RsRXFqcStwZENOanpUdzFldUpkWHlaMnFNbS9jVjJ2MTc1bzBEeWlD?=
 =?utf-8?B?RGpFTlRQclZYelhPQ0trdlBrcHMvVVgvN3ExemFNQi9KMW9vQTM2d21Iei9w?=
 =?utf-8?Q?Z7Sw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE9JREhHbzBva0l1L1IydEtjenJGR3ZyR0Y3UG0zR2cwTXA3ZmFEWW4xRjhP?=
 =?utf-8?B?RU9uMGdzVEpWSTVqa2RZUkFkMUxBSncvOVB1emczSEdLQ0FwcXVVTllWZWp0?=
 =?utf-8?B?ZG11UHpRUkxnN1RPeXFaTlUzTVAwMUJCb2NlMGlBejJpa2o5ay9talVtY2hT?=
 =?utf-8?B?ZTUvdTBhcEcrY2IrakwxM05Sa2syVU51aiszZHdrNUdubG5WRHppV05TRlV0?=
 =?utf-8?B?dUNpR2UxeHZZeVRWUndITTAxaE5wWW1VZjdGSDhtTUJRR0hDanBhQWtDNUpL?=
 =?utf-8?B?NTRhNGJoU1RaRUtTQ0pEZFNEUWNnUktLbm9QMmpUYXh4L0J0MmN3d2JjbkJq?=
 =?utf-8?B?eVFOQW9STzRob21MbjRFVDFvQjd3czE1bDNEazVLTlJVSFlqdE96MktmaUpo?=
 =?utf-8?B?TzZpQnVFdXhROGpNN3NLeVROaUJjMTI0TlhPZGZCU3VseCtWV0RWMGl6L0dL?=
 =?utf-8?B?TUtqYXd2MHFUVXBZSlhjWWQyb3ZSWDR5K2N2MUNQWXFkM1hBOFF2VlI5S0c2?=
 =?utf-8?B?dVJSY1lRYlhnY05wekkrYmErT09wQ1M0SGd5VFFFeGNaZ2EvUjZyRHJKelFv?=
 =?utf-8?B?bDhoQmxzUkxJSFozdDMyNXR1aGV1algwUC9IZ0ZSVFZDdWVDdm1oVFRBcEpX?=
 =?utf-8?B?cU05MmNyeU8vNFM5T2tBMDhncllJa1VCUjArZWg1azNqYVZPTFdydndpMWI4?=
 =?utf-8?B?QzEwaUJlTlphUElJRDZEYVZRRFlmN0psa1QrZGdBWmFrWkg5bnhOOExialYz?=
 =?utf-8?B?S3d2Wm1CaXdyWUMwWlFVN080MTNRN2F2dzRPT3FRUDdWTkZiOHhwZG1UWFp4?=
 =?utf-8?B?U1NlL2lIWGthOEZXSVBpQmJhMmhqdnIrT0plLzVnelp0MzdpTnFYdjRNd1d2?=
 =?utf-8?B?VUhHZ3ZCS3grcEZ0MWdrNHhBQXAwSHp3MHVsNWlYcy91Y01hSzl2UDlxNkNy?=
 =?utf-8?B?NUxlUTlwQktiakE0TjJ0RnVyMkpFb0JiMUp2emVTN3Z1dytMT1R3Vi9za05h?=
 =?utf-8?B?UE9BZHZ0cHdRbVh3anp0LzgxL3RzUTZSNVdycDgveXp4L1YzWVMzWGV3V3BJ?=
 =?utf-8?B?V0taakVzUGI4ZjRIRGFveGlUVFRWY2VwMnRuNU1pbWxyQndhWkZ5VjBYa29L?=
 =?utf-8?B?NFRBTWRlMFlhWHc4U0Fkby9ZQUxTSzVkV3BKRlUzemJyNFZhNldqSitCclZS?=
 =?utf-8?B?ZWZWZXRIdk5Na3Q4WUhvOEc1cGxkSDRVcEZpcy92MzV1aTA5VDhPSmg1NzJQ?=
 =?utf-8?B?Z2l4ckNEZzE1VkNSbzNMeFRlZW5GRXducGJzTzVBVjBiRzJhc05IWXZDc0Rr?=
 =?utf-8?B?OHVvVWVqeUd0eVZsQzlkOVNsYjViMTVaYkFsM2Vnd1VvUkNpOUdVa3FoS0lG?=
 =?utf-8?B?cE5VbGtmYjRmUFF0WHhSS0o3c056ZUhXbmFqeXVPUmcrU3RDZ1h4Z0VrTTls?=
 =?utf-8?B?Sk1aSXdlRTlWVjZoRDJ5cHJHS3pacUFpVUF0NSthWkhuYXBXaVN1SzJVN29Y?=
 =?utf-8?B?bmYxalZ0aDZSeFFQTFV1TG94UVZhdHdudlBxQlcwMkpjSjk3dHBxSUJxYjhM?=
 =?utf-8?B?c2hLdEZ3RjMvcTRCZWRHSStWZG1PUDg0a3pTZ2UwcDdXVkNuRVVqTzkwS2hm?=
 =?utf-8?B?a3N6NGtBUnk3ZUl4bjRSYUdrVFFQVEdzM1pYRDBCLzl3bXA5N2Jvem5JZXFC?=
 =?utf-8?B?TEQ0SklTL0dKQUFWUWo3aDRobDJMdWpFa0RhTTF6NGlHbzljUUpkVnZhVkZx?=
 =?utf-8?B?MmwrVFRWMmNHTXRBMzZMcjAxV2N2dHdaYTJMRXMrRmwrR2MreVZZM25IUFRI?=
 =?utf-8?B?R2hEL0pCTndMNnJYWDZHYUdBYWE5VDE1M1JMVWQ1a3NsZUFoK2ppc0ZDWVJo?=
 =?utf-8?B?RXFtSXZoTjN5VlMvQ2JUandsc0dndnZYMHRwbE9PSVNTenJSa1pPYWZjeUJW?=
 =?utf-8?B?TWF6WkEwNjNBMXd1MHhxaURUbE1pY2V2MDMxV3F0VEp1aE9JYVdnWjhPeVB1?=
 =?utf-8?B?TTVhUGJkZmUzUi9WZGJVdHZWZ0Y3bjlPNWRDRzcxYTNJTFBocG1lTzdOYXMv?=
 =?utf-8?B?dlBMQVpORXJyelF6SmMwdXdVc3g3UW1tRXdodUZlaHFRbWpkbE1XdmlXK2VZ?=
 =?utf-8?B?Wm9NRFd1ZC9tUDh1QUtjU3J0RXpmekhDRVpwWTdlMXNwdnppaVB4ZDdGbVNI?=
 =?utf-8?B?OVFTaXU3dE1kK0JEWis2RndPNWFRcHRYcGlWRkhKR3hJemtVUFdIc3p0U2JR?=
 =?utf-8?B?TU4zSHRkZzU5ekVDZE1iRkZ3TWxIY3RQWGdEWmk4Szl0aFVVRHp3bVpEdDdV?=
 =?utf-8?B?eGdGOFBBNWIwYkM3bkNmZVVMZmNyVDB6TWVNRk44UDZWcm1BamNyU2ttT2p1?=
 =?utf-8?Q?PItnzaBk0GgECnkw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1402903d-ef4d-4ac7-dc3e-08de55552632
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:15:33.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFpYPOQ0djQrEGc9uzbjO8RKmnp6+8WrLl6sG8vyAa/JfdPZtkYLeHCrb4o66FuBMjuiHMxD/EwJP/phvsLdtF/0EqbnY/VAyrX5Bo7M1WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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



On 1/16/2026 11:12 PM, Gustavo Sousa wrote:
> Regular Xe KUnit tests (i.e. not the live ones) are usually run in
> User-Mode Linux and do not have access to the real hardware and, as
> such, should not attempt to do MMIO operations. If some test ends up
> exercising a path that contains MMIO operations, the test should be
> rewritten in a way that the MMIO is skipped or simulated (e.g. via a
> static stub).
> 
> Let's make sure to abort the test if MMIO is attempted on non-live
> tests.  Before aborting, use drm_WARN() to cause a stack trace to be
> logged as a debug aid to the developer.

maybe cleaner solution would be first to add to all xe_mmio functions:

	KUNIT_STATIC_STUB_REDIRECT

and then (in separate patch) activate "abort" stubs in xe_pci_fake_device_init,
similar to what we do with read_gmdid & xe_info_probe_tile_count

if any test would like to intercept some mmio read/writes it will just provide and activate its own stub
and such usage will be no different than any other use of stubs

this will allow to drop patch 6 which introduces (IMO unnecessary) another layer
(where test should stub another test function instead of the real function)

> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile        |  1 +
>  drivers/gpu/drm/xe/tests/xe_kunit_mmio.c | 35 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_mmio.h | 27 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.c             |  9 ++++++++
>  4 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index 0e3408f4952c..8f3a594449c8 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -8,6 +8,7 @@ xe_live_test-y = xe_live_test_mod.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
>  xe_test-y = xe_test_mod.o \
>  	xe_args_test.o \
> +	xe_kunit_mmio.o \
>  	xe_pci_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
> new file mode 100644
> index 000000000000..debf8bd3f9dd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_kunit_mmio.h"
> +#include "xe_device_types.h"
> +
> +/**
> + * xe_kunit_mmio_abort_if_not_live_test - Abort test execution if not in a live test.
> + * @mmio: MMIO target
> + * @reg: Register on which an MMIO operation is about to be performed
> + *
> + * This function must be called from xe_mmio functions that perform MMIO
> + * operations on the hardware.  If the current process is a kunit test and it is
> + * not a live test, it will cause a warn and abort the test; otherwise it does
> + * nothing.
> + */
> +void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg)
> +{
> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> +	struct kunit *test = kunit_get_current_test();
> +
> +	if (!test || xe_kunit_is_live_test(test))
> +		return;
> +
> +	drm_WARN(&xe->drm, true, "MMIO function called on reg 0x%x\n", reg.addr);
> +	KUNIT_FAIL_AND_ABORT(test, "MMIO function called on reg 0x%x\n", reg.addr);
> +}
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
> new file mode 100644
> index 000000000000..d46ac2b82969
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_mmio.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_KUNIT_MMIO_H_
> +#define _XE_KUNIT_MMIO_H_
> +
> +#include <linux/types.h>
> +
> +#include "regs/xe_reg_defs.h"
> +
> +struct xe_mmio;
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +
> +void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg);
> +
> +#else
> +
> +static void xe_kunit_mmio_abort_if_not_live_test(struct xe_mmio *mmio, struct xe_reg reg)
> +{
> +}
> +
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index bcb6674b7dac..0f9a1d5453df 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_print.h>
>  
>  #include "regs/xe_bars.h"
> +#include "tests/xe_kunit_mmio.h"
>  #include "xe_device.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_sriov.h"
> @@ -146,6 +147,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u8 val;
>  
> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
> +
>  	mmio_flush_pending_writes(mmio);
>  
>  	val = readb(mmio->regs + addr);
> @@ -159,6 +162,8 @@ u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u16 val;
>  
> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
> +
>  	mmio_flush_pending_writes(mmio);
>  
>  	val = readw(mmio->regs + addr);
> @@ -171,6 +176,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>  {
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  
> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
> +
>  	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>  
>  	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> @@ -185,6 +192,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u32 val;
>  
> +	xe_kunit_mmio_abort_if_not_live_test(mmio, reg);
> +
>  	mmio_flush_pending_writes(mmio);
>  
>  	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> 

