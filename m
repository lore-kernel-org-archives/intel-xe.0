Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6F1C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 20:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D6210F52A;
	Thu, 13 Aug 2026 20:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qqdwix9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41CA10F52A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786653523; x=1818189523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zY6lUeg+xqSGIQbCna2ycZ1TPqMPcrgZ9uzuhz+e9L4=;
 b=Qqdwix9jhvuHS1Hb17Qg4lUZDKe2ntBFyIVnY32fx4b22oZsZqxiOPgk
 EZbn5ZFeO5FKBEXYf9vjsw1Tj/ARcBcznev3vxJ9ocv7cETXzZf2e/qPM
 CI3FpscJyeDkW3jqPfA1tVXV+D2x0v4fQOL8Iuy79REaMnTRgRre4n4uB
 XOAc/n9QAqivSLHj+wfygev5gMmz5hV9gYbFqT29me8905lpS2TYe3mSu
 lv2zwiiQQwK8cu1q7bUAAb8odhxgBwyvLKiZ8/DcDih/f5RbmT7dmvaNP
 DNX9y5uq451lsTVBTzKK0nyoRIfH/IdiMM7hRAoGaOHwxuVZqb56FZlHL Q==;
X-CSE-ConnectionGUID: 5Q1CPqXYR/yLhtkPmLVKOQ==
X-CSE-MsgGUID: Ue5+TcmHSX+F3R9uPTTg9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86998411"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="86998411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 13:38:40 -0700
X-CSE-ConnectionGUID: dLXaNUjURlSCFR1ERg2OdA==
X-CSE-MsgGUID: c/50GBwqQtq6yCkly3LmRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="288829033"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 13:38:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:38:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 13:38:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 13:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryJnly1FmimOmk5dsh8IGuoyoFlkzoBm97da3hTJiu6sMEaHgLKOuwEZ7llty1i0Wz6unjTultQHYcLq9+SLDrRnXLtP/ltf8kzSddz/yIn/9TEWHC6H1N1h3r/570HmDTLaKnMZndR2cf9OyXeV0VIZsrR1AEdOeqf2GOF2gurMUggiRCJw7WAclUuCXYmIWplgc9mbuCVlznCRGS+TZAeBauC9cO0znFCrDmwuo6bc/vn+JONIIvFqoBcFpET2APHErnFBStnclvEms0P/o4vmyLfvs1L1Sby4j42XywP29TXhsN//KWoA8L98HT7Kd5lZ8i3Lmvcif92R1jjIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riYIlEQYP0fTKipO5UUJFxE0DKHuEv6CXugxYbQzU+k=;
 b=G7sr/I2r6wNK8StOn91lFeH6f6e/CLinLZE64blurnqZ/JgYck9Dqx3VekX7kMvm+W9nH3uR3OeWDaKJNKGnpoGezeffwPJk7Fm9FS06OxEu6OihtYIThT+03j/HsaeBa/j8hsM/DbUUMkNaMwLLazQnZjQ13Nt2WuAmfqcQ7Uilsb7Bpqnr+NI4OIxi4fYhx7ZyoCSRETkpxdwgLADQsWyxnZ6ZsnnHVh8UoIUZnnHwKkZGP+hKALkI21BmMWA3iuKIBjiseiqILgM2de+SYOBhr1lgiOpHQdO5tmAp87IkEb5sKHQy6Jc32g4fWxl+Yes3JRYYTDdWwvdD7hlfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF291EF9BF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 20:38:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 20:38:35 +0000
Message-ID: <7991e3b1-bd3c-459e-b033-29e27e8a4cb0@intel.com>
Date: Thu, 13 Aug 2026 22:38:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0144.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF291EF9BF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbc1381-4ea3-4f61-2b3c-08def97ad88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|3023799007|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tCsZexYrHS0Xf/dvcIo5v5nZuEWfP2vSUBrhKc3JZOl5upaCFFPUy6JJZHEmfX9Od1tWl9Y0a40KHDlzBglQLM0Hm8gaACD67TglB+HXr3gOkIVoVFUO19fpM/kCPDqQcD0mXiuh396RNYX3c05AR1VPqfEReq+L3rtkIlYgoqa+GdkGFcVt+ZrMsvYaWOzAfHb0cTduetDwRL5PH/HzHyax4FpgaywVl5y9e6AprKPe2tT9qSyv9VtoGtIdwktLIgdzUIcAxEYIno5ZO5g0NToHMgdF8L/hB9ulr5uRZluniYM4LAwr/vcAMk8llzzxa6AQilehOiINoHhlIIW1czSC1oypreVv8VAZQLw1np/90hb8m8yFvbB7akp3IAejZqPM6N5LHG8+qIKpOIMZADp663e2beli/dfR0Uo9gHtUqlFrkRww39IKzoz1LFxnydj1/DI0gZeLsDLkWP0oTmSAq8IraMhdQq9/AqNscfOjqo5ntXS4MF1lbRQJm3BQlHIrE4GjhZY4n+P160jeHPghv8KjN+UpHZdJcVg3yzRoB+fO+NMwgDoivHQuCEl/gCBHV5XYJ8eUWwULt5wFiOYzj6QorQ26RffZv+CeHceKim1ZHOG6JMNnC76FcI6awepJoa44VZJM67vkgqfPdQCOWflfj6otmMb4bTQ2dl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(3023799007)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDJRc2ZGM3JveFl3K2pUTjY0bFNVOEU2aS9SMUk0YTVIQUYvbUNHc05GRDJ0?=
 =?utf-8?B?S3ZwZDUydzFHUlFqSHBIYlJ3SG5WLzlXMUJZa21xSGtTdmhDekpHcE1VZ0R0?=
 =?utf-8?B?RGZ4aDhuWkErVlgyK2lmdytPUHFYQjE1a24rdElBNDcrYkF2LzdybnhUcTFR?=
 =?utf-8?B?MSsrWm5VNFU2c2psVUFyZFVpZEtEaFhWVU56ejRKcU16aGNYSWJLY3dSYmUy?=
 =?utf-8?B?S0RGTDVaakZGYjNTdkRPb3plZ0xGaWNzNUQwdVYwdTdBQXVCcjlDOStoazRZ?=
 =?utf-8?B?cFdmQS9KQ0tPbFFwTHYyeVJLbndod1hPbFZROVNZcW9BK1d5ZGg4NXFJWWZz?=
 =?utf-8?B?Z3k1MUp1WDhqMmpHL0JlNlQyaGNNdHlDWG5iTFhyVmRwV3dwQ3hoYUxHOHVz?=
 =?utf-8?B?SUVJQTlwdU5vR1pDM2I0Qmp3N1M1eVhsc0VvTDUrQ05NNEZyWnZ0UTJoTEh5?=
 =?utf-8?B?K01kY0UyQmw2V1ByZlF4U3B1eTExTXZIL2ljQmUzWFhXMjRDdW9Qb0t6NzZ2?=
 =?utf-8?B?dTBVRzRUUTRkU1lQZGduL01sS1VuSWVDWFlGQjJpVW1rR0ZJK3R0eHhZRUU3?=
 =?utf-8?B?Z2ZrbVJoYllYRVZmUzNwNUtJcDY4RDZNZmxhZXkzUmQrTGw3c0dBNlN5SE9D?=
 =?utf-8?B?eEpMZVNyaXVrZVp4cXMwbngycXR2TVRZcTFxVEhOVUc1Q2V6d2Ryb0lIQVBV?=
 =?utf-8?B?OGNFbWdNK3FYZXhoU0NUWk53ci9hK0lTU2JSakdyL1c3UFhuZEZmc2pUUXVT?=
 =?utf-8?B?dDJSRlArNDZYZ1RablVFdGMwVVducWRscnNSZ0xrOXZvK3V2bmJHNFhnbUt5?=
 =?utf-8?B?ekZJZHZPZkQraHJrakNkbFJ6VXhVQnhBU3ZwYWVSbEpmOERPVUc0UjRLV3I3?=
 =?utf-8?B?djNucWN6bC81T2prbnNuTHNOS0NrZU5QQTNXOXNYR1RIWWMwQldhMUFqdEJE?=
 =?utf-8?B?ejF6ZHFueklxZVRkQ1ZZZlNvRGhBTXltKzQyMnpSdGFnQWR4elMwQjZDaDFr?=
 =?utf-8?B?akFGVms3WWxVM1AycjBqdzREM3YzaEJmRzlUUXQ4TDlBbkQrclh1eDdEcjgy?=
 =?utf-8?B?NUQ3bU9ENkp3azVUbzFOaEh4dm9iL3NWSU9tcTd3d0Q0M0dJSE1pSVVWcFBH?=
 =?utf-8?B?VU5kTVdkQWZLK2dZT2ZUUjhuRGkybXlzQ2VUQURCc3dGemE3SEEvOWtmeFU5?=
 =?utf-8?B?enB4d0VjYWhXcGlpM2FRd3RaQXExczhjeExobGZNQVNrQXVKM2JMTm9DODgz?=
 =?utf-8?B?eVJDWTcxWUxPV2dCU1AvZ29TcThJL3A1a0V6cjVHUHgxNUNvWlp1WkNPZUlI?=
 =?utf-8?B?UHV1QmdLNFdCL3Q0U3ZTOXE2T0pYSDdrcy9STXU1bzZ1ZlFuejdzVFhxdFl4?=
 =?utf-8?B?Q08xNUpLSTd5M0w0amJQeWNzZ0VHRy9JM1IvUjRzREl6bWJVYkl3RVFqYlRC?=
 =?utf-8?B?em95TWptZXRoY01JMW13TkxXNlJDcnVkWFlQTXR6TFViRGplRmpDYkdHUFdx?=
 =?utf-8?B?dE14UTYrd2lwTFRGWWRweDBJL05IK0ZIbnJoaHJ5R1ZxR3N1aDQzSU1LQVZl?=
 =?utf-8?B?K2xEVU9jR0VidktIRVRqdmdXWWpHMzJmOFhsbk9xSzBDTmp2OUJxYTMzYmdh?=
 =?utf-8?B?K3FueHlKQnY2T01OaGlnQWt5d1I3LzBUN3d1THFTUWVNakdVdkR4SUxzV0R1?=
 =?utf-8?B?ZmlBMUJkSDlXOU9ma1lxdXoyeUJ1aWZiVGgvWkJUK094QTlFTEdJVWpQbmhi?=
 =?utf-8?B?VUEva29UM0Z5a1hqb21TQjhnT1hxZTRrbXVaaHp4ZDVIeU1uTHVpL0RLalN1?=
 =?utf-8?B?bnk4VkFJNFI0a3ZQVG5ZUEhmNnZ3U3MyQjdjZ25SZXQ5Tk1wazkvT3FTSzNO?=
 =?utf-8?B?bVAzZkNUN0xmeVdZTVd4L2FwMXpncXVpN0RtbURRa0VwV01KTTlhOGR5U0No?=
 =?utf-8?B?SWRIclcwaGZ6c0tNTjkvOU5FaEI0ekloQzZOWHZMWG5LTDBGejRMeEtrUFZa?=
 =?utf-8?B?eVc2cXVXem5FSTN6NGxua05HN2dWKzRNSEN6OUJ3MXpNZmwvTHM0empqUjd2?=
 =?utf-8?B?K1MwOWtBMWVQNjA0QkU5UGQ0b2RWODhydXdaYldqQjV4azBqS0g5NFUrUlY0?=
 =?utf-8?B?OHlrY25PRTc1cVIxRnpXUkpKTzBlQ0c1emMwaTFoTzlCNU52SlA0OUtiWC9H?=
 =?utf-8?B?YUgrNUFVMFd4Ump2aklXenBic3MrTlp4MmYwL1lmUFRBSms3bkQwdkQ3Mncr?=
 =?utf-8?B?dnZwdXRKZ01BNFRsV3dTUHJsR3FmM09FUkxSYmtnV0tEY0xDNGNVK3VTSE96?=
 =?utf-8?B?OTB1d2RSR2dGakZ5V3cydmJ6Um5zcElqNHlUYllSLzk1NmljVThvNTBLM0gy?=
 =?utf-8?Q?2n4Eoi+3yFQaD5x4=3D?=
X-Exchange-RoutingPolicyChecked: ls+giI+/TtDYF1ODSIUHnM5hEgQ65MiT0r+itH1T/Qxey2Uh2LZgUbXljbiLXaRz7ARnArcxLWjn1W2GdBacfOc1x9i6NvGx0QvMv4+kM+/eLS2qXrD19Td98jwYC5F04hM5R+7Htd1jCWI2EXd9eKCGn1TvpAnHv9Uc7WXPDW0iDr7bQgaFt3KutbvDzgMWi0mtl/gMxo6UAXchTKzj97F5o4iIDL2kIP+BWxnXdNYEgNTF1cLI8hTeVvbpcW9aL/G3o3VDtXWkYwhlUoljzJdF17VtHzexy/IIbqmLRVFbhO5sR7Hpj5Dg6sWLGwyzStQElydOhqhelhXFWum3Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbc1381-4ea3-4f61-2b3c-08def97ad88d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 20:38:35.1443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+rbDXTa4XHcvidbtQYECDN2az9c5+0l5HRofLVVWdL5eMQ0ecmfzB0VrzOn/MCTiNppdQmL+7qx2zSaF9uojNWx4ZM0Q4q6mQOGiCicS7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF291EF9BF1
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



On 8/13/2026 3:42 PM, Nilawar, Badal wrote:
> Hi Michal,

...

> 
> From kunit example I got this output for hardware errors.
> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR* SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: testing HARDWARE signature
> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR* SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1: testing HARDWARE signature
> 
> SIGIDs 202 and 204 correspond to the XE_RAS_COMP_DEVICE_MEMORY and XE_RAS_COMP_FABRIC components returned by firmware via xe_ras_error_class.
> If we want the component name to be included in the error message, what should be passed to the logging helper? The current KUnit test uses XE_LOG_COMPONENT_NONE, so no component information is being emitted.

if you want HW component name to be explicitly included like
we do for SW errors, use xe_log_comp_xxx() macros:

-       xe_log_emit_recoverable(pdev, XE_SIGID_FABRIC,
-                               XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
+       xe_log_comp_recoverable(pdev, FABRIC,
                                blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
-       xe_log_from_corrected(tile, XE_SIGID_DEVICE_MEMORY, XE_LOG_COMPONENT_NONE,
+       xe_log_comp_corrected(tile, DEVICE_MEMORY,
                              blob, sizeof(blob), "testing %s signature\n", "HARDWARE");

then you will get:

.. [drm] *ERROR* SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: FABRIC: testing HARDWARE signature
.. [drm] *ERROR* SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1: DEVICE_MEMORY: testing HARDWARE signature


and btw, I will ask again, whether we want LOCATION/COMPONENT
decoration as here:

	Tile1: GT1: PROBE: testing software signature
	Tile1: DEVICE_MEMORY: testing HARDWARE signature

or maybe in COMPONENT/LOCATION order:

	PROBE: Tile1: GT1: testing software signature
	DEVICE_MEMORY: Tile1: testing HARDWARE signature

if latter, then please comment patch 4/32

> 
> Thanks,
> Badal
> 
