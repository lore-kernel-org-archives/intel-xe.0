Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32EACA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 20:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B81410E82E;
	Tue,  2 Sep 2025 20:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CswcyB9R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5610E82E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 20:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756843324; x=1788379324;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HUE6UkTxzfH8Fi1X5pO9IhPeonvBErOeDUJdMRAWkAc=;
 b=CswcyB9RvufWKxyu3gUR+h/5Mn3RccKH9V49/0RAhw1A2EAEm0tdv8uO
 CU1sMP52J3oH9miKMeFq+WkSHbbSX5ACtJuYH9f4nZvLYMbIeESwwuoCb
 Y5n05Xb3tITynj4S0AM3ao/UbTj7Tn01PnmBTnpNm7rIWTtpdPJTYsAN3
 ljz2lJnF+O5sQP6zkHDhUmebLaUiNXrPhGakrMBhfPsBXI8mWdQCPlTY4
 hF9KQwgoNaZwO9+JiwBEQSa/+7SS1xIfS9S9vJjdin0oLdVtnDaufAQF6
 h66u8A8kjCLpzpw0yE4LPHlAaJjLT45vQNuo0NbjCWjl4oAcSiHzvpFor A==;
X-CSE-ConnectionGUID: 6uerNTcXQFSeYoajLWhrsA==
X-CSE-MsgGUID: fSkiohJjTJquo2qZ4CM4dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59271400"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59271400"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 13:02:03 -0700
X-CSE-ConnectionGUID: c0f0br9wSpKnX+o+qOloaw==
X-CSE-MsgGUID: Fy559l7YTf+heSpdRolEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170935532"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 13:02:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 13:02:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 13:02:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 13:01:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXvO4DmRJqVkzyNmLFX3hU0ZqI3dgxba0uRsvquT4uRqk1DRe4Ecw3ZAxWTRpUNaOiZBqBTVCFkPA42rIDGIpd3HZzFQTsSdEhMRo2SaYNT/ayF+20ScYmxWeUPsm1hhPoKY9faX1oEXYEXHWEvhK04r5zzS6dkq69I8kriPDwCzzKB5Hoeg7qkYMTnBMIs+02Ld/koP5C1LFixtV4f6KGP5g95Y6TdeGDkgqaTroBXBK7bc/kqioG4HASFNCCUsBSgg+hFJ+rNjR6yA5dnB+kyP3nkM6rd2jbkPZ82Daj6GN4avfvZ83cIa+ZlXDyVphCQdJFTHHEqnJelTx1phlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9uYWnWtdzfLEys2dMcFT8IvxPRxBcHQik1oXXDgs+A=;
 b=vMSM89QA+xOXDpLnaRNnenMy+r+bTjWWbYsIem0tXNkO682xzWdvr6WM1OIBLJ7c2/01r8Dc4Xy7dHsfXA2ZjNYP3EQT6oguQviSQloTESwivCaJbbh5xVv2utXnX03SPJfe3biTjM4+B+v43U4nU1+p+ynDokWjHGKYiFumWHXCq1NvSEsVxSYnlK2+B6YlvQTDDC7GEx8R3t/ahYDewZc6bPs1NXU53XaBGWMMl4HcxdRycecNoyFcMz3BpcypFMtvKszfSwZHgXRcTYulopnTMU60/uNFb3P/RgwuT66QumQMrbPMUn6QdkpYMZafUExjwrAZUz+K/ppR1msHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5799.namprd11.prod.outlook.com (2603:10b6:303:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 20:01:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:01:57 +0000
Date: Tue, 2 Sep 2025 15:01:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>
Subject: Re: [PATCH v2 3/6] drm/xe: Update workaround documentation
Message-ID: <ijwgxes6exh7bmjdmzlhcv4ojetnw5n6yjdzzudn3um5olvz5u@ypzrfreylnbf>
References: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
 <20250827-wa-bb-cmds-v2-3-3cdf4d63c72a@intel.com>
 <4c2ad3c69f8b813bcb6e502986afa965a64f35bc.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c2ad3c69f8b813bcb6e502986afa965a64f35bc.camel@intel.com>
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dfbb8b-0ea0-4ef8-aec1-08ddea5b91ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R2rJiufJReja4+EbkSOzto/Ba7i7nfjh5wuKhOyLbOUR+vjlDXW2L6jd5u?=
 =?iso-8859-1?Q?fHNJGqjE3K8b2DOjNDBvJtjPMofjbgAnxOTRm+a210tlFJpB31hAiLRzyn?=
 =?iso-8859-1?Q?MravmV/6RUHHAeHiglCeKu9LNzYIeUw8KDSO2sIgPWFq0lN0KXbG3wLwnh?=
 =?iso-8859-1?Q?RrJxBlF8BkkEu7JRyFliz6o4dsK3D72KRkXYmRa04GA2f2NWFQxa9pokWA?=
 =?iso-8859-1?Q?9sVozuT8QKPPbOljLsx1hRFsRBxTK7pfTob47mvRTyMiT7aTzdyqsufg2T?=
 =?iso-8859-1?Q?wmuyGGtXMPRvyMgMj9nPYhsycBMb1I0fy1ifBozMxwDhX/DaMBIz5if9SQ?=
 =?iso-8859-1?Q?yWeH0C0RL4JZGiRJn5ushalMImRl+gyDrx/wD56K7H8V6/RK4HFwCpkNHE?=
 =?iso-8859-1?Q?2aGftHqoV5U9SoHkqeWp84QjjSiHaKmueTCtqRJEF1x8p5xc78dO0u3DTn?=
 =?iso-8859-1?Q?BoTQ2AW/ov1ZOYsZPegAVcdo2Z28SY3D9tjY9YVdvuneQeSwW4+UmOnopB?=
 =?iso-8859-1?Q?RtqvZecrv8UlwfygRhA7zkPmh1303qI73P8HeetqpEui87XKLsiR39HVIu?=
 =?iso-8859-1?Q?FiV2QawpsTuHKgsSf0Xvjl5plhTmtxNA7Y6bD+v0ZSUJ0zJ0PiM/VDcPym?=
 =?iso-8859-1?Q?bW2a+8byQtPCHMh0ONagON0qqYHb7zS/l1g39kV7RGAzl0g3Ix8z/4XyES?=
 =?iso-8859-1?Q?G4r0l/CoEnez2s34JIL+WVKhqZeiGtjXe2linvIAaZj8uWEqJreN+xayZh?=
 =?iso-8859-1?Q?NwK8XU9bqr9DwP9gU3PgNz77cLGjrnHFJjRRudB0xgGbMG1gTaUoKLZSd4?=
 =?iso-8859-1?Q?s6I4bgCz2orxxcQg8+hcbYTaAL/xDA4E/PbzhsAYELNJ94N2GDtftedakN?=
 =?iso-8859-1?Q?lQDWWOSak/uekeryJ6PxSFYGRExPjepBiGeKe8mx956XHS90cIsrT9BSuB?=
 =?iso-8859-1?Q?5d6KkXTMakOtvuPbs+zWppyIsjEoNKlBLQqqpRsBY6C6RmCDXsC3WPAMrR?=
 =?iso-8859-1?Q?BpZz68zL9Y0xmfk2j1vTFenSRmTStcmyg6BxJdnyltEDibFX/TJ9bXBvjO?=
 =?iso-8859-1?Q?ioxl1PbKZsXq0YakmmSY0Rv4+zwVUsgLrJITeBfhJWY5fGiW6Q/QnkvIJs?=
 =?iso-8859-1?Q?zwrm74bjN9O9fCyiJukhsyQuH5etOtzwFvapcR0MocI1tl0XY96KG9LSRu?=
 =?iso-8859-1?Q?VyvjTpiUq963gPXx84sPoWYdMGiwCDUXD8k64BmOjPTTYRixhTR76Wes+P?=
 =?iso-8859-1?Q?QvSnbYkl2brppEEamuKXVjzlK/6YXcpSrn9BCqLp7tAe3khCjLoVXKtoGD?=
 =?iso-8859-1?Q?3z+T0hagmT467hRCW5n1GQq9g01/b3eZNZacHdPH9eSy/1AR4X+4JYh+Sx?=
 =?iso-8859-1?Q?BtNWhLMKXZa6pSM2AnpdwZuef1Y9H8tem7YlmNyWIKmbfGWf5pwNeNpMBv?=
 =?iso-8859-1?Q?mfkGwRJNDwbLw6hbcZ8DSv5Ywq3ZHR4+kSxmtfv3iHO6Fgxy/63W2biSFS?=
 =?iso-8859-1?Q?VFt70RIbyUeWn3rlLh1he0icXoTGJDekhFMiTQk6kp1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dz/0SiAQ0M3HPEAExFYBL1RYI3xlpZgigFjg8a5o6PnXAtAZFYtnWT/P2Z?=
 =?iso-8859-1?Q?pXAJD6vUPTWTkGwlOVP5pCdLb5mo4OxNBp5gjFOhhezcAu2f5zJlUS5bDL?=
 =?iso-8859-1?Q?3mkZ1r0VIpglN9957jfe6X8WJV+9mRKVyeAaxkw35OX+TGH+WYwJJDbJO4?=
 =?iso-8859-1?Q?fSD3C484uEJlqXR+msvRPVoFRlFgun5UHVxPSVxMn7v5n6MXQ+peoorJb6?=
 =?iso-8859-1?Q?m9+qbxNN1gKZnX4Xy5xLMMwMtITPNegrvRnd2eLU2MSExlfOjQz+GwkmMq?=
 =?iso-8859-1?Q?v3x2CsIZlbsVC3FT/LdwJNH60IiEWnFvl9zXyjBT3YA5BT9N4X1d1rZJLw?=
 =?iso-8859-1?Q?JMfoBQyHlK6581R+2zzdy58ZemdTM9NlrObILhXLbWSAaes7EkVqpihhXT?=
 =?iso-8859-1?Q?NW02GD/bH1HFHFGj2OhQxLJlZ6YA0sJrrBSQ+VZERxJqlHVJ/q4vdwB6F4?=
 =?iso-8859-1?Q?PcSgl9bOIQ8MbG1EGqzLAqsZx9mTNpOG4L2ft8enjhJuKog4dgKyLEXp6e?=
 =?iso-8859-1?Q?0/cEo6lhFXlikh2xviOZ5LRgrHO/w78F0zjblEM+DmIU7djz89Bt7Me8BE?=
 =?iso-8859-1?Q?63KWohFM/54G9+J6BsdDkIvHvwu1+o+8POrUmtaHkkb4c1gyZdzclcQcEq?=
 =?iso-8859-1?Q?YTPyoSrJKvcPG2ERgGrUEQffcBWTxCFHIO4NbvDdJkuF3Nsm4krV+Hb+kS?=
 =?iso-8859-1?Q?Cm1JLQQMtpI3OgIVcE28uacRmewZv1kZwofjGcgR/BwLP9Ijk+ALvwHZVM?=
 =?iso-8859-1?Q?a10GGbLSCUOWMCwo/IHFwzYvbHrUfIaxV/BvwkpXb15M0q8xWS3xuWjI+s?=
 =?iso-8859-1?Q?tYk4LSHhAunhMFeazjyXfNtxE2ytRgTI1PyWK5otSZPL037IfbZIm4cn48?=
 =?iso-8859-1?Q?7+BfzhWSEzMQwxZkO0QmasZ/uRdgrgtmsGWmaY8bF9+3Rh1T12XKcuaDRV?=
 =?iso-8859-1?Q?M9ityvvul70HtD3nXKzN4xzxrJbrnn/KnbMfwZay3ThdCcHCFKpPUpF4FJ?=
 =?iso-8859-1?Q?RrsLEKtT5TCfTKBGRN68VBGueJnV+xIHUc+qb1kNVY0VNFyfnNAA+cAasa?=
 =?iso-8859-1?Q?G0GogD1xmL3wSkPvXswfUPnD822g/sZjTjKpJ8breCDAM+QfyzTyjucLHo?=
 =?iso-8859-1?Q?d1EqObn8F/JA02icB7a4g5BkVfcehQV2S+rkdKm8s9/eaPMNmywdqjj94q?=
 =?iso-8859-1?Q?1PxeYqY63D01895y/B5rBjojgsm1jJbULEXPsF0J8713UgdLAJybjH3SXq?=
 =?iso-8859-1?Q?kpkNA7M1/H7siPK5+jfZg8kNls+bPeyv72qGIzd6Obg8nDukLcWArFmlLa?=
 =?iso-8859-1?Q?E/3KazMkStySSqJYjsMIRVTxGdJOKJPSsTU27zZQ+tc+73dlEZNy7UL8Ze?=
 =?iso-8859-1?Q?Bn7nUVB/4+7CHzycXHg8pPvHQ2m+BgRLNtbJzqPHECgwc96sYFlTX2RVd+?=
 =?iso-8859-1?Q?d5nQQ+qS8FJU5FkT/ooakfxA7DP6Tdhyl4hArw1sHm8NsDTIdTCIBIP4I6?=
 =?iso-8859-1?Q?yzIBvpbLQJnlF5idJd5MxkasBpQXcn0Dr5qx6M6atC7c+sS4MwbN3qwpEu?=
 =?iso-8859-1?Q?FdiBG22OTBdeNPQgGbK+B2SliA5MF6PuAfummIij13huILv14ONKb8lAD6?=
 =?iso-8859-1?Q?gDfZeER53qVEeSnx7sHMEqTTEGO7TC79fjQQTymlK1bZlIhxNFNT9R7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dfbb8b-0ea0-4ef8-aec1-08ddea5b91ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 20:01:56.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc611k3raN6RdfgPAjH0ySYXDD+HaXDJOe8G7SFBRl7HnX4GTb9dU2zvbWFjVPvD86ydME6ahshNTGP7FF6O3cvB7zlNke6eSSVwzOLwu8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5799
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

On Tue, Sep 02, 2025 at 06:49:15PM +0000, Stuart Summers wrote:
>On Wed, 2025-08-27 at 15:35 -0700, Lucas De Marchi wrote:
>> Bring it up to reality, better documenting the existing batch
>> buffers,
>> OOB rules and fixing some typos.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 45 ++++++++++++++++++++++++++++++++----
>> ---------
>>  1 file changed, 32 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 52c7df4c3afd8..a19cf811b580a 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -39,7 +39,8 @@
>>   *   Register Immediate commands) once when initializing the device
>> and saved in
>>   *   the default context. That default context is then used on every
>> context
>>   *   creation to have a "primed golden context", i.e. a context
>> image that
>> - *   already contains the changes needed to all the registers.
>> + *   already contains the changes needed to all the registers. See
>> + *   drivers/gpu/drm/xe/xe_lrc.c for default context handling.
>>   *
>>   * - Engine workarounds: the list of these WAs is applied whenever
>> the specific
>>   *   engine is reset. It's also possible that a set of engine
>> classes share a
>> @@ -48,10 +49,10 @@
>>   *   them need to keeep the workaround programming: the approach
>> taken in the
>>   *   driver is to tie those workarounds to the first compute/render
>> engine that
>>   *   is registered.  When executing with GuC submission, engine
>> resets are
>> - *   outside of kernel driver control, hence the list of registers
>> involved in
>> + *   outside of kernel driver control, hence the list of registers
>> involved is
>>   *   written once, on engine initialization, and then passed to GuC,
>> that
>>   *   saves/restores their values before/after the reset takes place.
>> See
>> - *   ``drivers/gpu/drm/xe/xe_guc_ads.c`` for reference.
>> + *   drivers/gpu/drm/xe/xe_guc_ads.c for reference.
>>   *
>>   * - GT workarounds: the list of these WAs is applied whenever these
>> registers
>>   *   revert to their default values: on GPU reset, suspend/resume
>> [1]_, etc.
>> @@ -66,21 +67,39 @@
>>   *   hardware on every HW context restore. These buffers are created
>> and
>>   *   programmed in the default context so the hardware always go
>> through those
>>   *   programming sequences when switching contexts. The support for
>> workaround
>> - *   batchbuffers is enabled these hardware mechanisms:
>> + *   batchbuffers is enabled via these hardware mechanisms:
>>   *
>> - *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in
>> the default
>> - *      context, pointing the hardware to jump to that location when
>> that offset
>> - *      is reached in the context restore. Workaround batchbuffer in
>> the driver
>> - *      currently uses this mechanism for all platforms.
>> + *   #. INDIRECT_CTX (also known as **mid context restore bb**): A
>> batchbuffer
>> + *      and an offset are provided in the default context, pointing
>> the hardware
>> + *      to jump to that location when that offset is reached in the
>> context
>> + *      restore.  When a context is being restored, this is executed
>> after the
>> + *      ring context, in the middle (or beginning) of the engine
>> context image.
>>   *
>> - *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default
>> context,
>> - *      pointing the hardware to a buffer to continue executing
>> after the
>> - *      engine registers are restored in a context restore sequence.
>> This is
>> - *      currently not used in the driver.
>> + *   #. BB_PER_CTX_PTR (also known as **post context restore bb**):
>> A
>> + *      batchbuffer is provided in the default context, pointing the
>> hardware to
>> + *      a buffer to continue executing after the engine registers
>> are restored
>> + *      in a context restore sequence.
>> + *
>> + *   Below is the timeline for a context restore sequence:
>> + *
>> + *   .. code::
>> + *
>> + *                        INDIRECT_CTX_OFFSET
>> + *                   |----------->|
>> + *      .------------.------------.-------------.------------.------
>> --------.-----------.
>> + *      |Ring        | Engine     | Mid-context | Engine     | Post-
>> context | Ring      |
>> + *      |Restore     | Restore (1)| BB Restore  | Restore (2)| BB
>> Restore   | Execution |
>> + *      `------------'------------'-------------'------------'------
>> --------'-----------'
>
>This is great. Thanks for adding the documentation here!
>
>I'm not super happy per context pointer (PER_CTX_PTR) expands to "post
>context restore), but I get we're also aligning with the hardware
>descriptions.
>
>Otherwise everything looks good here. Having the illustration is also
>really helpful:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Probably good to add a bspec reference here as I myself often have a
hard time to find this page

Bspec: 60122


thanks
Lucas De Marchi

>
>>   *
>>   * - Other/OOB:  There are WAs that, due to their nature, cannot be
>> applied from
>>   *   a central place. Those are peppered around the rest of the
>> code, as needed.
>> - *   Workarounds related to the display IP are the main example.
>> + *   There's a central place to control which workarounds are
>> enabled:
>> + *   drivers/gpu/drm/xe/xe_wa_oob.rules for GT workarounds and
>> + *   drivers/gpu/drm/xe/xe_device_wa_oob.rules for device/SoC
>> workarounds.
>> + *   These files only record which workarounds are enabled: during
>> early device
>> + *   initialization those rules are evaluated and recorded by the
>> driver. Then
>> + *   later the driver checks with ``XE_WA()`` and ``XE_DEVICE_WA()``
>> to
>> + *   implement them.
>>   *
>>   * .. [1] Technically, some registers are powercontext saved &
>> restored, so they
>>   *    survive a suspend/resume. In practice, writing them again is
>> not too
>>
>
