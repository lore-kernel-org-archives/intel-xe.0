Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4EFFF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 08:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6410E320;
	Tue, 28 Apr 2026 08:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR2lSsJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42410E31F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777366619; x=1808902619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hGvV0DNuVmuzfQxkGQvpnByykQ1j5IUaLQnxLZIaU7U=;
 b=cR2lSsJ3JDpSGH4VhfRbzij7qO4l11BkuFd/1ixPlG7d2Nbfrf3ovM8k
 nOnDAexRBnkmAwmiZ62JtvAmRVIzdcJ8PwM0UHc6SBrRVWg1yW4vdABxX
 AtOfstshuxUXZs2e5bLj3RLCcyeT2paYP+PNwnVPvGoUMhRuhUAtM5/+X
 K/QiXOZnW7AhqzE4SKE5T+BTpbZLbiIttFUk2VKFcAtbzZ8UNWP6tBL8r
 jduaxq0QPMduB/F8anjbra0294YZWv8u0Nj8GzKrOiHl4anSHV9PHSlVv
 qi0vOlaOi4hxVvEkIGF4WUfAKF2EKVhJmZcLAwm9F2rjmBZpaWJkz8ueE w==;
X-CSE-ConnectionGUID: VMMZT6YUSGitQ8jClZmnbQ==
X-CSE-MsgGUID: bvRql4v8Tqihl4XxoK3upw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77973881"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="77973881"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:56:58 -0700
X-CSE-ConnectionGUID: Lw/eNJRqRMiu5tbw+MmQog==
X-CSE-MsgGUID: jBVJmeoZRAi2czq+g310MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238880589"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:56:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:56:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 01:56:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dd7muLxdNwqG3c9pJIPemsfhXUqppoAnxr7A1fFO8NVVPs9/GMNISOf35L7+jeZPhElr7xBX9O6PGUYdSrKOtpwofUM4uxiHIK0H+lPgTpJho9BCU1SSR9em0MaEaY9L95Fo8mLZC+BSZ6QBrNn1GI1XQo9/Z03Bjg5AElG2l6MTfgxFPL6ywu2sc8SwIOVFb4WHwMs1sVuE/tNWBWa4nUI7P9vit5WEM9mIbpkIARdwbwn1kYtOyE3rAbBkN2s3R40Rjpv/kBpa5x24CZqCVr7ohl0jMswd6oTl4OpA+4uuvn4Jt1D0sDO47aKJAjCfyNQEWVgAXqc+J7Fd7Gq/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AD5HsfKBU8ZfQzoTEChtfZKJu3dSSNVy700K0WjIQE=;
 b=SalVOoIBkgnOHxtIXtB5E5cOClKr3YOFpXEUiC5xytnf/Il9ejWld0vbfj/qemPJsE1SfbRuffhJJiupjZ5efdAZ6Ni+gGzVM9xaFV0lIfusoLaUN1JJ6BaEG10ot7WCQAjYUdidikTvofbzcToKnWvX9W2FF3B5MXR3BcXacMhj7IAPJtIgmumSNgx2Nkv+5pt8HvKARBiyRa9YfaLfL5Vi+J4BcstL7L41+Q4jVZRJHF33Pun1IbNAFW30Pb5nIiT7tdFYGoTjRVJtkcCjak/Y4TUv2j+4VQIyyxZQ1wq3F2lyfKIIrpVb4bVSrSvesPJTpOiFuCps47HLXpQEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 08:56:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 08:56:52 +0000
Message-ID: <b77fd9ee-0450-46d3-a038-df0c26a44608@intel.com>
Date: Tue, 28 Apr 2026 14:26:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260423173925.699486-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae8916e-9087-4e31-d47f-08dea5041715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: yHghvJunePSFhKsXnqjow0s5QDmyliUX+QYp1GvT+0713Il+YurLp0xp9TIZmhP8EGMX9xFJMXTWWJleMw1sDffNgWQqjouBJrRdmApAnP9OuSF1lzwFkkSBTojBZIij9rNwxs1C0mniBPcIGlrLBtQLwBLi1RubCLS6HTlaOEfWI/7zpt9VD67j49OQhO5240Ft7PwcBzhtv5zD2uGS5vSjJIisFTKbqweMpV91kwdgynab4M9j3lzZtAdsd1xRukUIvwKEy1Q0i0pXfb8B6KtcJjpVMtprnrZTiiDD2bn9X/3JcB6U8761MHoWhBsavP+W5R7xwna4F9+9BdJa2B0mk7aY0PbANUsStE+AlgZh24gQQ4BbR9+T+YqpIJoN2Q4B21C39AJnBzPxoiXVw1k2YNOOHN+xqW0TDIGsYav04x4XGro1iW3KQl+e6lSD+UDLSwZfiQ1zmFBZXT3D3aLz/Ra6KLnTZ86btFBgut6MIsJB2sehMWIopb6aeseHWKAiQd7NEeNplGTdeAN/gJHdrQmiIQz16d49GHAdSRoJrEOsGo8pCeTYDZ6mi69sD9MXLwkahiBuIFXTPuKQimXO8MRMGIF2w/6XdCNoKUy95yp60pShlRdM3a3eo9eIWY4pRJ0r3PZP6gP70eYDMnXHIhw47X1RRHihTJxhndcA649j78aqpDxW1ZyHyF4pJV8EcKT0Z+Q9yNjCOSVPXd1OroSPjWfSClIY/5oQ18RXOqIv0g2J6bpZSilkjJAI+9AC4+OxFUL3QEMjP6E8cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0Q5cjRBVytmQlNpUUFaK0F5d3RoV1lTL3hWQzFjaWM4SFAxazZ2cWJINC95?=
 =?utf-8?B?d3AzQ0pXNEV1bCtqOW95REFnOVUweDlOV0JUclpCcm9hbC83MnhEMG1xelNW?=
 =?utf-8?B?YmNJbTYvMkZCSjhqSUp3ZDVHWXZ1a3krbyt6YmY5TTgvT0hrYXFCdjBmTEhY?=
 =?utf-8?B?dnErbklKMzM3eWYxUkR6dFN5UkNodjJKUEdDR094S2Q4bUxHRnJOYWFQUFZW?=
 =?utf-8?B?VElyOUVwOXFqRVBnWGUyNWQzSFJod3Z1MFZsMXNjU2JrN21CN1BZcEFFSlo3?=
 =?utf-8?B?dnNJSVFrV0swdnZEMkE4TUYzNVBsYkpiSTduZmt0TU4weVV2T3EvU2Y2V201?=
 =?utf-8?B?bDJhaitraWNoTnpiRlVHN0ZRTmpFSWJOdlBCMGI0K1RXRGpReEI5UVhBdFh3?=
 =?utf-8?B?VncvMWd6dE9qZ1czNXVDT0wyWWROb1htQUtaSEdhOE1QZU5XbU8vSjdKU1Jv?=
 =?utf-8?B?Vm5nelJkYXRDZFlQS3E1ZzhFaU5Qd3QrTzJtUjJNbEdZN3IwbTdXbkc1RXlv?=
 =?utf-8?B?akpNR0FTOU94SWtmb3gxb3J1Y3B0cWxFSm1mVWxvcWJYWDB4dXdjYTJaSmF3?=
 =?utf-8?B?ZXBBMkJqYkZDQy9iaG9sbGhhVkw5NXZweks2bGdjelFVNi9xK08vUUFpSUkx?=
 =?utf-8?B?Q1FMcnRmVUVTVTc5eVV6SnVXTlU2K200R0wrUjVUUHZTWThtOGtSQnFCRVk4?=
 =?utf-8?B?V0F6emQxMm1TV0l3alVURk9lSHN4TytYNUFNQ2VqSEdkVm1kVE1YbURuOHor?=
 =?utf-8?B?K29oN0VxQVNTdjhBUXR2SGIzSkF3ZFYxSGtaT3RueTg3UkluUVRxWjBlWk1K?=
 =?utf-8?B?ME5mRWY1RWRlcGVRa1VHemh1SWJrZkhhVHhZSTNXQTh2bkhzbHprVmVOaDYz?=
 =?utf-8?B?M3BGNytxejJxWlViUTlZV0UwNlh5bDlxZ0RUOE16WGV0T3dCMFNvV2NRaExq?=
 =?utf-8?B?ZzE4MDdpNDJlekc4UlhpNlNxTndkTHgyL0gvTjFmNE5ybnhCSVROZDF6WGR4?=
 =?utf-8?B?dENPUXNVeGFLMFVrZ3pRSzd1UXkvSzZBNDFWYm5vMWRIeWtMaFY1eWNBby9o?=
 =?utf-8?B?a0pIRlZ0REFVYmU4aEkySmJtd1h4TW9XeDltdkZJaFZ0WVFRWWltNmdxeEIz?=
 =?utf-8?B?UEdGbWwxUm02Q2JLcUp4S0VsRmVSa3dVRUF5eERwSWx6Ky9KWWtvdlozczlJ?=
 =?utf-8?B?M1FZRS9oSUtNcWhzNFNzUFBTWGRLbTl6emozVDl2YTU5U1VlbjdldWNEemVP?=
 =?utf-8?B?aG9hMDVqdFZqZ0JnNnVOQ29jTUgrRVpLZjhsa0N1KzlkeUtPbzY1THlOT0M5?=
 =?utf-8?B?aVRkQldTMWkzdXhEc0QvWnhEdEszVHVlMEpMc0tGTXlUUmNrdzZURU10emVM?=
 =?utf-8?B?YU1IbmVlaEY5QUxjRTNiejhBemloUHVENklmQnc3TktWNFQwUktBb25YeGgx?=
 =?utf-8?B?Q0dMUExZQmVkM3F0VUk5YmVtZEdidFdzc1p5c2IvOUxqR3lzcGMxRk1IZkpo?=
 =?utf-8?B?cmJDRzNSOVNLRjk1MHJWcXR6eXFMdVVuUzRkRXRvR3hsQm1MMDBmcFJaNnVQ?=
 =?utf-8?B?d1dkY2ZZbnh3YnZLV2NkLzg4aHdTZjdHNmJKdmNaeFNTbGg4eWl2dDI5VzNs?=
 =?utf-8?B?T2dzZmlLd2I2TXpVekRqU1I4aXNZOHdiS2RueHB0STlwU3oxT2tzVVZHT1Jv?=
 =?utf-8?B?cG50VGxFZWpzRUc0RlNrYkJzeTd0WVhEamRGNjAwRVlnZEtkZUhIU2FwSmpl?=
 =?utf-8?B?RUtWR2JwZGpGYURkcW5hdVhLT0M3TjlXZWFmRHo4WWZRSisyd2RpeEh1bnpU?=
 =?utf-8?B?STVWQkRWRkpKaklsakZ2WlVZT2YyWTlEckdGRzczVVYrdnoyeGtJL1dSdGdI?=
 =?utf-8?B?K2xCT2Q5bjE5ZDNCTDBQcTFRbnZSRURHOHBBeEtVSHFMMXNBVENwalgvN21z?=
 =?utf-8?B?ZXVNdWpZd1JXQ1UrVHd2YjdKTnExYTNBM0xEcEtTb0xyVXo4V09EQU1EUVV5?=
 =?utf-8?B?Rm9aZS9jc0NHSjc1N255cVFtLzBhK0IxTFg4TFl1NGczeXhOMGQ3OE5jdWl5?=
 =?utf-8?B?RmN4cGZkQlJyWWxPMm5CbGM3cEJSS3Q2dEtOeHJkVzZWdkswMlpnTkNEVEVa?=
 =?utf-8?B?NDI2MTFNOXIyeHZrbm45a2N6WnNLNDVRT2pCK3NSSTJZWGJZcEx1V0tuZnBT?=
 =?utf-8?B?S2RhQnMyaGVYOGFDc0xzTGFtMDMxVkMyS1lFYUl3V1A2RG9yTVFpNUZGc1hx?=
 =?utf-8?B?YnBVYXZWSldFdlUvZXhwMXRwUmVVT0RkK2ZjN0R3WDF4aGdROHE4ZWFTSkhH?=
 =?utf-8?B?UnQ1VEtPMEJRekJGZmdnRkZZTUNNNVZ6TDZ4R2k4RWJFcXFjYlRtUT09?=
X-Exchange-RoutingPolicyChecked: RfObUYJcwS1hwZbMByx+lOnHesohLGEk6dstMxnqyJxne+KCKcjAJu0BDGoP3h2fxTOaYG2F5rRvci7DHlWAWNbONNaLxb6g5yT8MSFMAjVThIwscAg8GbE5SjeKFoO2Bk430GUwixxR5TmH/T71CMgAlRgQQmPSAZm6PC0FaODELTJahd/5tCCJKsRuRGLp/zpeSpNo4PTaH05w+N8sKBdgLftlxOx+7+6F15tFS8pPKpC6+vZNASbfP7gZgiZdLppVJaE8rQt1u6GKl2cHn1DqHNNnQT2PlGWBSfcerJnhlLSf1eO8ttNUDcmKS4MEiJK5TGkguBwpa17MjOoJGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae8916e-9087-4e31-d47f-08dea5041715
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:56:52.0166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+NpwQyWK5O1LYk2vtvzizxIgBGB3nGhdYTYYbt22hAFWGS641aJ0lLfTYnVpTUzYs+4RL1oJgX76mG2Iln4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
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


On 4/23/2026 11:09 PM, Soham Purkait wrote:
> Add System Controller GPU health status values, RAS response codes
> and mailbox payload types for querying and updating GPU health.
>
> GPU health states are encoded as numeric values defined by
> enum xe_ras_health_status for use in System Controller commands.
> The GET_HEALTH command fetches the current health state, while
> the SET_HEALTH command updates it through the System Controller
> mailbox.
>
> struct xe_ras_health_get_input and struct xe_ras_health_get_response
> describe the GET_HEALTH request and response payloads, respectively,
> while struct xe_ras_health_set_input and
> struct xe_ras_health_set_response describe the SET_HEALTH request
> and response payloads, including the operation status and current
> health state in the response.

This is extremely detailed commit message. Avoid using structs in commit 
message

My suggestion is to split patches into get/set health and add structures 
in the patch they
are being used. But upto you.

>
> v2:
>   - Add enum for health status instead of xe_ras_health_status_t.
>                                                           (Andi), (Rodrigo)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras_types.h             | 83 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 15 ++++
>   2 files changed, 98 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..5f884d6e24de
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> +	XE_RAS_STATUS_UNKNOWN_ERROR,
> +};
> +
> +/**
> + * enum xe_ras_health_status - Device health status values
> + *
> + * Health indicator status denoted by numeric values to be used in system
> + * controller mailbox commands.
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: The device is healthy and operating within normal
> + * parameters.
> + * @XE_RAS_HEALTH_STATUS_WARNING: The device is experiencing minor issues but is
> + * still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: The device is in a critical state and may not
> + * be operational.
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +};
> +
> +/**
> + * struct xe_ras_health_get_input - Input for XE_SYSCTRL_CMD_GET_HEALTH
> + */
> +struct xe_ras_health_get_input {
> +	/** @reserved: Reserved for future use, must be 0 */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_health_get_response - Response for XE_SYSCTRL_CMD_GET_HEALTH
> + */
> +struct xe_ras_health_get_response {
> +	/** @current_health: Current health status (OK/WARNING/CRITICAL) */
> +	u8 current_health;
> +	/** @reserved: Reserved for alignment */
Future use in case any other fields are added
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_health_set_input - Input for XE_SYSCTRL_CMD_SET_HEALTH
> + */
> +struct xe_ras_health_set_input {
> +	/** @new_health: New health status to set */
> +	u8 new_health;
> +	/** @reserved: Reserved for alignment */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_health_set_response - Response for XE_SYSCTRL_CMD_SET_HEALTH
> + */
> +struct xe_ras_health_set_response {
> +	/** @operation_status: Status of set operation (RAS_STATUS) */
use enum or XE_RAS_STATUS
> +	u32 operation_status;
> +	/** @current_health: Health status after this change */
> +	u8 current_health;
> +	/** @reserved: Reserved for alignment */
> +	u8 reserved[3];
> +	/** @reserved_2: Reserved for future expansion */
> +	u32 reserved_2[2];

Nit: reserved1

> +} __packed;
> +
> +#endif /* _XE_RAS_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 89456aec6097..fc73e02c3202 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -10,6 +10,21 @@
>   
>   #include "abi/xe_sysctrl_abi.h"
>   
> +/**
> + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
> + *
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Get current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
> + */
> +enum xe_sysctrl_mailbox_command_id {
> +	XE_SYSCTRL_CMD_GET_HEALTH = 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH = 0x0C

Add comma so that following patches do not have to add.

> +};
> +
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP = 1

Use 0x01. Also make this consistent with the correctable series by Raag.

Thanks
Riana

> +};
> +
>   /**
>    * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>    */
