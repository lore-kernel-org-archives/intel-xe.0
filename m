Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5E5C7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 20:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4610E28C;
	Mon, 22 May 2023 20:28:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AF810E28C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684787323; x=1716323323;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Qm3xtF/C6jgyUJRL6oBpDk99Y75h90RdgUsNTgtYO+w=;
 b=HsjpaGeymcrkydrq2+xHs0fO/cyiEE5AXvxk2tN44upfmk4wjxJnkc19
 7LV2yVBbuqTjfVi4E0HCBSYCi/gn/dp7CmiehVXkVAwg4tE1FkW7HV9KH
 pmK9WQLvk3xD/FJ4t6YVuPLlLE6g/M0Plvq1UpsTREmaKKodgSmp7bPH6
 kCF9PC282dW6Ew3Lt1xKBU7kXOvIYAwaiHyHO8hP8itZXPi+4Bl278GgF
 znS5J6cj0gpzWXdgynSfYXESzJB3utLYbRYbVS5B/8HrLevVVfWDgJY7+
 l9C3z3iA03+hten+Hk2OI+5pAUB3Y8xa7gA0gSMesFu/uxWqkD8u4jq2x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="351882615"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="351882615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="736560969"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="736560969"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 22 May 2023 13:28:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 13:28:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 13:28:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 13:28:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 13:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJWpmr02v00a2D76HIhtdfQUVqR2lvlLcRGx/dI3O09cPqjjYUGKu12xTanSujv7nPPCNFdLJYXPbjisbncM/5GkID7HYeFWttT/tK98AlYkVBpYMn+UNZ47KVDdZkIuYk7LX5z0pJFand5nLXTSdwAM4nD64eWldTkmRZHnYUaBpGROfnCBDVCo2vLn+tnIvkf0zrkh6jmqj4jYdpWgLh2cJLFFova0kEgBxieNeRl2pbXyv3AR4/08Nak6QFhTNZocfPeLhoSMpuC2GXv5Pwq+6NISF8pUK8WTVCaY+43j3/x8Rrk4iy8WtGYO7TqjetgZZei0FTmZFvNlSiXtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0adD8VaRUA/zYBCe23gkkfD9MwiXEVanxs4Eihe+fKE=;
 b=Qqc4gvuGTtZPqOFx7Sws3Ipjr3lynlqHkxEY8f57C+2z/JGCWJZ3Lz/+K2hx1c5qH3yuywL1Y4YCJ16twqmrkQbScBoi8y3avhygrcEbEtrwYFrq7I/GCQFBIzh/BF/1SdFNrQq+Kv1/Zceib5XBSMFdoV+EayGA3rQoC2cCTTptVxW5Yq6iXLTNH5vAOjbrw2Z9PlQACCVa+bhdKggbEi8RanAWZfFwGu+c/CZwxWPoKzJOcs6DGR/fR7Rb0EojE6mNZbzdDbG6biHihyeCpyVFLLRecB6RKFJ197nGytARLFg24fUUsVVjNA4DAHhqKFT9rdGDly9q6vOVZPQ/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 20:28:39 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 20:28:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fpimmilnelp2fggtc4vtpezkh6fcrb2qjof3icwlizpskyebgs@xrd73kyqdkpt>
References: <20230519194802.578182-1-gustavo.sousa@intel.com>
 <fpimmilnelp2fggtc4vtpezkh6fcrb2qjof3icwlizpskyebgs@xrd73kyqdkpt>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 22 May 2023 17:28:32 -0300
Message-ID: <168478731202.2146.17678862898736724106@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f72e21-571c-4ad4-5842-08db5b031f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R7+rHuLbSTctWqX9/yB4n3ZDVdzxPreXkMlDBzp24IW4Y7L6oZDLJ4gqnYxzn934+8St/0cXsUZOJ4t2vO9BG78H0L72iC9OLGkEi2QO5tbOi5eJaKNlOevzWCCqT/bsCIrqvGZFotjrB98W2hMQOGYg4tjT8nIytYY32J6/5Vt2wAzDbi2GwBj55pKZeCQacC6uc3HwqbRaT5CG/tIlf5u/FINxqu6z8w4LNm2mN9Gs9thLeP6krkTYl2lUf2qk63rp0B5FnMaNfw0gwr2nasRJZyYizagx6Tz0fgxxrFIUHQc8CDqFBfgdccw4+RhXwO0XDmnVPOaAhhOlIlDngbX8WkyQDowRQadgXSwddcC5pRVeRSN+uUYGjiq9viwmWIaDPFNQ/QfsQkA2UNmbjgq8GJ6hWdTMV+PDYeBvm6aDZ06GLWGmnmffYqz3k6re3RkyYUFvFPQo6XfXt2vAJibZ0N1vR5DeyxAFQevWGW6BCC7Xkk1Kr3+TZc4BLdEnsNmTS2o2JBvqKvc0QhA6Ol3nvxXhWQaxIwnFFyLq7qmAECEu/+Y7dFKbafAQGF8N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(8936002)(6862004)(8676002)(5660300002)(44832011)(83380400001)(186003)(6506007)(9686003)(6512007)(86362001)(33716001)(26005)(38100700002)(82960400001)(41300700001)(6666004)(6486002)(66476007)(66946007)(66556008)(316002)(6636002)(4326008)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTM0eUc2UjhzOHl4a3k0c2ZrZDZrZnE0NlUvUHNCRkpJV1FSQWpzeXNCR21K?=
 =?utf-8?B?WkZyYzRSenVuRlpDMkJ1WWhOM3hyY1dHV29UUGFiTGZGNURYRXB5Wm1pNE5y?=
 =?utf-8?B?ZjIyVmVEZEZLV1hIU3VWUVJkSG0vWFdpSDY2SHQyYzUrVmxOQTJqZFVad3JX?=
 =?utf-8?B?Y3VJTW1CbkxrT2NMSWtPTGtnY0dzdUlGTWVIUTVFQUlLYloxTmVIRGJQKyta?=
 =?utf-8?B?WG1mQWN2WnlSRHlTNXgweEUyTm5BNXpvbExYa2tyUlY3RlJUZGVSUHpFd1pB?=
 =?utf-8?B?OW1tL3FGZ0hzTFV3TUVSRHVoYUpMOENJcDNmR20xSXRZSmtuZVY2NExoSDN2?=
 =?utf-8?B?MzdiVkEvQTZxMk5PWEsyWTEzSEs5TUYwUXJzV3JDRnBHSHk3bVYrT3lHN2Ux?=
 =?utf-8?B?UjZwRVE1K2g4UnJobG9FTCtWWWlsNnBUdmtNSHRDUExOdnVMSkpZWG5vSllP?=
 =?utf-8?B?dmVvN3NjQ2UzcjJwUGtiQ3dRYXRyaTJkOG9uRENvUXM5eVlKZE5udHArYUhC?=
 =?utf-8?B?SUZjODhhSzZCRFNMTFI5ZlcrSUhydEJ6VXBXVDdqUW5XOHAzcnZXQkFWdFBX?=
 =?utf-8?B?aGxDakRFZDhzcHZNZUI3SjdKaHpSb2NETE9aRWc2YnZvVHdzRnk1VU5HOTdS?=
 =?utf-8?B?dVN6Zkhtd21qWjFqYWQwYk4yZFI5eW8vRXVDRGlJcm8wZ3pwTERoTXR5VWlO?=
 =?utf-8?B?OFo2dHB2bmpUcTJueHZzWmRTZE05YlE4TFhiTHd3M0I4cFd3ZE5KREFVbDF1?=
 =?utf-8?B?ZXhZQjY5VzZSN2RrZXJJeWlNbmkxdjZBdnJZbEcyMnlzUm5BZTJTN0dtRzNC?=
 =?utf-8?B?T0RMVG9ZN1FoekdlRFJnanRUV25wU2hQbjh3VDNSMitHUXQ3bjhIb1lNdENz?=
 =?utf-8?B?bFZxMzFPb2wxdWhwZ0orc1c2SjlkR0JiY3NpdFAzMUthWTJoZFZ5OE1SaWFV?=
 =?utf-8?B?NFh1SktIdGRIbkJSM1FDYnNxd3c0ZWd0aVpoMWJNMG9tMTJkcG5IYjk5Y09S?=
 =?utf-8?B?Z2VhM3g2bnk4UFFZSDFtdmsySXo3dkFQY2dpZGNseUkxV21HS1FXNDJzWGx1?=
 =?utf-8?B?Rmx2dFl4TUxEOUNiZjZ0NUtQVHBXTlRacjdQa0pKT2hIcDdrOThuZzF0MXdR?=
 =?utf-8?B?d1F4SEVCamozdXk0c3Vub0I2c3pyc1VDcEFSWG5aOEV4VHI3bFVVSThwRVl6?=
 =?utf-8?B?SFFHQkI3Q3F5ajc2d1dmYVZWcndCclNCSkgrMXVsOVNXWitQMFJjRm1Yd0JB?=
 =?utf-8?B?MlZlQitaWFJsMDNYT21nZWpZbE0rNFJaUmltNVpMWE1sTWVyS2pucENIZlpC?=
 =?utf-8?B?Z28vVk9maVpHU0JTS3RnM3hZVHpPUFduZE54UHE5SzB1OVJOL2EzQzR1VnlB?=
 =?utf-8?B?V1FVWVh5U3A0ZFRLcnk4bVBJK2Z1QmwwQ21SOG1VWUdNUVllQ2liU2ZUUTdK?=
 =?utf-8?B?YjhwdWFkbTJjRG84OGZUT29xTEFIK3NISmNhaTQxREhrbDZEbzE0RkFzTE5O?=
 =?utf-8?B?QUs4LzFVK3lhend0bDVwMENhSS9jOXJMa2RLS2xWTXl2S2J5MlB2SXl4Ly80?=
 =?utf-8?B?U1RKZEh0cDk3aFhZZTFMTDUvQk9YZDR0Ui9QNGpkeEtTZzZKQkRicEFMZ2lw?=
 =?utf-8?B?dDRmN2hPQ005Vk52TjVHbVl5cnNvcVI2WWJhQjk0TVBUMmJMOHlnbjBvK0xu?=
 =?utf-8?B?aFltWHBuSURZWVpwRXlGbXoxQkYxbXpsNUIxelNRRlN1Y2tHcG9md3IwM2RF?=
 =?utf-8?B?TGFRaUR4a1U1WmtpOTYyQjFyLy9Wam11TjV1Y1VMQzNhcktjaldXZTJoeW0v?=
 =?utf-8?B?aFBlSHdUc0k3Q3gzaXNzdHJtOURsQUo5Y05CeDlRckcyL0JzNVUrY2tyQ0Vv?=
 =?utf-8?B?emZ1UEdXNm81Z0huNGtWaU9LblZRNFB5eFMzV2VscGdTY3JpN2M5SFpqSXl1?=
 =?utf-8?B?Qlh2OEh3a0JTUFdabzRrakFNSytLdTRCQkRqZUN6S0xDZE9kY0x6eU9zK0Ro?=
 =?utf-8?B?UUs4a2RnSnFYMVRucEtsbUdIUjFQWFVseDZUZllEdW1hb3dsNWt5emJ4VlBG?=
 =?utf-8?B?RGdLaURabzFLUUF3YVRHNUR5d252ZmQyekRYcHlWV2x5b0RmeEQ4Q056ckVq?=
 =?utf-8?B?ZmY3eUVFNmh2Mm81aDBETXZYOW5ESUpjLzN4NUY5QWNyQ0ZLZk5LcjFiaDRp?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f72e21-571c-4ad4-5842-08db5b031f98
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 20:28:37.9154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WPHIguj7laXi8qaWwtJn/61vckx8m0PdBpDoSkc0SNK67N0xsuA+zLc6ARdh8iIywbuyuU6sYhvUYsef+Rb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not forget to drm_dev_put() in
 xe_pci_probe():
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

Quoting Lucas De Marchi (2023-05-20 01:56:17-03:00)
>On Fri, May 19, 2023 at 04:48:02PM -0300, Gustavo Sousa wrote:
>>We should also call drm_dev_put() when calling xe_device_probe().
>
>I guess you meant:
>
>drm_dev_put() should also be called if xe_device_probe() fails.
>
>
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Improved commit message and pushed. Thanks for the review!

--
Gustavo Sousa

>
>
>Lucas De Marchi
>
>>---
>> drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index e789a50a1310..2d0d50dcd396 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -639,10 +639,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const =
struct pci_device_id *ent)
>>         subplatform_desc =3D find_subplatform(xe, desc);
>>
>>         err =3D xe_info_init(xe, desc, subplatform_desc);
>>-        if (err) {
>>-                drm_dev_put(&xe->drm);
>>-                return err;
>>-        }
>>+        if (err)
>>+                goto err_drm_put;
>>
>>         xe_display_info_init(xe);
>>
>>@@ -668,10 +666,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const =
struct pci_device_id *ent)
>>
>>         pci_set_drvdata(pdev, xe);
>>         err =3D pci_enable_device(pdev);
>>-        if (err) {
>>-                drm_dev_put(&xe->drm);
>>-                return err;
>>-        }
>>+        if (err)
>>+                goto err_drm_put;
>>
>>         pci_set_master(pdev);
>>
>>@@ -679,14 +675,20 @@ static int xe_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>>                 drm_dbg(&xe->drm, "can't enable MSI");
>>
>>         err =3D xe_device_probe(xe);
>>-        if (err) {
>>-                pci_disable_device(pdev);
>>-                return err;
>>-        }
>>+        if (err)
>>+                goto err_pci_disable;
>>
>>         xe_pm_runtime_init(xe);
>>
>>         return 0;
>>+
>>+err_pci_disable:
>>+        pci_disable_device(pdev);
>>+
>>+err_drm_put:
>>+        drm_dev_put(&xe->drm);
>>+
>>+        return err;
>> }
>>
>> static void xe_pci_shutdown(struct pci_dev *pdev)
>>--=20
>>2.40.1
>>
