Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD89606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KpkqHuyz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9D10E08E;
	Wed, 21 Oct 2026 01:00:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8B210E136
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 01:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792544452; x=1824080452;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4EC26rYlNtknnGs4qKMAHL6XIVyAJtTnozpfAev/W/A=;
 b=KpkqHuyzFQ2sWKKeUpLXcqRmS+wUXtn2Q+SDLd4U76mMrZGn7ZnGO+1p
 ntDxoxPXpW4y4PnBsFLGxVR9n7xBcqAjSfMoTR27j1R0ym9PBvFP5CpRC
 t2Kkypt4aGvCqjT/hV41f8EtVjnxiB6fDfgaOB70xxmpGQauI6Rkz0ZCM
 sTguseOzUx05aPAz0cNQyibczqRkwdpXDpmEnOCmY6ytugBkbacIp9dMK
 ksBRFbUvpARGd/ga8Y3O3VfHaV0I1i/xknYnaNovy6ORGNCVqMLUpQ3gE
 K+qpgzbfBanKatXCWRQ9X13v8A5yhbjprT6SsjRXFXDV3EPkCUFiu9lol Q==;
X-CSE-ConnectionGUID: RvGR3RHrQQWXf/+QE75k5A==
X-CSE-MsgGUID: xTIpMCYGSYCWuHZ7D3iwtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1251286"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1251286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 18:00:51 -0700
X-CSE-ConnectionGUID: GGy7KBS/QfGSlw4okbvcJA==
X-CSE-MsgGUID: cDvAJpDQS1O9V41y+w/Lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2942917"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 18:00:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 18:00:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 18:00:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 18:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YO5tOUNC2ZAk4fI9uWCwx+HsG4rxv8229OevNxB9CGw9cqnpwzQOo0c7/y6oBgbaFxkY5eJaxm3Sdptbr4+LE7fHC4Cnx99wbm06ziPbvHrjTbZjMl6VlikC4WGlssAl1g64sfiWpdmg8lyZQWkRul8EXEeCTM90Qy6FpHDHy6XOB0cRkdgdgo+rHI0UBboWsa2vDhwBbeOO/hal6csvdPM5gUoc4UvDXb6xTkBGwfujlKZ1X+SxFg+qJIAiM2jsNZZzgIPMpckGLXo2qpCKHhS7TBWfUuiOFpNLXXkKElvFhZiq8l+B0VlWGvyTGVrXXfpNl7a3PbYKRwLFW8ExQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpi2BIXsT8YA57IAEZH3mtlLxMeVcTkYkLIIZiz/1Rw=;
 b=JaYxTk5rJGKZtC1IgnbdvwqhnhOe8s7XqxWdfzhN9HA1MKgfEVPGXhzGA3AL/WK+ssiwVWiUXk+xChw8ZkZFEFUlLMK66W7TcaFcwLMhKGHKiw5TXsSNSIzXK33uLKIYE521OlfP67g9TvcdKbBqdex+xv9Gqzt6SJbbaDiUmq2XWM5zdjjrN7bNnIteb9nziVVJF1pBmrsIlu6S2SIJVx+RUO4XgoE7Zblky/aKnRsJMm6TVQd8Wp4oBaVtqMlTk4vd/7WAjsz2DFGiINsUUVpXFFD0KJRW1xnBn6rNoEqYE89DjydWp/h1KvsW8dw96mfYHw67YstgMRuzAgj1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH8PR11MB9974.namprd11.prod.outlook.com (2603:10b6:510:3cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 01:00:42 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 01:00:41 +0000
Message-ID: <a019cc66-f41c-414c-beb6-c4aa4d38321d@intel.com>
Date: Wed, 21 Oct 2026 03:00:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/ggtt: Introduce full GGTT range size
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
 <20261020095532.473609-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20261020095532.473609-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH8PR11MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a8ca96-27cc-453a-4acc-08df2f0eba88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 59CZZgNeOKd7DxK6CKSsFRxrTz80+m2H34wSQEXJr9+Px6eFy8wUAThxBCzkvfuGkuoIkW6mz2Tp3rfKpSMUnyCF6KGRJdjv2Fez2Ou8DcKuLU0GGVzznPMdOSKdNyNrDIn58Hg2190jyPyrjZoRJo7aepQlMIqUfy2va5pSFTT16b4H02mISCCNNP2pMuLiFiyy+T4XEcC94JxBDw6ZMVTxHt8I0FLmKXGS6aZwTm5TroeGymV6/pMhfPsSAQamN8BofYR/KjsDRfZnrnFhWBgdzlZvyfizoGmBhHxadEnATWn1xBr47iCDS7NpZiQH8wTk7BkWiBq1AlkEBplER54Vtsr/ZETKPPZb6OK6RwG/I4q24WqKeV6j1H0OYZPNS2NMg5orxr9kIqyWV4V/3m1Es/DExx3dYTcQhwuziFRlBiEiKcQwscNuHA5MGPQ1qQLJiLdTsGpgKwgGRJ7FHwV0w/f7/5TvjGeTrBcPED8/E38wJ2KZJOv+1VgEX+aA5xmFEqPbUsKwteWhhkaWEbKLtCp01SGdFvNRY3h1r9I9gFiF2kPthZDlMuFx9TI70wAzxIuB3JPpWRBiD0WSKH7XBjKdPzF7ne2s2w5YYVZ6ffRMY7GfbBJcJC3api2bXTOWy9rnBGjK91Cz6tdGpH3m/3Q1jqPrpIgqXgqd8ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdwS1A5QkFPdjczUDAvUmtQamtCVjAxY2tCQ1VLZEtkZTFjQ21kMnN3NFJP?=
 =?utf-8?B?KzZEQUk3M21kenQwdkpSMWZtZHJkclJqdFhZTHpvRUJqUFpjZ0Y5MjRRNXJ2?=
 =?utf-8?B?bU05UTZLcEhTSUVkaGlaU3V4QldmcDNvT3RuR0djSTRsSlBmSEczQStMKysy?=
 =?utf-8?B?QmlOMFkvQ3ZWejRMVzYxZmxvdWRQMEJPWjUxMWl6RWJSeVlnd0NUWmpvS2tX?=
 =?utf-8?B?dGpIOHlRcGpEUmVHMnVVbjBkNkEyWG1CNElqSDZqT1loRCtuTTB1VTNkNHRv?=
 =?utf-8?B?cXpQSFcySDNaVkpLWnZtZExtMU03dUJMb0ZsaFJtT0FYdTBxekRCRElMdGR1?=
 =?utf-8?B?WEd6VFphMFpDK0FsVHVGTXI1bjdvVUNYaVpNa2pUWmNpV214Q0NuRFRURmVn?=
 =?utf-8?B?TVduUUlyUmJQekRqUG95WG9kd0NNQTdOV1BxTzFxL3RSeERPRVNhNzNTRk9Q?=
 =?utf-8?B?RDVLclpFaUQrS3UvQ21LSkFtQVREa0pIMW5jT0N2eWdpNlJCeXJQc1FlS2gz?=
 =?utf-8?B?UXd5MFVZb0NsTWY0K2t4U2trR0xVVS9wR0tjQWNabHNLVUw0andWSHcvUnJS?=
 =?utf-8?B?NnR1bEtIV0FGYlZQU1crUmhTZy9zVWtBOWp0OUhmZFRkMmc4Z1RzQ0Fwc2l4?=
 =?utf-8?B?a1haYVJqYnl5V1o0UlpGYWdrb0dkdjNKMDBqZlorT0RrcXNxc1ZOYURJRFd3?=
 =?utf-8?B?VzFpcFpodnVmOVF6ekNHMGR1dDBCTFA3bTlNWjQydVpHazFSQ1ozWWpSTFgz?=
 =?utf-8?B?YmpuczRKTituV3VjVDRvdUV2bllZNnFNMXg1OFphcmFnNmcxUDZlN2Y5SE1k?=
 =?utf-8?B?bEVHbFk0d3QvZEFyVVJyam9aREY0Ymo3VWtDUHVLN0JaUmVwR0pCbEJ1Zk1m?=
 =?utf-8?B?cVlIZjdGTHlYRXR0cFVaSEd4R2F2azM1WUhybGkzeEU0c3ZBV1BobVAySXY1?=
 =?utf-8?B?QkpSRW14RHhISkt6Mk5YNGdnS0JLZ1Q0eDd2dlZZZ1J2bFp3OUpTeHhZazI0?=
 =?utf-8?B?L015K2lxNDNjS2V5ZW5wVG1GMUNCckpqeU10SzFtN3hVaXp0b2VNY2EyU1Bp?=
 =?utf-8?B?VE9hMG1ZQisveDlFUmNRTkJMSkpNYUpBMmFWOFVVTVJDMW9vczdXWFlkdTlL?=
 =?utf-8?B?RXRsYVZQNVhmYmUzcmdKNmMrblZHTGZTWi9USXRsaThZWWg0cjMvM2FoV2pS?=
 =?utf-8?B?QWptWHE5cWlOaFJPK1hTRmNOUlZObjF4WmovUDNnL3VQZWN5czR3ZmxrMzV0?=
 =?utf-8?B?ZFNiM1kxNXB0OXJtZUxQWVBXQWRBbXNZSFg4cmR3b0NiTE5oaE5MWnJvdTBC?=
 =?utf-8?B?WlV1WlhRVFV1eWVVbG9LWlV2RE5BTFd6UnNCNXlWRFRVZjFJbE5VaW01cXRj?=
 =?utf-8?B?aEV1SXNubUtUZUhnemx5MEI3MmlJYURCR2hGdjM5aW8vTXNpL2xFUHVLaEZV?=
 =?utf-8?B?bzlTaGJLb0lxZm10SEVHU1FMQXZNKzdieTAwT0tSQi9FZ2xuaUtyeUpmSnRI?=
 =?utf-8?B?WTg5dklGejVwSFNNNDZQNi9vUWNzRlUxNXdmOXFGKytNRW16bGE0Q3BhL0Iw?=
 =?utf-8?B?aG9rcHlqMVpsOWZqTlNTNXc4RWw0a3U2ZHhvNW5RSlBMQlhtVmwzNUlyVUFV?=
 =?utf-8?B?b0QvdFh5YU0rL2pXRkQ2d29ZQ1pscFpHanFXYWlTVFNtU1hGczVHaE1jQnlL?=
 =?utf-8?B?a216cU1wU2pOSkZNN2FBdUpGSkM0amNMVGVTcHV6RnFad0J3WGpBZVdWdmNo?=
 =?utf-8?B?bWh2ZlRxUy9jWlBOMzVJM3EwQlVEdjk3R2NGZEEwaThRQ3NuYW4vTVdkNnpt?=
 =?utf-8?B?NUUrVmxRY040eTNMblE1Z25Wdithek1EWVVpcVU0WEFoMmFCQUJWM0N6TWF6?=
 =?utf-8?B?Q2M2M1lQcldkL1k2Q01zdEZaOE92L1hrd2RzK01IY3BVMGx4ZnF0QlhrQmxO?=
 =?utf-8?B?RjJiOGRDR0VkTnFwZXlIMUdTVzQ5Njl1b29FT0ZUa2F0d3BISG1MYWFPdU5F?=
 =?utf-8?B?YW5BRzdkMlNZd2RLTFREM3hKckJxeThFK2JEbXkyZXpTaW5uVEo1V0hNK2RX?=
 =?utf-8?B?eFIycHBDR1JYcTNjdFp4MTBPa2ZBRTF3cC8wK0xLNjhEZkdvNHZVcXVaQy9H?=
 =?utf-8?B?QjF6SGdYSWVLOUIwOWxpWXhzekdRSlhLaDBuOVRybzFhQU5YWUtteXM4d0tG?=
 =?utf-8?B?YTlEK09FYlUvSXZpNllad0dOS29jMThoTHBVZnY4SE1DbEZPQXNQcHhPZk4y?=
 =?utf-8?B?TnpQUE1Ja3g2SkR6S0p2L3RuYTI4UE52Z0U5b21DWStkdVRWUFh4SkFHQUxq?=
 =?utf-8?B?WTFPTTM3c0lHQ0FkS2gzajZxK0ZiMUhHcDIxaFRXTzdFM042aUdDZz09?=
X-Exchange-RoutingPolicyChecked: nkJTr0OIouYPE2eTBOAWL/qMX/NgkLGVGqiHOJwsU97Fzqci6cXxjDKaUyUXwHUoquh0cWf+EYtWVdRkCmKTP7++XA3pys3A27+egXlwUyqhXvpCyEOjZDPlDWoJyzCNlBCqbB/uzTnW1TIIXbh5LD0exki/lt/VBye7NsXe6DJpKJPx3/rKs0r4psrW7BlJfeyKcADulpF67GYg6Jm3yPm+KWj52wf2oCK1bKynnwsp4JVHJ8zDMrZ6uMiZokHmN/GinkvVJ3aggyEZfhrS/+CKw96ekplMnHEjdo6iaE8RlDiwhlziDEFJrDcntfQJxiSf1JDUBi7mIc63H0yf+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a8ca96-27cc-453a-4acc-08df2f0eba88
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 01:00:41.8298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjpt9jf9SU4xcs15a63oMhpY6O/pBVQdL9tGCVl/xdLXtohGDSV2zA6yeOM3RltRlicDN3iv7lMrMaIeVIqubw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9974
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 2026-10-20 11:55, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Separate the full assigned GGTT range size from the size available for
> regular allocations.
>
> For now both sizes are identical. A subsequent change will reserve part of
> the full range for VF provisioning.
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 773777afc68a2..abcc929c08535 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
>   struct xe_ggtt {
>   	/** @tile: Back pointer to tile where this GGTT belongs */
>   	struct xe_tile *tile;
> -	/** @start: Start offset of GGTT */
> +	/** @start: Start offset of the assigned GGTT range */
>   	u64 start;
> -	/** @size: Total usable size of this GGTT */
> +	/** @full_size: Full size of the assigned GGTT range */
> +	u64 full_size;
> +	/** @size: Size of the GGTT range for regular use */
>   	u64 size;
>   	/**
>   	 * @flags: Flags for this GGTT.
> @@ -240,7 +242,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
>   static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);

Looks like the `start` was introduced in "Start using ggtt->start in 
preparation of balloon removal"

back in January, but asserts remained only for the top bound. Shouldn't 
we check the bottom

bound as well? Though that should probably be a separate patch.

-Tomasz

>   
>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>   }
> @@ -254,7 +256,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>   static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
>   
>   	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
>   }
> @@ -359,6 +361,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>   static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>   {
>   	ggtt->start = start;
> +	ggtt->full_size = size;
>   	ggtt->size = size;
>   	drm_mm_init(&ggtt->mm, 0, size);
>   }
