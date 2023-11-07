Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE2BC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C110E09B;
	Tue,  7 Nov 2023 13:14:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474310E09B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699362882; x=1730898882;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=cvTpFZLY+GVZLpywDCWo/r2kAINClSYryjDGFIwYIIw=;
 b=fx3OGyUeVFMU1uZ2GOA4stvtxkK/+2peXRuMRJqIknT0SUiXtZAWzfph
 0f0hdAHijVkKFnXUMIg1YwzJyPIMNMjMWOVxNu5kRBctlO3uAUXYZpVvG
 9TZNlZmV4UVbRRL23/9stxIl+H2p4fIA94uX4ZdB9ar+dGtovpk0wzyw5
 hjiegZpmG8H79jANY2yxy2qH9L13hGl1WZt0pjrvhsnw1qr6ISYeAVR/1
 Wk1bJ38WqBYPixLqMVfiaT7iHLxZAxKBltAphYA8i5qgUmwM9+eS30xOM
 juYMptKWi9P1pj8q3kKlADdBDPAgG0K7VUH/R043nXns75YVb0l/V20vg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="392377528"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="392377528"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="739125843"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="739125843"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 05:14:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 05:14:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 05:14:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 05:14:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 05:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYuxtoPCm9zodIE2ldaFHT2XQy01emvTDIgUtZGQzwZOPYuGWQ7pOOdU1sMnXtZYVi2RLQKexS8+76F5Va5Hxv5lfbHO1Ijf6yRgNOZ0Dc8aNdpJ5gQHCz/IHIr3gZkP/YSe83QmqsueFDEf+42LUf10wbMMd2wPa8MRaEchVGGffCQSifjGBLKz/tHRIBgN7/jhu5eZ2MEfTb53yOUINNjUNMwvDhQ9L4QS+//SDZzIWGdnPxpF1x66AvHoJqy/LxhStLL4UIwWwWxkjCWOt7LpPitduc1qhJkkCpEG26EoJLGRPGJsU/r0d93LmHCn9jcXqVdxtekLVe9K/x7Qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qM5AvZg+CHog1Et7tPMEuZSkFZRCaQOQLvN1l88WEH4=;
 b=WFZGLT12WNvAXyuuZtIDF/Ho2ahE83iVTnLKn94JSVI4GMtVjui1bnTfFyyBIEu9QQWJYMw3M1T8GqEuhCa87ReQ+PWSbfSARyww3hfiP76I2mxQ5H5UWZZ+s0cn6HXnGQuHsV3aY4j5ZTiHJZ1f15ig24HKFye2Ur1tlpNR2kyj2lD9rJ2q2lHQG3JaRvVe6gl5sOcD/g2J6te5kzpdtgkU3zR393j2kI0hO6W64CcDxslhOFhubzZ83ceMOgCI6bycSYm00nH7Ckg+Fo3oHT0ydtGRhx+e6zmy89eAVyLTWd7a5Jku/fxtYVj6tRI7NnaVqoqwvedUNvyWZ0LWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 13:14:26 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::2c36:38a9:79f6:914a]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::2c36:38a9:79f6:914a%5]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 13:14:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169930838277.20424.7401801187667513929@emeril.freedesktop.org>
References: <20231106210655.175109-3-gustavo.sousa@intel.com>
 <169930838277.20424.7401801187667513929@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <lgci.bug.filing@intel.com>
Date: Tue, 7 Nov 2023 10:14:21 -0300
Message-ID: <169936286178.3064.12384759186456268704@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:303:dd::30) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CYYPR11MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1cc805-4296-4739-f8a7-08dbdf93776b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: en/DMcOmW3pSNrDsM8HWc/UuOnyRQ4hNq1RxlBf0oNjW0Wt0piKamTX5SXJacQvwU7lZaE3k17SziTt0DBl4dNHZJ6QPLax92Xh087sw5e6ljpP+AcZlNht0zb3hiwUPZ7x2VQ9WKKoJNYHqnqahpLqd+g1xlRsB8F37C5U64G/VgL+xEFnj+I8fWNrki3FCkyJ6tZjZUazLLCtBCFukvJtKfeAbuoVNqRzu9CGF8Cj2j+IfSaGB3pOivpVYFSX5egEEib+daZDImTJhOHNqhKfyQ9eD4BiyW66mSV5LaKUwEuGg0l5s8RWWcAKaYayyAzfvBBk0/TMmB1LU4HUjaa6DvukgXQJ0aYMFKPYLxCoWbwXkAyxXYAuUTFFCERiyTISJ7AFfeC/QXYuFxKAfP9JIWt4b/m6gfbjh+6gg+33URoEe8Plql6ZEGKz63t00ky3D70/nNRohSMMbSXbklMlrSTLiRjDnsJTn1g823lXDkfWiL6Lyw1pCT/6WHfSWLnIgYC/3WAsBwHWHZ8d9S32vWO51HLKczUL1IOZT/tce0NBNc0q+FYRFRNw/N3woMsdWFiFhqaZWtIs5p+ZZB+c2NQrIWyaJUAvuZ81G237B1BVHxqkUGcNYvzQfBlqt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(346002)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(6666004)(41300700001)(6512007)(6506007)(9686003)(8936002)(83380400001)(4326008)(44832011)(2906002)(5660300002)(6486002)(966005)(6636002)(478600001)(66556008)(316002)(66476007)(66946007)(33716001)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anZ1WTZMeEVEVTBSd1hKSHVjQ3RLVjFwWnhKS3haODZhc01zRklqOHJta0w2?=
 =?utf-8?B?TkVtcGR5Wld5ZWRXb3N5a0lCWU9vWW5nZDFHUUZUZjBteGFMNjlrQ25FVStp?=
 =?utf-8?B?WVhraDEybEtySUdJZ1lpQ1NDMjNlUUhzTUpydExoN2NrQTZvQWVMc09oNTBv?=
 =?utf-8?B?b1BiSndFT29ER1ZNMWVkV2xtT0RVQU5LYkNyZkpPZ3RwSU1rNUFzbjZHc0Vk?=
 =?utf-8?B?Wlk5M1pSQVRZaldheUE1S2RHR1NSdmorRmJZOUtNZFR1c0syUXlnNnNxdGxL?=
 =?utf-8?B?MjRmREJ3dkZGMWNNZFVxb2NEaE1WSmJoclk5VzlwakhhWVFFcG5VTWxLTXVO?=
 =?utf-8?B?MDVQd0JMOERiRHFOTUV6WHBNTXFyMEpSeVV5b2haT2RMVUxoUHF3dFFJRVkv?=
 =?utf-8?B?WDZqdVpOd3FaMnVsQ1lLbTYyMWRqaWExZEZTSWJNVzFaVHM3ZGpScmd2SUdQ?=
 =?utf-8?B?bXlKRUhwRnJQMEYzTnhhbzB5L0NyTUQzQ0VJemMwVVJ2ZFVWZ1pxUUg0L0ZX?=
 =?utf-8?B?TFdCTTVSMEFySFo4OG1hTTNtN2JOWVNsY3JjZWdqa1p2Rlk1NUdwWEhaSy83?=
 =?utf-8?B?UUdzN1drRFVtSnFMelE3QW8zOE9BVndKb1pHbzNIdEZrcmtMZndNVVBTMzdW?=
 =?utf-8?B?MS9JNWZUaDQwazRVa01vTWJrc2krdHJrWWR0MGFNL3c1N3RJYzJsMzU5aFJt?=
 =?utf-8?B?cEZ6alcxMGpRRTdtd1NRbjkrSVN6K1hoSlVTSVlHcld4Tk9lMTkxVXl2bHVo?=
 =?utf-8?B?K0hBTExUeVYyakNBU0ExcmtVMGEwOE5PUElqdFJQZHozcVVhQ2RheGNZVnZ4?=
 =?utf-8?B?bktOWmwxWlgyZzJwSjlUVEg0OTFzSXpYM05hdnhhWnJHQlFpNlR0Umd3YWRj?=
 =?utf-8?B?TlJ5Ri9TNlZTUUd4bGVsUXp4c3FFOTRTbVNocjJQTXVudU9aMjdPaDZ0ZGh2?=
 =?utf-8?B?TWo3amFpWGZtNmw3dHhsZ2owVG56QzBBM0VwNDlZUDVJdzhzaUlrTnRRYjhX?=
 =?utf-8?B?N2pxNTZIT1lZZXk1TEdaVEhSRkQxenBuZTV6MlVUTUZwRGdrc1liNmlKWmFa?=
 =?utf-8?B?ckd0T1I3OXNTZzRialBzazcyNUJCY0hua2NWMStkbU9MdE5ibWpEZ0VxdVVV?=
 =?utf-8?B?Nm1uc3l6amZkWk8xRDc5SU8zMkZsSDNaN1lvYmFuOVJZQmZPYTVZUFpheTls?=
 =?utf-8?B?RWtEcGN1S0tCRFJ3T0RIWG9aL0c4OWY3a0NRdjFSbkJ4SS9kZmU3TjRIYXR0?=
 =?utf-8?B?T0NSTk0yYkJiSDQ0d1RUSXVpd29LcXN2VkhONlBkUm5OaXpralBodWJlVkQy?=
 =?utf-8?B?dDdkMlJLV21NOFl2VTlWMzNHUVFyUlJsekJKOEovcExjSXk3a21tc2oxaFpu?=
 =?utf-8?B?Q2kwckhJWTZDVnEyVWJtU3M1YjVqVm9WYlE5VERQdlQ2WGsraSszdUsrUE5Z?=
 =?utf-8?B?ZWRPWC9IMHBubHpubk9vY2RkQ0hrWW0zNDk0UG5xSkl0TTQydmd5WGtsU1Fm?=
 =?utf-8?B?VnlwMzNjUTBlSlhEa3J1NEQ2T2FNS0hSazdGbHl1ZWJvRFpRbEoxMTNGZXBC?=
 =?utf-8?B?ajhxUmhLdWlhWmVLYXpoYlVVb0dCSEUxSU8zc3IvTzZrMlBnMVFMWVZnQlJl?=
 =?utf-8?B?RGczbkgrbFVqU0JNYjBlTUx3UXRIakZIRStHWTFWL0VsNkxlMjJzL2ZTNnQ2?=
 =?utf-8?B?akFQYXpJMjNJUkYwMzlUUDVIRXN4Y3ZPL3RhVk9DSE5KYVRyZ2hDaHN0RGVw?=
 =?utf-8?B?eFZ6Q21naDlUSUl5UFdiWVAzNE5aZ0thSnd4eTBpZTRhQU5lby95SWR0VUNu?=
 =?utf-8?B?VWs4WmllT0QzRlE0ZWFMZEtXcytmNGhycVhmd2ZmaTF1QlJBeC82YXpRZ0dV?=
 =?utf-8?B?ZDU0eEJvTGxWNklkYnYrM0kvUDIxZy9UK0xFT2N4VXNkYmpNRDIvZVlZVCtR?=
 =?utf-8?B?ckFpTzdsWEV1Um1NYnNXVEJzcXhrQVlYWWViLzJlZlZoV0gwVTluNEdqczI4?=
 =?utf-8?B?N0RkdkpIU1ZtWXpoYkhzQXVGSW5ZUUMwaW5Vamw1NUt4ZE1KL21Za3F1bFVo?=
 =?utf-8?B?TUkxNXRaN2ViVDhQZTlXelFzcmxVcVFCZFJZWndRZFNYczVDY0hhakpTSmEw?=
 =?utf-8?B?ejQxTWJIbzhBRlZrS2x0WldieDBpdC9xM3Vpd0ZTck5ycUZ3WXFKam82R29E?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1cc805-4296-4739-f8a7-08dbdf93776b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 13:14:26.1064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+9o45v4ohxpNcoZmPXUt5Cjv1waEkzX9XMhRvNq2cncSOSOQVDrdXrJ2Ao7Bw7pQX0yubeUNYgyZGpY5IfxZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe?=
 =?utf-8?q?lpmp=3A_Add_Wa=5F16021867713?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-11-06 19:06:22-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe/xelpmp: Add Wa_16021867713
>URL   : https://patchwork.freedesktop.org/series/126040/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b_=
BAT -> xe-pw-126040v1_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-126040v1_BAT absolutely need t=
o be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-126040v1_BAT, please notify your bug team (lgci.bug.=
filing@intel.com) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 3)
>------------------------------
>
>  Missing    (1): bat-pvc-2=20
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1260=
40v1_BAT:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
>    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +1 other test fail
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa6=
0db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d=
-dp3.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-o=
em2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

Not related to this series, as the workaround targets a media IP that is no=
t
present on DG2.

--
Gustavo Sousa

>
> =20
>Known issues
>------------
>
>  Here are the changes found in xe-pw-126040v1_BAT that come from known is=
sues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
>    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +2 other=
 tests fail
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa6=
0db6d2fa30bd4db2509eb8b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-e=
dp1.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-adlp-=
7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
>
>  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
>    - bat-dg2-oem2:       NOTRUN -> [FAIL][5] ([Intel XE#400] / [Intel XE#=
616])
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-o=
em2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html
>
>  * igt@kms_psr@primary_page_flip:
>    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#535]) +2 other te=
sts skip
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-o=
em2/igt@kms_psr@primary_page_flip.html
>
>  * igt@xe_exec_fault_mode@many-basic:
>    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#288]) +17 other t=
ests skip
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-o=
em2/igt@xe_exec_fault_mode@many-basic.html
>
> =20
>#### Possible fixes ####
>
>  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
>    - bat-dg2-oem2:       [FAIL][8] ([Intel XE#692]) -> [PASS][9]
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa6=
0db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-befor=
e-cursor-atomic.html
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-o=
em2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
>    - bat-adlp-7:         [FAIL][10] ([i915#2346]) -> [PASS][11]
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa=
60db6d2fa30bd4db2509eb8b/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before=
-cursor-atomic.html
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-adlp=
-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
>
>  * igt@kms_pipe_crc_basic@hang-read-crc:
>    - bat-dg2-oem2:       [INCOMPLETE][12] ([Intel XE#282] / [Intel XE#749=
]) -> [PASS][13]
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa=
60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.=
html
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-=
oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
>
>  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
>    - bat-dg2-oem2:       [INCOMPLETE][14] ([Intel XE#282] / [Intel XE#545=
]) -> [PASS][15]
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa=
60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@=
pipe-a-dp-3.html
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-=
oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
>
>  * {igt@xe_create@create-execqueues-leak}:
>    - bat-atsm-2:         [FAIL][16] ([Intel XE#524]) -> [PASS][17]
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa=
60db6d2fa30bd4db2509eb8b/bat-atsm-2/igt@xe_create@create-execqueues-leak.ht=
ml
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-atsm=
-2/igt@xe_create@create-execqueues-leak.html
>
> =20
>#### Warnings ####
>
>  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>    - bat-dg2-oem2:       [TIMEOUT][18] ([Intel XE#430] / [Intel XE#530]) =
-> [FAIL][19] ([Intel XE#400] / [Intel XE#616])
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa=
60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sa=
nitycheck-nv12.html
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-=
oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>
>  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
>    - bat-dg2-oem2:       [TIMEOUT][20] ([Intel XE#530]) -> [FAIL][21] ([I=
ntel XE#400] / [Intel XE#616])
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-472-5a3a6fdda31fc8fa=
60db6d2fa30bd4db2509eb8b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sa=
nitycheck-nv12@pipe-b-dp-3.html
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126040v1/bat-dg2-=
oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
>
> =20
>  {name}: This element is suppressed. This means it is ignored when comput=
ing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
>  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
>  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
>  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
>  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
>  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
>  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>  [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
>  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
>  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>
>
>Build changes
>-------------
>
>  * Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -> xe-pw-126040=
v1
>
>  IGT_7574: 0485a4bf66f69aaf7244a3e689402b522f636780 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2=
fa30bd4db2509eb8b
>  xe-pw-126040v1: 126040v1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1260=
40v1/index.html
