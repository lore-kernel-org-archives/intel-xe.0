Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD461606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L473w+oG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57810E5D2;
	Fri, 30 Oct 2026 22:46:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDDC10E25E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793400387; x=1824936387;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m/ryueOyNlQXwZbT5n+FH0hElUDI9FGEruY3hsSj+8I=;
 b=L473w+oGt8VNXZMxuJiFA0Mrf+Pc+3G2TfmySImUa1kdcbe6+qc7SYrD
 xdhDD53nfUlV0zbkuPRZ5ZuJ7iNxEBzNa5Yk+Gtcz4Ev7FhXJubNL+SIK
 wQBe/SX8eRH6jdA1XBvMyJGtRw4L0oC5tGFWUefiv9gbG3lUZkzz0DBSD
 GVJy5KcX38QLYar9Ux+oedm5fv39Or+y6lvwJpnydUoEJFIiUzOtJBNaB
 piD7N/d6v0Hql1+be4TcxVPw4p9kB9itWAy29SLlxt6CXk32hGC01PXBh
 vlECcB3Aw589l5ev217W0r7BsA8gTLzvXRDq8VuwtzIwCc3CS6cdSetgE Q==;
X-CSE-ConnectionGUID: xDihMOqETMq1iIRzZUwhmA==
X-CSE-MsgGUID: VPq8/CkcQ1CyEQmZzo+pmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2053839"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2053839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:46:27 -0700
X-CSE-ConnectionGUID: 5Kruc+ftS9WjqsnOUTPBQA==
X-CSE-MsgGUID: ozhSqtwRQTaRbznrUQ2CQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5568631"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:46:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 15:46:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 15:46:26 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 15:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaNnAqYTkp6yVn3wR/TFp+BQ+A2KNRgMfzJW8B1f57jan3y4MSFsBx6H02xPb9OzQMOFJfEGXYiN+ZECiEzY+4enGz9SK/rW1rB4pTHkllseN8+9o3J34ebs8WTnAVOvmpcJ8UgnjqQuuZeyGMNVGIw75PHQ5re4px9/zjqNp3hupA+tyF+E07CIDJ1csJU+cjs/Z0BMg8MEHUNB6Ca24Gt9BNUV3LcncloRdOlM+U9AuTJEP3EZSlH7FIovCk3GZEb2zH1p9PttQqYzoG0afxvV9H/xgBt90G2MFa/Jy2xanF6LasguNOC72Rcnnkg7oX/SfCHvdkTBxoWRQ39MOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bodg46Ly0aQ3MEoc5ZKLIuuY7tD55xaKUbBzM5Y3aWE=;
 b=vxIANSe4pfjfwUFGhcK73cBMH4u/XsTGgSrE7MtmoAWO42ZF2UCCB2AU1UxLFWgDDSc76ru16rXlD5WxsQsg0gNIKhlRHo6ynR1uXMq72y5Lu1uqwIal8hTfyYknzSgBV10KKkZAC5qrWSFXAu2Cxzq+Xzxitm56Pv3RId5YQPBwD/asDDIfGcSfbKROK2PfWLce6woVXYHToNloxQikMgTFzi94LtezvXR9cvtrjtQoCXVrRj8doCTXC6HqsS6xEbNdNLq8j4t2adEbwJnUT8Fk06b9zJh9YBy+m3qmHjEJT8AMoL/jM57uM8nkMssMDj65kojZxUPL9TMilFxnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 22:46:16 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 22:46:16 +0000
Message-ID: <b623c308-ea2b-4b34-9a5e-db1fad870c16@intel.com>
Date: Fri, 30 Oct 2026 15:46:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
 <20261030144547.2532309-12-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261030144547.2532309-12-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0048.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::8) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ea74d7-10f2-4097-1d76-08df36d79b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|261028144727099003|11063799006|4143699003|261009221227099003|261009223027099003|261026140227099003|261026135527099003|261026130827099003|261026121527099003|261022105027099003|261021123027099003|261022115727099003|261021121427099003|261022075727099003|261021130227099003|261021133027099003|261022113327099003|261021135927099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Nb5ULwGIfHClwexfs/TXsDT5O0T2yYXC3nxfniYgxSM7gQ0zQHeJ4oSzfu1FKaaAOlZtpq6+/KLQ2UxUZWtEc+dCUc3I6TjEkZWMlg7GsJmi/U3vzUWCjPkNyxIPFmBPDNFbE/2M22j8tWEkGNgbdW8d3wS8IBCq5QFQrvZpUeFq18kkF0dz4tl0P2C7T9YLKgjFm+lBYYmNRqWBbZc/O0Wfubuyq/ZESPA3dpxzL1XjsR75/4HxCmISl1QnVLp8sEKCsCLKQ1PKvC8EtxJEHp4E359SI3XRcQfZ6K+YA/nK/M6OylvxEd3PX9SE6sNEptz0FH96R51aD7cYpESKS5TTN7KWxUEYN6oTeZx/8ZbPhpD7eS8Lbi71kqN3yPB2WP9yq9/c5bAbWMt2SibMrPyvVae58jb6WfXnCInr4UrCqyMlVcBPSRGzdA8SdppO9dCxSBV86a/1KkrFpRTlkD+cOIIvqxF+fgMjZyucMLdP66RPC2vQzt99M01MsK6IjGFGLhHo3ktCmWuJwTWC4lg0544bgN2lMR02zVF1gJ/vbCwL+gV3jfO2wwueUzRs05/YeHFXeHU+JWzMJAJBWxu+AuiB4SWVJvfejGIo2r1yS+PsaLc5WtGQgeTYEnEe/nFy1tFcHOjCeXZxBkrg9qcTwDvvl6Uw6eEP9V9uunU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(261028144727099003)(11063799006)(4143699003)(261009221227099003)(261009223027099003)(261026140227099003)(261026135527099003)(261026130827099003)(261026121527099003)(261022105027099003)(261021123027099003)(261022115727099003)(261021121427099003)(261022075727099003)(261021130227099003)(261021133027099003)(261022113327099003)(261021135927099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qyt3b3Qvb3Z0NmUvdDVxZGdEQ3VLanVpWi9JT3p0aHB1dDhBVkRlK1NSVUNE?=
 =?utf-8?B?K2h1UWlRNzRUNEkvaEdjYTRvNllLWlYwWmRrVHdXZWV1NGs0aGNVWE5pODcw?=
 =?utf-8?B?c2ZRblg3UTN5SEZwNU44YzZiQzlKOEI2VU10aWhzZGw3cVdMRG1HdFNkSXJI?=
 =?utf-8?B?aCtUSTBtdGpxOEFYNlloODRDNFFyNWh5ZzlUTml4MWF2YllKcVFrN0FLeVBO?=
 =?utf-8?B?VWJnOFlsbFdHZjBidFpOQzdGa3J2MElHaFBuYW5vdktmcDhyM3A4MFZiUVNq?=
 =?utf-8?B?NXQ2RE96L1R0V0E5VEVseEtWbGVsaDdHV2JEYmF3SWtpdktDZWVCUjZYQ3JU?=
 =?utf-8?B?cVdLMkRENFB0ZGlzbHFJYUpnL2g4Vnc2R2VaeTZZUUx5NElQaG1QRHR6ZEJQ?=
 =?utf-8?B?VVJtTDJINjRMcVBXVGViVU1sR1VEM0FVdzZnSTVFL29pVUs5R0J1ckwzUmxU?=
 =?utf-8?B?SHA0RG1TUnhGbVVHbTdiUEdpSk51bkhLMnM2Qk1sTW1zWDMzcGVLMDFEWEY2?=
 =?utf-8?B?MnFyU1owaGpVWXc3MzBsZ0oxR21BSm1iTk1ra21vbVJrMVprWkN1bVBzVzJS?=
 =?utf-8?B?dUpxcllySzFWTFRwRUVyaTZIaTdFNzVRS0dHbVpOWnB3L2dOMUs4S3JEUEEw?=
 =?utf-8?B?ajFNNkNoWmVaTGZ5QWJGWkFBaVV4SVVkMDRIMkFLZ0dwbVRiL2k2cGRkMGpp?=
 =?utf-8?B?RnBFUEt3anpaUk53R0duQ2JXT3pUdnBrNFd0LzVNRDgzVW1Yc3BoYXRJOC9r?=
 =?utf-8?B?NC9NY3RZQTEvQVkvcWh2cGZCVGQ0MGZqR3AxdnVQL1FtRDRvNDY5MWhkeE1x?=
 =?utf-8?B?MUxaemRDVDdhd3lRYzQxbkkyMUQ4TnZVQnNycGRob1Ftc3Y4a1djSUhuZ3o1?=
 =?utf-8?B?aW1qYXF0WTROMGdVRjlPVlY2SVMvUVpzcWQwWDJpVUxlWEpCSnF6VGpaVHli?=
 =?utf-8?B?d1ZybWdmdVRJaWt1ejF5RzV5VmRic1pUZjZmbjdoQ21xQ0tQY29EcnBhcWtr?=
 =?utf-8?B?TWZuSGtBVkg4bmlVK0Rhd2pQRnk4Vk91VjJDaDcyaEdpRHZhWkpGaEI3dkJp?=
 =?utf-8?B?ZkxiNnVMUnpENUxqbk5HVjQ0cTdOS0V1WHFtamg3MTV0UHFMRkU4V1VsRWRT?=
 =?utf-8?B?dE9pSTJjRnFtNjBsbVRvajNIZEE2bXV5SW92MDJ0ZnJaemxabW4xay9ZTU5T?=
 =?utf-8?B?TllveUxoRFdvK2ZFb3EydmhRSTdMWjh0ZE5Ya2N1aWtHd1pmYVpsUXpkY1J1?=
 =?utf-8?B?eWRiZ0NVb1pFKzIyWDhhUTFGc1lLZTMvVXpXRmx2cDY1aUVPZkplYVR2R2ti?=
 =?utf-8?B?aE5FNFVsVGM2WE4wQThneHBWbEMvWER6UmlsTVl1NFJEbUYwajN1eUhZVi9K?=
 =?utf-8?B?VUd4QVJQV0NOQnhQai9DMzB0L3VyZE1HMjdUQnZGM2tlOWlaTE8yU24yb2h4?=
 =?utf-8?B?YmFBdHpJL202VytqM1VQSUtrcEo5RkRXckdhU2tWZ3dScTY0TFJqLzcra0Vj?=
 =?utf-8?B?UGNJMUhpeDluNW8vYnJXSEc1dEtVa3N3ajB1UFhVUlo2QnRUOUFMZjQwb0V4?=
 =?utf-8?B?alArNzZPOTllVFI2MlpMNTVXanR5elhrdm8zRWRRSXcxeTkwMlhZSjlPQStW?=
 =?utf-8?B?UkJtT1Y2OWRiNmIwSm1hY3NXc3ZlRFc3MFBXeUFnQ3E3VEFMN1B4VFdoMEEz?=
 =?utf-8?B?UEtTQ2taeVdlUTJyWmJFOGgyVkZjek5QMU8ya281TGtYd05jNUs0Z25HaTM2?=
 =?utf-8?B?b3JVRUJvdDF0RDZJekhNNTFtOUZMcXRleXpKYWJwZzk1cTJuV0dUbithZTd3?=
 =?utf-8?B?TDlBc3ZLMk12Q0t0UngrMHhxOVkwWXlJTzlyMm1HSmlSRTJxWWhsbkxNR0ZZ?=
 =?utf-8?B?TGgrR0ZsQmJ1dG1jU0NuMzdQemZ3MDBIZkllZ05uUlZvTmhMc0xIejE4OUxV?=
 =?utf-8?B?TTBtYXJpWWladVlPNVBsSUx6UGhBZDV5Zkl2TGU3U0paM1ZLNHZKVVkzRURv?=
 =?utf-8?B?RmRvQm1hMDdtekFvb1ZPVnBvQ2FIYXV4NmlsQ1o4UU5WYU4ySmQ5aFBNcS84?=
 =?utf-8?B?RmM4cmUrUXg4Uzd2TnVxbkxGdWZqOWpvREF0UlliREQ4cXd1ZW81cDJTQXZF?=
 =?utf-8?B?T0w4QlhQS3NpdVRGTTRkbERCeGUrWmlsM2RZdzhvVEtTMlZqVVNUbFhQWmZa?=
 =?utf-8?B?L1Rud1g3bk8waU9MRERZYitFTi9qVCtIQ3N3eWdoaFRLTFY2YXFoem1YUnB6?=
 =?utf-8?B?ZFhqa1dhbHU0elRMMEQ0dFRDQ01TSFFidGpzOUxPT3R0M0UwZlBmQ1BGY3kw?=
 =?utf-8?B?bUU5WVVKOXQvZ1l3UkRNYUkrTHVrY3AvUm96QmVySmhhVjBhdWozOTRsWmFk?=
 =?utf-8?Q?e2hKbF6/zhelShlc=3D?=
X-Exchange-RoutingPolicyChecked: OFl94MZYOW74BqdcOVAg3da5uHuSQdKSgQALD9Xzkjlll7Qtd5HXu4zKCjinI4amqZEMAaxZpH737KMadxxkCaZuPr0avwq9TY26ozsNgn7j1bRKNaDFjDqMFZH7+xD39T8/d4oFBpHzKvuK6cyXvR4RJRTV++Vndt0U10Qz+0ib+4n6BL9i2pvZr0cYh9imjzHeFNkR4rQHlivIusr/y0xWNw9ZwsPekVbWqDFqczM692tl6Q/W9hYgmEWG1DPhR8lSAAW6IVmQRgkV5y8Hm3gTU50zbjTLG0PHVLhaRFoyEu3QHIvZ4SRA0vWjNiS6BhfUdF2/eED0XTU7bSizvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ea74d7-10f2-4097-1d76-08df36d79b74
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 22:46:16.5179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xieK8i+i4/Yj671XS9263RXTXcawKUQHJkBQWwwe4vZfhQmOXSz7D3ux8uyIwjhL+grgTU1gtCyiwGUHw4RF7ZgJrdT5FM8VVgUK+2RTgcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/2026 7:45 AM, Badal Nilawar wrote:
> Enable loading of Ocode, the legacy OOBMSM firmware, through the
> late binding flow. The payload size check is no longer needed as
> late binding supports larger payloads.
>
> Ocode may not remain backward compatible across IFWI updates. Query
> the SDK API version from the System Controller mailbox and load the
> corresponding xe/cri_ocode_<ver>.bin. Skip loading the firmware if
> the SDK API version in its manifest does not match.
>
> v2:
>    - Make sdk_api_version part of ip_specific_data union (Daniele)
>
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Please get an ack from a maintainer if you want to merge this ahead of 
the FW being published.

Daniele

> ---
>   drivers/gpu/drm/xe/abi/uc_fw_abi.h            | 11 ++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.c          | 48 +++++++++++++++----
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  6 ++-
>   drivers/gpu/drm/xe/xe_sysctrl.c               | 32 +++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 12 +++++
>   6 files changed, 97 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/uc_fw_abi.h b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> index 198e949660e0..59699ba4def5 100644
> --- a/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> @@ -316,6 +316,11 @@ struct gsc_cpd_entry {
>   	u8 reserved[4];
>   } __packed;
>   
> +struct ocode_manifest_data {
> +	u16 sdk_api_version;
> +	u8 reserved[22];
> +} __packed;
> +
>   struct gsc_manifest_header {
>   	u32 header_type; /* 0x4 for manifest type */
>   	u32 header_length; /* in dwords */
> @@ -331,7 +336,11 @@ struct gsc_manifest_header {
>   	struct gsc_version meu_kit_version;
>   	u32 meu_manifest_version;
>   	u8 general_data[4];
> -	u8 reserved3[56];
> +	union {
> +		u8 ip_specific_data[24];
> +		struct ocode_manifest_data ocode_data;
> +	};
> +	u8 reserved3[32];
>   	u32 modulus_size; /* in dwords */
>   	u32 exponent_size; /* in dwords */
>   } __packed;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index c5f3a3b8d404..b62a4c15c738 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -17,6 +17,12 @@
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
>   #include "xe_pm.h"
> +#include "xe_sysctrl.h"
> +
> +/*
> + * TODO: Add MODULE_FIRMWARE() for xe/cri_ocode_<ver>.bin once the
> + *       Ocode firmware binary is available upstream.
> + */
>   
>   /*
>    * The component should load quite quickly in most cases, but it could take
> @@ -33,10 +39,12 @@
>   
>   static const u32 fw_id_to_type[] = {
>   		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
> +		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
>   	};
>   
>   static const char * const fw_id_to_name[] = {
>   		[XE_LB_FW_FAN_CONTROL] = "fan_control",
> +		[XE_LB_FW_OCODE] = "ocode",
>   	};
>   
>   static struct xe_device *
> @@ -104,6 +112,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
>   	manifest = data + offset;
>   
>   	lb_fw->version = manifest->fw_version;
> +	lb_fw->sdk_api_version = manifest->ocode_data.sdk_api_version;
>   
>   	return 0;
>   }
> @@ -324,6 +333,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	struct xe_late_bind_fw *lb_fw;
>   	const struct firmware *fw;
>   	u32 num_fans;
> +	u16 sdk_ver = 0;
>   	int ret;
>   
>   	if (fw_id >= XE_LB_FW_MAX_ID)
> @@ -346,9 +356,23 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   			return 0;
>   	}
>   
> -	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> -		 fw_id_to_name[lb_fw->id], pdev->device,
> -		 pdev->subsystem_vendor, pdev->subsystem_device);
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
> +		/* Get SDK API version */
> +		ret = xe_sysctrl_sdk_api_version(xe, &sdk_ver);
> +		if (ret) {
> +			drm_warn(&xe->drm, "Failed to get OCODE SDK API version: %pe\n",
> +				 ERR_PTR(ret));
> +			return 0;
> +		}
> +
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
> +			 "xe/cri_ocode_%u.bin", sdk_ver);
> +	} else {
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
> +			 "xe/%s_8086_%04x_%04x_%04x.bin",
> +			 fw_id_to_name[lb_fw->id], pdev->device,
> +			 pdev->subsystem_vendor, pdev->subsystem_device);
> +	}
>   
>   	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
>   	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> @@ -358,17 +382,17 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		return 0;
>   	}
>   
> -	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
> -		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> -			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
> -		ret = -ENODATA;
> -		goto release_fw;
> -	}
> -
>   	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>   	if (ret)
>   		goto release_fw;
>   
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE && lb_fw->sdk_api_version != sdk_ver) {
> +		drm_warn(&xe->drm, "%s late binding fw: SDK API version mismatch %u != %u\n",
> +			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version, sdk_ver);
> +		ret = 0;
> +		goto release_fw;
> +	}
> +
>   	lb_fw->payload_size = fw->size;
>   	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
>   	if (!lb_fw->payload) {
> @@ -381,6 +405,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		 lb_fw->version.major, lb_fw->version.minor,
>   		 lb_fw->version.hotfix, lb_fw->version.build);
>   
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE)
> +		drm_info(&xe->drm, "%s firmware SDK API version %u\n",
> +			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version);
> +
>   	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index ee5efe60774e..c7b3ffc743cf 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -13,14 +13,14 @@
>   
>   #include "abi/uc_fw_abi.h"
>   
> -#define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
> -
>   /**
>    * enum xe_late_bind_fw_id - enum to determine late binding fw index
>    */
>   enum xe_late_bind_fw_id {
>   	/** @XE_LB_FW_FAN_CONTROL: Fan control */
>   	XE_LB_FW_FAN_CONTROL = 0,
> +	/** @XE_LB_FW_OCODE: Ocode firmware */
> +	XE_LB_FW_OCODE,
>   	/** @XE_LB_FW_MAX_ID: Number of IDs */
>   	XE_LB_FW_MAX_ID
>   };
> @@ -45,6 +45,8 @@ struct xe_late_bind_fw {
>   	struct work_struct work;
>   	/** @version: late binding blob manifest version */
>   	struct gsc_version version;
> +	/** @sdk_api_version: late binding blob manifest SDK API version */
> +	u16 sdk_api_version;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 4067e1dfdcd5..27a59e8e4487 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -217,3 +217,35 @@ bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>   	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
>   	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>   }
> +
> +/**
> + * xe_sysctrl_sdk_api_version - Get SDK API version
> + * @xe: Xe device
> + * @version: SDK API version
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version)
> +{
> +	struct xe_sysctrl_sdk_api_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_SDK_API_VERSION,
> +				  0, 0, &resp, sizeof(resp));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return ret;
> +
> +	if (out_len != sizeof(resp)) {
> +		xe_err(xe, "sysctrl: unexpected SDK API version length %zu (expected %zu)\n",
> +		       out_len, sizeof(resp));
> +		return -EPROTO;
> +	}
> +
> +	*version = resp.sdk_api_version;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index b69a3f474236..c0b6d4330c88 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -22,5 +22,6 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>   bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>   bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
> +int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 1f3f782d770e..cdacceebca06 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -57,10 +57,12 @@ enum xe_sysctrl_gfsp_cmd {
>    *
>    * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
>    * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
> + * @XE_SYSCTRL_CMD_SDK_API_VERSION: Get SDK API version
>    */
>   enum xe_sysctrl_core_cmd {
>   	XE_SYSCTRL_CMD_LOOPBACK				= 0x03,
>   	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
> +	XE_SYSCTRL_CMD_SDK_API_VERSION			= 0x06,
>   };
>   
>   /**
> @@ -126,6 +128,16 @@ enum xe_sysctrl_fw_status {
>   	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>   };
>   
> +/**
> + * struct xe_sysctrl_sdk_api_resp - Get sdk api version response
> + */
> +struct xe_sysctrl_sdk_api_resp {
> +	/** @sdk_api_version: SDK API version */
> +	u16 sdk_api_version;
> +	/** @reserved: Reserved for future use */
> +	u16 reserved;
> +} __packed;
> +
>   /**
>    * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>    */

