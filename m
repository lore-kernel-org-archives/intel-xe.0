Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E13B606A32F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IkbkiVJY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49010E858;
	Wed,  4 Nov 2026 07:37:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372F610E83C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793777858; x=1825313858;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Fx+eHsXBNXSIVkFeVHjswQFJTSNmUabW0kslBCjxBj8=;
 b=IkbkiVJYIfslXV2JfWDTjCRzHEaa+ASj0+5+QEmOjktfZUVm0DOqpJcF
 xB6NnibFQRxUasfm5QbWt98FnB6oZbT7M1xmbK0KZ0UmE4237JzE79wW9
 1gxg/CHNNe2Ka49ATuJ9mB2czG9WL95aa/QRFpOoWgjvTAjul4CbD+dIA
 NP78BJUoAWfyKC+dIPThY0517iVjLSXG9ZO/fBgUeem9vUwU/beiOxhGj
 /8ruIHPL1JBWZrKxsE77RBfTqpEyR+p7oToLwPBQno8lAeKxf6aebrCsW
 RcAIe/jtC6VIIcOXZkn6QDohncZV76oQeqYSK36HgU3OLmGOdclvyovrf A==;
X-CSE-ConnectionGUID: ApKkzKkwRqmhRjTIWcbzpQ==
X-CSE-MsgGUID: gJiv/IvmSQe3+cbnkCN7IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2421593"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; d="scan'208,217";a="2421593"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:37:37 -0800
X-CSE-ConnectionGUID: apHDmw4WTAeUGPfnvcHZjQ==
X-CSE-MsgGUID: UM0js8YeTwa4dQrEwWT3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; d="scan'208,217";a="6716374"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:37:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 23:37:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 23:37:37 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 23:37:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIPkuNNNpvmOH/W+S676bSt0Sw6jXm4tajUsXa9R3hK8e4oNszRqsRCl+VhKPwy5Fr5lFMXks9yio2w/BaOh+Klg2ZhuCUgjUYWzVnzLLKdHaIG+uI1Hbk8AJCUe6MX5kk2/pn2ze29mKE4cXHokcHggUMX8amLcdoo3DfOUjm3npPQ2nvpp0VMkuSzDeLQbCI7bRjurDcb0aUwMt9D/xNFQsr//IivOmsgDE6MGssv3c6o9k36qD2Bq4bzJd3mhSFp3I667Jmw9J+JNe2k7h7MkojNWDOvD16fwOdAo1W4ppvTFX8A/6TrmfmhC0rw9m8p302OM5p4OXM47w/690A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYUBFGPGp3v3wLIokbbb/wUEp97Jns6HmLMuhWWsOWk=;
 b=VU4ETCfM69zs+jF3I5738Y4SOSMaugGATmuTh3ENWHyCaWTDvov16zYlTxWjBlaWcIImGsahTjscptBszDsFlDcscmDXd0r9EERl4QRwRa0PCsSFwq0c/A/XQv8C7N+6MIOGQLZ33j22SXDU8X3jG8c5Un02lFPnFRvjkGi95sRxgywy+Oyr1krfr1i8kE9vZzvalaV2FHGGL7VIW7btOl5Lw683jhFHeB2PalS3FJhYOPcv3qL3+oL32X+wHzF+uR2bkn3F/hBK1VTAKvi8xgvWzT7q7Eph7+7TDBzLy2gYvhkmcEe2iwD7QB4pGNnKxSRy4CdhBBXZVCCoH0gtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 by SA3PR11MB216728.namprd11.prod.outlook.com (2603:10b6:806:589::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 07:37:30 +0000
Received: from BN9PR11MB5257.namprd11.prod.outlook.com
 ([fe80::4186:14db:2be6:5f3f]) by BN9PR11MB5257.namprd11.prod.outlook.com
 ([fe80::4186:14db:2be6:5f3f%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:37:30 +0000
Content-Type: multipart/alternative;
 boundary="------------OiZ00lEXptqNDXdzNcgayIHn"
Message-ID: <3032c66b-9718-4917-b335-caea298c794e@intel.com>
Date: Wed, 4 Nov 2026 13:07:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Reset GuC before unmapping its post-hwconfig
 buffers
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Stuart Summers <stuart.summers@intel.com>
References: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
 <at9epeRtNe-eKEdY@bvivekan-mobl1>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <at9epeRtNe-eKEdY@bvivekan-mobl1>
X-ClientProxiedBy: MA5P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::10) To BN9PR11MB5257.namprd11.prod.outlook.com
 (2603:10b6:408:132::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5257:EE_|SA3PR11MB216728:EE_
X-MS-Office365-Filtering-Correlation-Id: a11a548e-2782-4f12-355e-08df3a467b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006|261021123027099003|261102123227099003|8096899003|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261009223027099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8dDisuORrqQRS/XnaIHJvLA5fq5sBooU4SaDveMiCY80hwkPXUM6WGKz0O9Q54NzPF4UHo9KBJBn8kwviXao37crCombedkNsB7vvOrW+7/+GZE1ArPzgcT33UMVVWIhLNO4SDuWezHHbx5VTQcs4PFCjXmAgLxj7SjrVrwl5CeK2Z6UKWD9yScyRtHe+V1OMS6pGQDI6ANcQrcQBxmAdHKeUA80pF+Rva72mR8/UGoOUrul7VsOaUoXpkgRbvtlgeLzQUARw26kBlodhWbJcJ5bOFwidHzHSzfd7vp8D50H/KsjtQakD33dOGURVTDrr5Ebu0EtvnvG6PhqhnSOFvPo9sGZaK8MxDO0dBrobzONvQDsIBO+NgdNFROCgzPoWHuDuiC6EHTHvYRYxY4q8UmM2oyfPeUtWcvjlhbXbIl9suKcmH4Q+0Mzht71PJhOqOeDCvoTr/JpOQesvpcH53zK4QZQvhMa1jwIDr8HktMAevAAwn3NYDBPOYhd7IGh3+1D+SfPuXOdBNuCslM2zJ6+Pyckp6FDy561Pgog1SDjvw315wi6PXlcHKMQrQMOmMXbwC5hIrEQD0ByWdbWhX69xodeE3Hr5r/T3qw2WlEu1UKU/ho69YmEIoI6Vz5Ap5DsXkt83rM02P35J3Kloh3Fp637d+qM54PVkzrs4no=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261102123227099003)(8096899003)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGppV1gvdlBTY3pKUEQwNlVMMlJ6ZnRlWWl0MnVTTlZHSkZYVnJDZitmZVpw?=
 =?utf-8?B?MWtkL05RRFBoNEtNeEhEWUl6Zks5UkFpRldSNWxXQzd0bVUxZS9NVU1OSVhi?=
 =?utf-8?B?ZEQ1aHpkN0x4dmZjM2tKaTc0S3RjVUlhbVVxNytIazZ1VEtDYk1DY3NvRzFU?=
 =?utf-8?B?amtYdXF0R2o2NU9MdGU1Ry9CV2E5MXJrbXBXdGVibmkxaTgyaW9aWGwwdnhX?=
 =?utf-8?B?aW93ZEpHMmRRUGZsMGQ4VXgrbCtFQkV5Vlk0TGhLOXRtYm4xcERpZ1VYaXRX?=
 =?utf-8?B?OEJ3SkxDcUwvQnY3SlRjWE9VL3Z1VzlQK0ZuKzd6S1dnaWFKQVAxZmJNcXda?=
 =?utf-8?B?ODVkMDRUeWxheDRoWmxZU1lBbnE5OHdyUFVZS3BPWERScHI0d1VmcmpNSlp5?=
 =?utf-8?B?UHJXakpyN3FEc0dyQ1N2cFZxYjNvaDJieUJqc2hPbFpyYWZiYXBZcUhxTFRo?=
 =?utf-8?B?dnI2WFc3V0Vka294VU5GZmZHQWpmNmxuelVkcDc2dnc5ektpbk9NRzBia3ZI?=
 =?utf-8?B?L1NCRzgrMlBPcjVPaFlsVXV1K2w1MjBTUU9HVStONU5HV2c4a2FXeVJsWEpR?=
 =?utf-8?B?d2EzdkRhZU9qVkg1djNzKzVrbjRTT0dmRytjcUdNLzVXdkgrM055K0lDZUxR?=
 =?utf-8?B?MVlKNndLOGVHMHZkUkVEVU9YT3BRcm8rZzRjSHpRSk5uS09tUmNqNWJvR0FJ?=
 =?utf-8?B?SUV3QzhySHRYNnVMU1lISENiNFdlem1qSEtrbHQ2V2YxT2Nkem1SbFR2a0xT?=
 =?utf-8?B?OFRoTWtjcHFHRkhYTytlaWRtRU5QQy9zL3FKV1ZjazlDdjBKcExrNXMwYm9Y?=
 =?utf-8?B?S2c0Rk4xa25lbHlCYk1rYlJkNUFYQXEyNWNTSWRaQTFEbUUzYjk0alBMVjlq?=
 =?utf-8?B?YW1ZQ1NPWmphaFQ5SFU0MFBTdUZyODdJMEpqTW1lQ3dHQzU3MnRhWm9adXcw?=
 =?utf-8?B?aW1SdWV1TmFGL29tYlIwWW1VRFR3eEtjWjgzaTJvbWIyMFhBOXNyRktlWVo0?=
 =?utf-8?B?Nngyc0pWZldKWFhzakRHV3MrTGFORko5bkRUVUhKYmtpeEZXd2RrcmxaL096?=
 =?utf-8?B?SjhqSVI5anhTK3I4eVdrK0pTQWdUUjlFSDg4N3pnVE91UVBhR0hzSnJCSDJM?=
 =?utf-8?B?OGJSRCtlQ1Z5QTZVNVhLUWcrSkVER3pJYlphblNMTWplWWhNczRtYUcyRnF1?=
 =?utf-8?B?SmhRZzJiNndpTVR6M1lCa0dNNDFNMFZleDgxZlNoTXVnaDVibnlJQ08wTzlH?=
 =?utf-8?B?V3lJc2cxTmFteWw2eDFyU2JJWWlTUDhqWlJ3Z1JmYURtNlZ2TkpDeWFsMmJj?=
 =?utf-8?B?N3QzRmZtaGpUUmhjTHFHcXNmWVh3ajg0Y1RIV2E2ZDRCMXhXdmdDR2tOR3RS?=
 =?utf-8?B?MFJya09lQ2srRWtBbUt0anlaSHliVWNneGZPc25UK01XRGs0UFZuOE1uNEtU?=
 =?utf-8?B?MlJmQXFLQUNQdFlKeTlFYnlzL2U4MXV2YSsyWkRmazJNT0h4b2tMbXNDZlVM?=
 =?utf-8?B?VWhHYmk5WjgrVTlMR0RPY01YOEJjQXlUOGtVSVEybWU4Qm1JbU9RQkRWTlB0?=
 =?utf-8?B?U2RJRktYR1grMENDK2Q3bTlJMXBZbklRdWtYNkJObEZxeC9nWUVIK1JCaVlV?=
 =?utf-8?B?bHllNWs4Mzc5d1B5NVQ2UWRFMFR6Y1J4M3U4YngxSDZsTWNLcXRaVFd6MkFz?=
 =?utf-8?B?T1Jza01ZcklCTXNlN2dxNzNpNE1Ic1kvYTZjams0TFBvYk5DcEZwYWMvczIy?=
 =?utf-8?B?WGRzWTQ4STQwNWQ4V0gzWjJna1pZdzVaSjB5bVhTWVAxaFRvVUV5bDRmbTkz?=
 =?utf-8?B?eXk3d0Qzb3kwTnVjYUVUVFJHWGEzbWtrbWtGZDVEdkFEc2FKUFMwVFRPSDZF?=
 =?utf-8?B?VWxlWVp6MVBjeWJSV2xLbXJDQ0pRL2FlUTRSSkQ2YW4xWVBTU3NlaStzRlV4?=
 =?utf-8?B?SHBnK3hIYnB4eVpldVhpQlRkM3VGak5WSVl4NHZIOGJhbVVvVXFqRUd4KzNM?=
 =?utf-8?B?d1UxV2ZpTVZNNEt3eXdwdndsWGJwSjUvbmZxVDc1ajUrZThaNUM1YmFEd2JH?=
 =?utf-8?B?dlo0cGQydm9qOVB2bFpYcVdiLytOK0ZxWml6bi9IWW1vTlYvUUFQQXBLWDQ4?=
 =?utf-8?B?WENZN1dldC80VlpLV05GOWtubVp3bEFsY1VLL3p3NnY3N0pOZFhLNTZIL1ov?=
 =?utf-8?B?R1l0akZtU0J1V1dIcEN3Z215bzZNT3N3SDZrU3BBdncwMURHY3JYZDl1V2pR?=
 =?utf-8?B?YjBOa2Y3ckdzT2lWSG1sYVVtcEx4QTl2aE1JYmxVTTBWRkxGOEJUOUE3RENQ?=
 =?utf-8?B?dm1YY244QjV3cWpJTjBrMHJaeWdXd2RKVzRwV05hWld5dnpMakZuRXNiUmtD?=
 =?utf-8?Q?O5wiEb28N+caRlnU=3D?=
X-Exchange-RoutingPolicyChecked: s7gQKpI2oH0QPhmnG3yCnm6Q5J34dwuTcFI4AFezmk5AIZj20oisrcG0ygzfSWSZBeU9B7QvrD5I8EV7MroDi1KDIwx7S1xi/hqd6cc3UArvpJyI5cRe6PTUXzpgQH7HRSZCefEMYuLSweKY1EgclmqND+rjlNZVGMKVYkZHoRnZuT37Ypf0wB/coO+BZK65Q8mBPGyM7k6F/BRraK3I5msvL71NBxQf7W1UlkMNw/OKbvxz2Gb9XXqyFJjgkhQCplL/zpyUKZEp6Oc4DIhbuibY01py0MTMbnxz84ypTqqQ65PnvZY2g23weILXaDD+OxU23YmXIfM0z7d53KXtvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a11a548e-2782-4f12-355e-08df3a467b28
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:30.2064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5cmkMIq80CW1zhLu4YOgq9tjz5Q2WX2DzU3RY621b6mLDwx3pD00v8K3jcdB8BfCFuEL9K7kQQJLKLi9WRuBS966CfRev+/F/HLrvyrrPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB216728
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------OiZ00lEXptqNDXdzNcgayIHn
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/2026 7:37 PM, Vivekanandan, Balasubramani wrote:
> On 19.10.2026 15:34, Sujaritha Sundaresan wrote:
>> guc_fini_hw() resets the GuC on teardown, but it is registered before
>> xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
>> devm actions run in reverse order, these buffers get unmapped from the
>> GGTT while the GuC is still running and may still access them. When
>> unmapped GGTT entries are left invalid, this results in a GuC page
>> fault on unbind or probe failure.
>>
>> Re-register guc_fini_hw() after all the GuC buffer allocations, so the
>> GuC is reset before any of them is unmapped. Keep GuC submit and RC
>> teardown running before the reset, as they still need to stop or talk
>> to the GuC.
>>
>> Assisted-by: LLM
>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
>>   1 file changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 6c35474ab843..14ae73844d76 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
>>    */
>>   int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>   {
>> +	struct xe_device *xe = guc_to_xe(guc);
>>   	int ret;
>>   
>> -	if (IS_SRIOV_VF(guc_to_xe(guc)))
>> +	if (IS_SRIOV_VF(xe))
>>   		return vf_guc_init_post_hwconfig(guc);
>>   
>>   	ret = xe_guc_realloc_post_hwconfig(guc);
>> @@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>   
>>   	guc_init_params_post_hwconfig(guc);
>>   
>> -	ret = xe_guc_submit_init(guc);
> The teardown function guc_submit_fini, registered by xe_guc_submit_init,
> is invoked before releasing the buffers shared with GuC.
>
> guc_submit_fini stops guc submission and also does a soft reset using
> XE_GUC_ACTION_CLIENT_SOFT_RESET.
> The GuC specification says, on XE_GUC_ACTION_CLIENT_SOFT_RESET, the GuC
> revokes the log and CTB buffers.
>
> So I believe, after that GuC shouldn't be accessing any buffers shared
> by XeKMD. It must be safe to release the buffers after sending
> XE_GUC_ACTION_CLIENT_SOFT_RESET.
>
> Did we understand why are seeing this issue now but not earlier?
> Is it a regresssion from a patch, either in KMD or GuC?
>
> Regards,
> Bala

Hi Bala,


Thanks for the review. I did some more digging here.


The soft reset in guc_submit_fini() goes through fine. Right after that 
we unmap the GuC log buffer

(0x1e6a000-0x286b000), and the GuC faults reading 0x1e72138, which is 
inside it.

So from what I see  the GuC is still touching the log buffer after 
XE_GUC_ACTION_CLIENT_SOFT_RESET.


ee460b8855d4 ("drm/xe/ggtt: fault on unmapped GGTT for multi-queue 
platforms") dropped the scratch

page on multi-queue platforms. Before that, this late read just landed 
on scratch; now it faults.

Thanks,

Suja


>
>> +	ret = xe_guc_pc_init(&guc->pc);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
>> +	ret = xe_guc_engine_activity_init(guc);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_pc_init(&guc->pc);
>> +	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
>> +					      guc_additional_cache_size(xe));
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_rc_init(guc);
>> +	/*
>> +	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
>> +	 * so move guc_fini_hw() after all GuC allocations above to have the
>> +	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
>> +	 * Teardown actions that must run before the reset, either because they
>> +	 * still talk to the GuC (like GuC RC) or because they stop the CT and
>> +	 * submission (like GuC submit), must be registered after this point.
>> +	 */
>> +	devm_remove_action(xe->drm.dev, guc_fini_hw, guc);
>> +	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_engine_activity_init(guc);
>> +	ret = xe_guc_submit_init(guc);
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
>> -					      guc_additional_cache_size(guc_to_xe(guc)));
>> +	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = xe_guc_rc_init(guc);
>>   	if (ret)
>>   		return ret;
>>   
>>
>> base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
>> -- 
>> 2.34.1
>>
--------------OiZ00lEXptqNDXdzNcgayIHn
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/2026 7:37 PM, Vivekanandan,
      Balasubramani wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:at9epeRtNe-eKEdY@bvivekan-mobl1">
      <pre wrap="" class="moz-quote-pre">On 19.10.2026 15:34, Sujaritha Sundaresan wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">guc_fini_hw() resets the GuC on teardown, but it is registered before
xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
devm actions run in reverse order, these buffers get unmapped from the
GGTT while the GuC is still running and may still access them. When
unmapped GGTT entries are left invalid, this results in a GuC page
fault on unbind or probe failure.

Re-register guc_fini_hw() after all the GuC buffer allocations, so the
GuC is reset before any of them is unmapped. Keep GuC submit and RC
teardown running before the reset, as they still need to stop or talk
to the GuC.

Assisted-by: LLM
Signed-off-by: Sujaritha Sundaresan <a class="moz-txt-link-rfc2396E" href="mailto:sujaritha.sundaresan@intel.com">&lt;sujaritha.sundaresan@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 6c35474ab843..14ae73844d76 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
-	if (IS_SRIOV_VF(guc_to_xe(guc)))
+	if (IS_SRIOV_VF(xe))
 		return vf_guc_init_post_hwconfig(guc);
 
 	ret = xe_guc_realloc_post_hwconfig(guc);
@@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The teardown function guc_submit_fini, registered by xe_guc_submit_init,
is invoked before releasing the buffers shared with GuC.

guc_submit_fini stops guc submission and also does a soft reset using
XE_GUC_ACTION_CLIENT_SOFT_RESET.
The GuC specification says, on XE_GUC_ACTION_CLIENT_SOFT_RESET, the GuC
revokes the log and CTB buffers.

So I believe, after that GuC shouldn't be accessing any buffers shared
by XeKMD. It must be safe to release the buffers after sending
XE_GUC_ACTION_CLIENT_SOFT_RESET.

Did we understand why are seeing this issue now but not earlier?
Is it a regresssion from a patch, either in KMD or GuC?

Regards,
Bala</pre>
    </blockquote>
    <p>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Hi Bala,</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks
      for the
      review. I did some more digging here.&nbsp;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">The soft
      reset in
      guc_submit_fini() goes through fine. Right after that we unmap
      the&nbsp;GuC log
      buffer</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">(0x1e6a000-0x286b000),
      and the GuC faults reading 0x1e72138, which is inside it.&nbsp;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">So from
      what I
      see&nbsp; the GuC is still touching the log buffer after
      XE_GUC_ACTION_CLIENT_SOFT_RESET.&nbsp;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">ee460b8855d4
      (&quot;drm/xe/ggtt: fault on unmapped GGTT for multi-queue platforms&quot;)
      dropped the scratch&nbsp;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">page on
      multi-queue
      platforms. Before that, this late read just landed on scratch; now
      it
      faults.&nbsp;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks,</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Suja</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:at9epeRtNe-eKEdY@bvivekan-mobl1">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	ret = xe_guc_pc_init(&amp;guc-&gt;pc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&amp;guc-&gt;dbm, ~0);
+	ret = xe_guc_engine_activity_init(guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_pc_init(&amp;guc-&gt;pc);
+	ret = xe_guc_buf_cache_init_with_size(&amp;guc-&gt;buf,
+					      guc_additional_cache_size(xe));
 	if (ret)
 		return ret;
 
-	ret = xe_guc_rc_init(guc);
+	/*
+	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
+	 * so move guc_fini_hw() after all GuC allocations above to have the
+	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
+	 * Teardown actions that must run before the reset, either because they
+	 * still talk to the GuC (like GuC RC) or because they stop the CT and
+	 * submission (like GuC submit), must be registered after this point.
+	 */
+	devm_remove_action(xe-&gt;drm.dev, guc_fini_hw, guc);
+	ret = devm_add_action_or_reset(xe-&gt;drm.dev, guc_fini_hw, guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_engine_activity_init(guc);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init_with_size(&amp;guc-&gt;buf,
-					      guc_additional_cache_size(guc_to_xe(guc)));
+	ret = xe_guc_db_mgr_init(&amp;guc-&gt;dbm, ~0);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_rc_init(guc);
 	if (ret)
 		return ret;
 

base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------OiZ00lEXptqNDXdzNcgayIHn--
