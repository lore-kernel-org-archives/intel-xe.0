Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC069F99C76
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 05:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6294A10E416;
	Mon, 20 Apr 2026 05:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mz2/7HTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FE610E416
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776663295; x=1808199295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=taRZ0W0B3WyOFV1286X8awj0ZLT7TVvev3Pt5c2g2Fw=;
 b=mz2/7HThddeQB0CRqz3OYdLeCMQ89+yA5QWNimRbPQpvGVLD8UpG39F4
 rPAlzZt+CVtLNYXYFYz081nTcN8CiCVCA8abBu9CVl/7Ypa4VbkkOw30Y
 vJuijf3yyDrsaUD0ZumtBLKZD6LGnmGdlk/zOezDrkQ5N8OtqeuKIjCJE
 qEPSWvoL0+ltexjtsEQYmlWgZgMiW/Ah6FEfSp+HVq4Z0G2P+r3EUSdvB
 0+yoTc67ejmYYVA1avURMnWrMYI/KkR1q+G9IIO4JNQ0AVckL4qZ3IxpA
 VkpYrFkgBzu/Hd/MEVtwq0bM+CEGl/UTTbjvYZqsF2MASg4/R8xDBpYR3 w==;
X-CSE-ConnectionGUID: Osf7bFhzTv2C0bLMEYajOw==
X-CSE-MsgGUID: T0D+w8eWQ12T/yEYXxozVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87872641"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="87872641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 22:34:55 -0700
X-CSE-ConnectionGUID: o8716ocsQ4CWR6+nPOAL/A==
X-CSE-MsgGUID: DqIl/DaBQpys6L2RFoT2Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="269655706"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 22:34:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 22:34:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 22:34:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 22:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue444ajsT65Xj8JBXNAe4W7TRr7DFBsgCdcNe2lU3PdNPEk7uZ3pWlxW8Iqu6RrkOQULZwN38XYdaj8+Y/ftoLIbRoaPeTFYCQxETiTRv6oXCQv+9rBAHG1MiYaG5qPikpeXIKqtFjh2i+pYdmySNrzULBd+bHKFI2OKtOrmMhPXQjxK4InfIfY7icC4oAkiDxGLpwA1Bibrrz/X1cho6sAo184rGL6KJ0pu0nQexLsdbY7uwJE2q6zvNw/arPjd57cOrYkV6/bqmlucwa4K42OrVBQCIz6gnCk3oG2WIwVkZifQW0jNoWnC12c4CniUvPhz+ORMReupN6C9IsMWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC/g4vQH7wKZQsOfffgjuMiDK/+q/0K3vQAzhxDMtVw=;
 b=Kj0HoDdqANfMqxIkv3aKiad5DtzD+jJ22qwB1bXS6CFhSDbn2/KhUOXD8hS1CEIwDYFjy2humabMcO1cbjjil+JmfHP/4+v5vpTDZFza5DRZAKDs2T1F7NEAuThcl7dLOiqGbhU/4JDTeYVqeo7eA4iniz0K53Nj1Q0NBdWL8VyGhWzjP6fiNh41xfY7a+OBsa+mbxRTgBLnn7Ox/GLF+WoYJxpHUGF5AvaHhCsOnx+00dCsl4hx2Qi9eC9hgLGTkMTnMANtF+nCTtyhU0HwsKfR0cW3SIcd7u0gEvh7xB9267Elr9Sn7hyzenmH2nVJw7sQWHL3HrggKZSp6I4QAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Mon, 20 Apr 2026 05:34:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 05:34:50 +0000
Message-ID: <02b7cd96-73c3-4fb8-922b-afbb8fa4d27f@intel.com>
Date: Mon, 20 Apr 2026 11:04:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and commands
 for uncorrectable errors
To: Matt Roper <matthew.d.roper@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-21-riana.tauro@intel.com>
 <20260417173854.GE7476@mdroper-desk1.amr.corp.intel.com>
 <SJ2PR11MB76194CE5B11F52874CA88CAB8C202@SJ2PR11MB7619.namprd11.prod.outlook.com>
 <20260417213235.GG7476@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260417213235.GG7476@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 444d03d4-bc65-4997-2fa6-08de9e9e8a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: aNaEMFHPSVths6Wmf6+yZ1lwMmofOdd5G8ZQGq3C5AJNoQYwW/+82FoEzImauWvvGm4LBe1y3eqcetGAmYapjFJo5DnqFDxL+WIPdmBUv8a71hTNejDPNq5Nu6noxpGKb4LNDv2dld7RGULcrhvofxsa3/RTuSH4Lvj0QFIabmTxY+fgE2TLE+QbnGxMJonPx1uXvzc5d7YaoKs+g9Wtgr7Z01sPXcxIS7JT7S76HeO01UO8N9p144qp+tKqT4jb2LOKbwwWTUFPFhn5CpNuuCtcqsWkuztSCGXo9GguaQ9iEAGDYT6pgKT/gwqg1Rak8q9oOLgfAIA5IRqt/IKHJCJkfLlsUY/j+P8TkmEBaej6wyyrk71O29oA7o3cdrdamie4Gb0hsi8C7NzNvt3DTfIp4px770/0Fe5hHuxKQNAPP/jn/z1l2O9nmJruTKIbriaQDcYD6a/2p5MXcOgIQFmkbzq+tQFX8aZ4qa9xipGjH6l0vjIiA3MZW+T8Skp4KiwWiAfbJWinYftMA7a3/qXTQsR3k2xlKrRXPvL8rD/y7QQt4L6NtGljg+W68a9xkB3ZvgEAhGfuKfmQUguetb7EQWXZq0q96KaarPKhkPH1pF5p/LeXXUNEovbFl9hooDoTNAYjqKw1HJ5sVH2hRK/I+bGf2UrcWZxrk6Z7XB5XuTQY0hk2u3eopXl5RAky5PtcMfpD1IhQx8yC77eTDZ440hweGnuO5DZmLE2a9/NRIKl1Pwg0hrGoIlOEbTWG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1lqUW5sNG1COTJQSTA1Um9yckE4QVRlWVV3RXQ5KzZFZVZEVzUwOXIzcFpT?=
 =?utf-8?B?alFwRHlUREZUVlBTcmFGMS9TZGZKUWxzWVAva0NxdG0xZXMvSFdiZzczZWZQ?=
 =?utf-8?B?Y0hHV1l3SnZSejd2eUhRcVZrWHowSENucTQ1YUJMNkhTYkNhN0QwYUNtdkFv?=
 =?utf-8?B?d0pENGF3SEwwcWRXYmp6VlVtT0pFN1ZQR0VrbVlEM1dBUXM2Uno5aE50VHFS?=
 =?utf-8?B?MGNhTE0rRXNTemlVckFpenNGSWV6Q0FWS2IzcHBIVXg2d0ZoT0pQcmdnNnY3?=
 =?utf-8?B?S2F0djFSRzNtVEpTUjBpK2JiNjVCSzNRbDlNRFM4TnhBZ3M0UE9TdVdqNVl2?=
 =?utf-8?B?QkFRZm8vV24vSWp1WllNcm1WWi9DZGlwOTc1ekN0RTBHWGZTV0drWjBSRDZw?=
 =?utf-8?B?Nys1bGV1KzBlN3A5ayt4NXg0cjVNUkpjb2lkdXVpdkpoZUF5RGhFNk9abzhL?=
 =?utf-8?B?ZHJvUlRoTHRuZmg0bldjNytISTBJU0Q2OXBRdnB2VUErKzhSTlRsNUpEVjho?=
 =?utf-8?B?V2tWU1hVN1VPSzU5UkJJaEd0M25hTFlTRWl2Y2MvaGMvcklyam1NQkhWNGtW?=
 =?utf-8?B?cDdUbk9NR2hxN2JvRWl5WVhSOFRwTkovYVNZOGV3MWZ3ekw4dU9yUFF3Smpl?=
 =?utf-8?B?OEdoWFZWUXBmTnQzdFFGTW81cW5KWXNQR3ZVQnhlN1RDdmE3R05lb1E4NWdC?=
 =?utf-8?B?NEhXQ2FCOHFQMU03TWJQazRLWjR5VkY5enR0TERFREx1L1JwY1VpZXhRSCtr?=
 =?utf-8?B?a0U0aDY2Ui9VTkFIajV5SjlidHZxOXlGeWIxWjNzVExGQUxwQUZBdHhndlRZ?=
 =?utf-8?B?WXVqNU9FVTNzQ1NheWZFd1JHZ2RwNUZBSFFoU0hpYzBodzEzdWMwMzcweUg2?=
 =?utf-8?B?ZnNndzJOWU9DY0czZ0xPK2tnb1ZQZnhabUh5SVhQbEhjV1ZDYWJmTDJUQjBq?=
 =?utf-8?B?QWdzVUNSUDllWkVTT2dVR083dTNmeC9qNktMOStnL05PY0VMODBSU094Q1A4?=
 =?utf-8?B?WUN3WDg3cDlQbWVvdXpaSzZyT1lWTTdncjNSSkdraitXbk9tNE9FYi9FZ1NM?=
 =?utf-8?B?NE1aQnlYY01UcGxkN0hFVmRjbFhXYjJVVkJ5MlYxM2N3MU0xT1RuSEZkMVBM?=
 =?utf-8?B?djBybzB4dURoenBYK1BmbVNsNzlGMG1BK0NqMERIeUJDWVI5a2l1ajhpOXJw?=
 =?utf-8?B?OFFYcjh1MC9MMFBMNmM2UHNjRkE0MHFOMmtHQnd1dVM5eEZlS01BQ1BQU29q?=
 =?utf-8?B?UEF5N0xDektZbVY2TTJza1pmaiszTk9la3BLTjBNRFNsMGZKVER2ZmFPbWR5?=
 =?utf-8?B?VUtjd3lMa2tqOFhRb3NCeEtONUZsSlpjVm8wRHRYQk11dGxja25PbXZZZFRR?=
 =?utf-8?B?aUZXUExZd3pwUnp5K1IyNUF4OVQ4VUprQkxLVkVwUmxxMlE5T1FqNElYNEZD?=
 =?utf-8?B?aWVKVzdsZTdITFUwM1p3bWl5NjI1cSthUW9rQU8wblVnbXR0RXhtOFU5dm5N?=
 =?utf-8?B?eHg2bmFvN0pWTHVJd3N0bG51alJHZkRBcmpaU0F1d1Q3alJ5TVpTTW5MWll0?=
 =?utf-8?B?bVV2QlcvaitvSDB4K3lvRUhDeHVxWlNFVVdkTXBHSVdiU2tXSXB4N0Q5eHF0?=
 =?utf-8?B?b1JoTnVuSUlST3M3M1pYSTlHbjhxQWQwcUFTQUdOdW85Z2E4ZHFPb1huSDhy?=
 =?utf-8?B?d3dhMVBVNEowbk1HcDg4OHkzeVpxaTM2aktsMVhzVzF2eEg3VUxQUGxJWVk0?=
 =?utf-8?B?THVoZmU4V0xrYUVlNFhiMlZyUWwzbUFiN3JuY24rK2Z5TmhXeWVUVEx2dGhN?=
 =?utf-8?B?bmkyZmNqQWVwRGVwbFVnQmNFQldjYnFKbHd4WXJ1cHd3M0tqbXNRYkdpdE1H?=
 =?utf-8?B?TkRjazZJTUhtbEVQckxOTElMTzFaSml6NXd5NXY3Zk0wQ01Kd3VnbjV0UHB2?=
 =?utf-8?B?K29mdldYYkRqRGlQcTZUQnRIQndIVVlSZSthcm1MZU5WV2x0YUszVk1WcEs5?=
 =?utf-8?B?ajZIb2hjenlxWW93YnZYQitQWWQ2aHN3WDgzYUtvZ2NkampQQWtPa2hqbVgy?=
 =?utf-8?B?SnFmMGQxaGxJRS9yWnRKdjQ3UzN6NFZ5NEhrU0FQb3ZHN3ErNXhidk9sRlhn?=
 =?utf-8?B?NitrWFd5QzJCL0VkQ0RQTWhZMkgrZGVNc29wZjdjOWVEZlE0MlM1c0J1T3Y0?=
 =?utf-8?B?djJ1SmNGM2lWaE9QTm5wZFJieTlBVGw2R1RyNE4yblAwNnEvUndpZ3JRbWsr?=
 =?utf-8?B?L2p3SkFOSi9zcWFtL0Vvck9rbXR6Q25QV3hMOHZ0UHVDdWo5QnBxSGw5amUr?=
 =?utf-8?B?cXVIazhjSmJzdmd1MjJsaGllZGJ6TTdZa3FLNk14ZXJwekptMnhadz09?=
X-Exchange-RoutingPolicyChecked: TpOzbR9/6lf2KLfn8muxSNCIcOKRiuI1WmcLHuCFHNpauQo00htvrAKJ4y8kSAP3GaTjYIR2DtTV8KorTVPMS0NmK6fHnrQhlMXhVg9xwGFroSAheGC5zHBexPcVxIzJAatRXK+iqQiOD9L/xAj3CNjaN4QIilfkI2PtzUvYOCIcR3hjmvi6nDJWOReyKIlXbRpbUq8sAilTGqqsceK5SYwDjgo6yEyBYkYsZS0w22lL783lkCXgAhn/dOLvTMRZ6kRQvu4B1aENwSEnWESBeGJmKT8SmcKQM52qYY1pP+oPbnv7OIb6P6pAKZ8HqrTmC/eVyJbKqQ1DgHUWEs8QtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 444d03d4-bc65-4997-2fa6-08de9e9e8a76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 05:34:50.2139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22JAIrOFoBKdgtp9Q9AaS3951DbrTK50YnQMjTQuZ/6p5b5rakXoqWwol1DI1X0chbVdm48+yw7E4bUjEpm0Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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


On 4/18/2026 3:02 AM, Matt Roper wrote:
> On Fri, Apr 17, 2026 at 02:25:28PM -0700, Jadav, Raag wrote:
>>
>>> -----Original Message-----
>>> From: Roper, Matthew D <matthew.d.roper@intel.com>
>>> On Fri, Apr 17, 2026 at 02:28:18PM +0530, Riana Tauro wrote:
>>>> Add the commands and common structures for the get_soc_error
>>>> sysctrl command.
>> ...
>>
>>>> +/* Severity classification of detected errors */
>>>> +enum xe_ras_severity {
>>>> +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
>>>> +	XE_RAS_SEVERITY_CORRECTABLE,
>>>> +	XE_RAS_SEVERITY_UNCORRECTABLE,
>>>> +	XE_RAS_SEVERITY_INFORMATIONAL,
>>>> +	XE_RAS_SEVERITY_MAX
>>>> +};
>>> Drive-by comment:  I notice that there's a fair amount of common changes
>>> between this uncorrectable series and Raag's correctable series, e.g.,
>>> https://lore.kernel.org/all/20260410102744.427150-4-raag.jadav@intel.com/
>>> However it seems that there have been some minor style differences
>>> between the two that would be good to reconcile (e.g., this series
>>> writes out the full XE_RAS_SEVERITY_*, XE_RAS_COMPONENT_*, etc.
>>> whereas
>>> Raag's series uses slightly shorter XE_RAS_SEV_*, XE_RAS_COMP_*, etc.
>>> names).  Similar differences exist on some of the functions like
>>> severity_to_string (taking both the device and the severity) here vs
>>> sev_to_string (taking only the serverity) in the other series.
>>>
>>> We should probably figure out which form we actually want to go with so
>>> that we don't have last-minute conflicts as we start applying these
>>> series.
>> The one's in my series are consistent with uapi, but I'm okay with
>> either one. My only concern is that we don't invent overly long names
>> that warrant ugly wrapping while using them in the code.
> Yeah, I don't have any strong feelings one way or the other.  But if I
> want to apply both your series and Riana's series to the same branch for
> tracking or testing, I'm left uncertain which series I should favor on
> the conflict resolutions.  It would be good if we could come to a
> decision early just so the two series don't drift apart.
>
Yeah using the full word here wasn't creating longer names so i 
preferred it over abbrevations.
I will make the patch in-line with Raag's patch in the next rev.

His series has got all RB's so might land before this series.

Riana

>
> Are we expecting one of these series to land before the other, or do
> expect both RAS sets to land together?
>
>
> Matt
>
>> Raag
>>
