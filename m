Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94EDC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 13:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BDB10E769;
	Thu, 16 Jul 2026 13:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+jxSbjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D518B10E769;
 Thu, 16 Jul 2026 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784210112; x=1815746112;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VzWlxufkfvKBVsvR7xx1JSlQPbt6b56BXX5ef+33rr8=;
 b=S+jxSbjMl0s+FQ0qckSl97VYHC87Fk1yGuJT81vOBFT2vc3n+HDRvxif
 c58ukkO+OSzTa7wbC8sJ8mnDIjk/wlb0+iyHtF0cNgqEEthW6mIkdes7k
 SAF2pUU41D3hJMyZeodLOcR4EbVW8AMzm3pdCzujhDAXXyc8eI4/lVTzt
 4e1fgApA8Bs78OBr7nsRRweqPCcidzoS66gs6nzFpH4S87wUvWZY5AEsp
 nIHTtJlckIBCQ7WLB/Bs6EGuSfjD4ne2N10kk3fUucPirrWDG7n2bNkz5
 iDefVlB9LcmVxf3C266ldTgBVl3yInVIJqs5EohxeW1+lAMx6KJVKKd0E w==;
X-CSE-ConnectionGUID: 7A9KgYGTTLaKRIIz7Wxetg==
X-CSE-MsgGUID: 9E8EjtdtTROUSsEju8ZmZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84830105"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84830105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:55:12 -0700
X-CSE-ConnectionGUID: uOtnvdfUSnmLOOv1y+0E1w==
X-CSE-MsgGUID: D0mEpgvYRfyBKAnbmPhoGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260323278"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:55:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:55:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 06:55:10 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcHDaiLAl7SqBe2RbdiOSJXhsSE83ISp6BTNhlFPc/oC7z9lVqkm29IMfGEQIsmn/FrU+juL2AHDu26FtNtyzy4agJ/D4vo1oe8gNDeogFM0/06wROolaeoxIPy2Pu8QWC+iRyOp01hwMMes75II9cHamNqdc2XatU+ERn+w5Jm01GNSTOKYGzs4y6qhCeZWMlCNjuMYYhQKgzYFDElnBfgbJyQddbmmM6m63b9vjgK29AZuoB+qGFxV0AKQsCHlsntk3lgnQNNP8z5hmBfePgMyiI1ByPkT8UfZI7x4mW9dYKNAEQnN3TbMpnL+GwNHpK7dzehKlccBJPi61w29LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGGvUD0hxhm2hf00KlLxefUPLa7oN+sQb+4MmfENyO4=;
 b=dVUDVL9nmVL1Hj9ENRI/PRnGEMLGa0UefJx5pUGQT2z0CsrsbBnZTs/LVfCu56EOKG43kzC4R0/gv+JvwR7oMQvm1mHUrOrNahh9AYqsgdu8Cz8OSsCJkQTnEbvlYopaa47DPzsoQEa0nfy9L5eMHuXsO720kg8lnPrSecK3nM9uGAi6e7xyfDPoQ+xI+FHGHxX/YtSzvEvGWKIMogoK7V9de7iBtTv6wBHnT9zserR2YPgueGeFyoqv+mBs7fxlUnGD0QtazVb5L321mSvDlLNBtYD656v3SqXR1MMocRSSUa98jEtZMzQSJRLfRRA5Afdy8Sqopl7okNrrPBcgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:55:07 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:55:07 +0000
Message-ID: <2c744e7c-b331-4aa6-b593-80f74cd57ebd@intel.com>
Date: Thu, 16 Jul 2026 19:25:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] drm/i915/vrr: Return from CMRR compute config in
 case of PSR2 enabled
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, =?UTF-8?Q?Jouni_H=C3=B6gander?=
 <jouni.hogander@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-8-mitulkumar.ajitkumar.golani@intel.com>
 <79756ac5-c326-4459-bed5-8867c07666d0@intel.com>
 <IA1PR11MB63480F3F524DC9318ADDD7EAB2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <IA1PR11MB63480F3F524DC9318ADDD7EAB2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0348.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: b897f473-b9d1-4655-256b-08dee341d81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Pfdh42JwN3ckc25cgxvptwTTTZGir4SU91PNxgr3UpfXyWHcbETERl8MrJ+BGCfBj8zoQqG1xKfgzGie33Ir02Sp0f25CpTcMrYjAzF+JTIH1kOgijn+9xMMAXWRA6mf5tFUUkxV+CuZOYpAXBgoePtm8JTfm0X9F5BgjmpdhHHJ7x42uNe1trfW1z9WUs4uRNZIkn24v7vf7ZbF8BvFJbXWU2wBEoVIIIpvmgC+FpCVAq80ScqkifeYel/xHgquQntRSamNrGMIH656q9lf6wEPS+NvZuzmL2e6h0EK7abcV0mXPJEHuKCySO2ULSO6BkJMqUDQcnHeIbXNyw8eITFSzQnsZYANLqN5UxikJR3kolwDUcAgDNGBJCk0JIkTI3qTi+k6URchbXeG1v7ZCu32Se+j4kT0vnz8bolfsBoYMp+MVOt+4hPW4eFMbMgB0NTuXtYAIYxbcR8fKP8TTRbw8cOYxinX7T6APnZLW3ji0F/m+wOCPOJDuwtly7Uim8RxTIzsgFhwWnNU4tesIhACNPBhf3u1c7tVcg9VxI/O8cf97OeR5QVmPHqI/4Z+JEvKyp37wTRwD21hJn0+ielIaH2fdOt9REA8VwQuKXb5sc9kwBmeChrwxAGKPjJDZXiFvSToJvLT20XvdPcRmJCcaRWcwer3OE5mcU/3OA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2Vad1M2ZVJBb2VCRWw1bWROWUkxNDRIUXlIZnR4NG1ZNW90RnNmMmprYnIr?=
 =?utf-8?B?VHBCcWRzYjMvVmFYN2xDOHJ3T3pIUGlHdVVyTUduRkxxeWd5aGxOV1ZKSlBu?=
 =?utf-8?B?RytRU3huZS82bCtDY0t6dkJIL0JjQmFJWk9aY1doOFlYcHdKYXc5N1o4ZHln?=
 =?utf-8?B?STQxS0ZDY2ovU3JscXpoenI3bWNGV1lRTHRmVlJ4TEtmbFFvMmdUWGdYYXFm?=
 =?utf-8?B?TGRBSDMwME5MSDVqODhuQmRIeFhhWnRZbitIdGpQNWRBeWZUcE95Ynh5dGZM?=
 =?utf-8?B?bDY2ckNMaHFHL2RUeEN2SkF1MHpsNnQyejU5UmRFUUpybTJWeENqREFLRStE?=
 =?utf-8?B?UHc0R1hMQ2xaNVFoRXNXY3FlNnpHckFtMnExdmJIcmpjbjdob1FmWVJJbjJW?=
 =?utf-8?B?TlRMWTEzYjdhSnFrT0ZGZWNmN3ZvY2NWZXFrbmEzZFdDSFZYQ2dvSSszR3Ey?=
 =?utf-8?B?djB3Nm43cVhDS1hXcGxmNkUydW9RUlhrZ3RwWU0rdkUvRHZqdkFnODVmWWZO?=
 =?utf-8?B?amphVzliT3hwMDJSMFRjZ3VNWndtb1ljSnhJN1h3MUsybkVLUW5UQjZSWGJu?=
 =?utf-8?B?WGxBVzlaNkhxUWJmZ09nQ2pObGRhMm9yMzU0eWVEQ3dWTS9kWnRVL3B3M1B0?=
 =?utf-8?B?akNsZ0h3SGpEcWEvTmY4ZVNuNVpOamdrdkltOHh4UDVwSU43akJvSkJ5djBr?=
 =?utf-8?B?dC9qYXorU0w2YVlHdUZ6d3JjcVdrOHVtMWdQR2pxSzg4NUovbWNMZHJNQ25u?=
 =?utf-8?B?YUpFOUxIVFlPdXQzbnZWNmN6VVM2UVNja2prcFZORmVkMzJVc2laK3VMbXpv?=
 =?utf-8?B?cTdoYVpZUGR4cjltSTVTbFdxVWNobW9KYlAzaEI5UlV2WFJHZjZLaVFaYzQv?=
 =?utf-8?B?WUhwRm5XVzhiRndtY081SGZYdzkweFdwdEVScVVxbDh2WWNUbHBhSVRBdTk5?=
 =?utf-8?B?V1NxMk8xTDREM2hyTWZaMVdFNUVWK3BEVDl1Nk1PQkNiNERxendPN0NBb0Fr?=
 =?utf-8?B?YUxFdHQwQXpJMklkbi9NNmVmM3VaOFdhNC9FUmlMc3g3T3ZvbUcvVG4yNVBU?=
 =?utf-8?B?UWthWDEyTks2bGt4cmd1bzQrMDAzOUpmc2RCK05qY1MyUVQ4d0QrM0tXeDhM?=
 =?utf-8?B?eUdTMzdKS09qK0Q2ZVMwTTBNM2dFZjdLOFltZVFkdktTWWczU3VQR1l0VThT?=
 =?utf-8?B?ZHZOdFZ6WlB5U3RwNmh3UUxKdkVOUjN5dTJUOStUUFAxOGQ5dUM1U2grTCts?=
 =?utf-8?B?L2FqK0pUN1RjdDFpN3F1WFk3dVhhN3ZVeWhJMDVISTRleWpzOHRYYWFWVHRi?=
 =?utf-8?B?dVJqNW9xNUZjZnVPNXR4OHVXcFhKZHByL1B1NFhuZnRtcjlBQldPaVZMZml6?=
 =?utf-8?B?a2FHcnp4c1lmRlJ6NXRnVWpBSjd3ZDEyTmM2Y2xUYU5jVWRoTi9zbU12QUxL?=
 =?utf-8?B?UFhRcXZQN0lsMm01N3hucHUyVWZUZkhFNFJVRDlXOUluUGVjQUJvSVVvU2tW?=
 =?utf-8?B?MTFZcmRsd20rUFk2YjdZczNUY1AvVGwycHpabjg4RlRSblBwbk9vNHlkaldu?=
 =?utf-8?B?Qk5MSjF3SVNwZjB2RmMza3djR3NOWGRuRkJWTnE5WU9JazEzbU9KaFJzYjJz?=
 =?utf-8?B?RENiVXBxWkpYaXdTekIxQ3JFTTlKTjFBZzB3dXJpOUt2Y1U2K0JMemw0c3Rw?=
 =?utf-8?B?T1VVL2ZIMWlXalkyQzRzS2FpSFpxQ2k4SmQ3SUlDNXVicXBjNWU4OXByUm5p?=
 =?utf-8?B?cmdhOHhvUUFoM2M1TlBaRHNnV2E3T2Z1eWtrNnRuUXJWZ21weGxhdkpYNmRV?=
 =?utf-8?B?bWRwYjRIZUlqakRmbEFIMEZwSUpTVEVWckxaUmtPd0ZIOVBneW8wRjFEVXp1?=
 =?utf-8?B?aFBXVnlncDlZbzdvS3dxMjcrNE00TkdNTFpLZHVLQ09NZUs4SjJPZjh5YWlI?=
 =?utf-8?B?OEJ2WGt2U0RZVVBQc2VhZml3UzQwZmhDblJDak4yQjJoeHcrOS9aNVM5SFpk?=
 =?utf-8?B?a1UxMVdNWlJQYU1iWXIxVCtnOSswK0xUakNPMDBzbDd6S2Uwd1N5MmlON21N?=
 =?utf-8?B?NGJZTW9VdzhlblYrb3JScExIUldGNmdXUndwZndoRVhjZ0tiaHRhSmFWRTJM?=
 =?utf-8?B?dm9KZHA2bndGTWpZdkhJaVNUeldiTmplWnlkWGxEM0ZPQ1V6djhoNmhsdysz?=
 =?utf-8?B?YVBwMThkOTJOemEvWFVJZkRtelRTcG1iRCt1RU9IWnZDOTU1S2pxdHFwNENB?=
 =?utf-8?B?bW12bG5RZGcvMm1VMFVxSFpidWI4T29aR2MxcTlJSHZldlRtYTlEWlNpTTRN?=
 =?utf-8?B?NTRBbGMrTmV0Sno5eFNLTTlsK3IyRjY5Z3Bpczg5c2srNGkxVStPc2l5NnJU?=
 =?utf-8?Q?uLR+3JXObV6EDekg=3D?=
X-Exchange-RoutingPolicyChecked: BdfJErstcNgrjYKJASW26R9FuoHou5n2qNoFZ9x3vFhsmRqCiPwxiRt0kBbdmc55cnW0AEL84fS7LmZ1FWjhr+XqdfxfwpGLJPiekIwWRy3KD6lOBzoPF7g+nONCL1UEF5KS1H4c0LdlOUQPjN2I/aknXAoinHlm+wHeTZYg7Q6mw5pI2luUSADpVrag1quiczx+O6sv/iv3ZUr9UzONXqZkfQe/Ots3ywJVC+MKbyTWzOBv3t5zSrNS11S7TQqPloy8tpeE+frYsTVf1aoJMPam/kbyh2yL8qKMi2kKzeuu0vEvpEDa9S8pvLlAe7htjw4TEZThxP+kPzENOrvP9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b897f473-b9d1-4655-256b-08dee341d81f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:55:07.4815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oylUo7MjiMj7G6uoGDaZRneoGEMnmMKJWbaqpZiarlJ6eY+PfBi6ocFsYzxiNbqtIzA9b0UWZDOhSKNFbOP4M6bRfilrWOqY1Tx7PyaO0xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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



On 7/16/2026 5:59 PM, Golani, Mitulkumar Ajitkumar wrote:
> 
> 
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: 15 July 2026 18:45
>> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Subject: Re: [PATCH v3 7/8] drm/i915/vrr: Return from CMRR compute config
>> in case of PSR2 enabled
>>
>>
>>
>> On 7/14/2026 4:09 PM, Mitul Golani wrote:
>>> CMRR is mutually exclusive to PSR2, hence return from CMRR if PSR2 is
>>> already computed.
>>>
>>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/display/intel_vrr.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c
>>> b/drivers/gpu/drm/i915/display/intel_vrr.c
>>> index 52fe40fdbdb3..ca3cac5aa6ab 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>>> @@ -202,6 +202,9 @@ intel_vrr_cmrr_compute_config(struct
>> intel_crtc_state *crtc_state)
>>>    	if (!HAS_CMRR(display))
>>>    		return;
>>>
>>> +	if (crtc_state->has_sel_update)
>>> +		return;
>>> +
>>
>> This won't work because psr_compute_config happens after
>> vrr_compute_config.
>>
>> Also is this the best flag to identify PSR2?
> 
> AFAIK, this is the suitable flag to guard PSR2.
> 

crtc_state->has_sel_update is also set for Panel Replay.

So I think you would need something like

crtc_state->has_psr && crtc_state->has_sel_update &&
!crtc_state->has_panel_replay


Adding Jouni if he has something to add.


> thanks for pointing out the other problem which is actually a chicken and egg problem, I will look into it and address in the next revision
> 
> Thanks
> 
>>
>>>    	/* No CMRR ratio configured through debugfs */
>>>    	if (!crtc->force_cmrr.numerator)
>>>    		return;
> 

