Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDF9C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561B10E31E;
	Tue,  1 Aug 2023 08:03:41 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6190F10E31E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690877020; x=1722413020;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0dNE9B6CUBtUtQ8VDw9rrDQD5OE+9KdZZ4wfZp5E7p0=;
 b=DWlTxV+8LBMGYMS7sD5dzwLLxRw97INhnUufEyW3kja1UsEdSmbscWos
 cgddFgHkVwXgI/bhzO6hoGpKM84VJm5FQzhWKoWCKZ5KGM9yC3KNb2DOC
 jlNxJqk+M0WifUt8x5yVZx33VaKC8bRNEPFffNomeyNfnfwB1zgiHC2TB
 kQQBi7cy9vDK0eVrivIW6Cxuo4mwyccEtdQYWZAvoo7ez0obfFEZQKk4E
 BIZU7CU2/ZrK9QuCjMQb8jXm70tWT38PJ8gk1uqjiSd4UyMsXsQdSjNJJ
 t3LSQUFE/O9xsXSimCilGPwSX9SBCGkJeKeoAWHtaJ9B4oDxXTatTbBTE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369224063"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="369224063"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798575586"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="798575586"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 01:03:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:03:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:03:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:03:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4nIHVWgGoJZi8fEfuT3u6gGBHy1l1MmPtAMw1sMFcM0Xh578ahZ3s7ryEmsT5woFk6n2fvUi+9v+w/mFBJPE898ekTIvl00X3OPEl7KEJeQoJjZ4fbpRa0h4cjjn8jEFYYKd5PVBaXxPXKbvrxe6k/1GGkx38IL1lgCya/wjYsVZ+ngRnFIsDrRAwgLJx+aMJ1d98UH65mkrdXu2Jw2nmZIgm6tmm5dPweK77GGhhcz2mqFYRckHTJhyZJWZZdMS5hw3Fk4nxML2LImYP7ceIfGW3H+uCMze1KHdauGP9h3B1zLXul9t9TlMdPioO6USyUNm5d253XbzBNi6KgdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMqyqXwoY0fOMCZyJLWp9l+llseG6YKL6KMh0anCZ3Q=;
 b=gJ2dn/DVZHXPIX25wrYUNfdmm2/b66tTMHGemXoDnNXqlHgXmwfVCLh85kKAY1mKPWoPaK72o6M+Jf0E9WDMWT8CmyOALSC/ysnDFez7ajppXCJhCaPmK6Pqwz0rMhimko6L2e1yf6VGqqfxDNptYjtWik8GiXp0Viiv13WcRbDrviXEETiKT1xp3FdVkL1IroTQSdAVx3sz0WPa2sCr9L60WUKT9qcSX/ZjQNiNicAbScD6BH370u+EUGDEX9KPNdRBrjJzZXXH18fW8ugtHxJix5RbYmXEhaz/KHBMCx9x6eUXP1KMQ9TfVMCabmNvYS+PLUzKaynxEZrkCsqE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 08:03:33 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:03:33 +0000
Date: Tue, 1 Aug 2023 13:33:20 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Message-ID: <ZMi8SN+Std8zyey7@bvivekan-mobl>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
 <ZMfFaXW7607Cy45j@bvivekan-mobl>
 <MW4PR11MB7056657DF4820D71CBB0DBE5B305A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <ZMif6Huf+E95GL3J@bvivekan-mobl>
 <MW4PR11MB7056C765077F19BD80A6A99EB30AA@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW4PR11MB7056C765077F19BD80A6A99EB30AA@MW4PR11MB7056.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::27) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3aecda-3e6e-4d0c-33ca-08db9265ccc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vrw0+/3yscGZWF4rXZDxDEgBKb5nBfQ9U0eZ+aGihsO8kvpx+2mW0mUc/VDYzLSpPZ9lLyhi+C3wvXx5qAEC3A14N7KTlWg3tqmxBu+WtUFYPMFZSNVzjB4ZwQzsCf3Xpo3TrD0MwVa5O/LwbWdICo0lnt0EndeXzsYgFgiNOTXaFgDgC234GJLfNRuBEpjlVHN1KELg16A7Yb3u+YAKPtM7zjwzsE8KUuIBWBifArhE1q+gqZz9CuFNgfWCxBOj0pbquVVc8PbZL1/BSlF4E5+zsD0we3ZK8BzguEXZoyP64gT9Fg+6GrXfPLVLCe61oPsZzWFDE3JDLXwyepkNNVDcFBCnup85tNmHIWqam2o2BFCjuDriq9ZhvE3oLvyUulR5CkzxrzBEcl9KnfCzuEI/uVigWu862FGHNc3APVand6lGyxg/P63gzTOz4F+ignnOUig14yzyodrp4aWfxZQHLfnzvNsqd+olwmA8bkb8tEAX9YCCYXd9Qh2zfMzAL+/lty3h2OToYy37zkNHLFEfEbkHPxlXCWwZDTBbucWtPjf27GHRrI+Np7l2Aw6ZSSRIEv5SzH3BlCryB4XZtpJ4c/tvG9o/aUSLLnUAbX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(33716001)(478600001)(38100700002)(82960400001)(86362001)(6512007)(966005)(9686003)(6486002)(6666004)(53546011)(186003)(107886003)(8676002)(8936002)(6506007)(5660300002)(44832011)(4326008)(2906002)(66556008)(66946007)(66476007)(41300700001)(54906003)(110136005)(316002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3pDWkRaWERNUWd5eWg0V29HaDVuNFY1cEp6bkx0UXo3TWdDUC8yQUxqRnJS?=
 =?utf-8?B?dlU3azNlYVRIbTY4ZVBFVldRRjZJaDJHUDJMZzZ6bGVxZXRlcjlQeWd4OXhn?=
 =?utf-8?B?OWkvaVUvWnRXVXJGWHpMQjRhWWRLM05Qc3ArY0xlNjdiaTJDWFIrVDhUVnEv?=
 =?utf-8?B?RGtZSXE3T0tHcEQ4d1doMWRUS0FSNUNUMzJsUmhXMzdFVXkzSXBLMDk3d2d0?=
 =?utf-8?B?NkJKWWJRNHNCZXdxY05PN09rMnpHNEpJVTdHSFFmVW1tK0krY3d4V2ozQlZ2?=
 =?utf-8?B?MVhMVjQyenZKZVUzS3NDd0E4YThDWUVueDZleFg1REhOQmg4ODNTbU5wRWpq?=
 =?utf-8?B?aS9HZ2ZBU2JBdGRwZXBsdFJnMXZ6dU9icUpTalhyYW1VWThjcks5VnRBanI5?=
 =?utf-8?B?NnpZS0pyOW84dTlocFFGc001bzVLQldjbnk3VmRmejNjc0VvSllRc0xiUDBG?=
 =?utf-8?B?ZTdVS3g3MTRCaVl4VW5rTHJkSmxHWVh0cTg2blBlQWRIcVdRUmFsTkoya0FN?=
 =?utf-8?B?MnlRd0VrUXFpbVFtQXNLOWl4UXhDR1owb0JDb0JTUVpmRDMzUlJOb2lmb0Fi?=
 =?utf-8?B?czJobzdISkRlUVRjWGtmTUJTbWJGdXNtZFRzdnovWTNFUThVRldsQVhXRndM?=
 =?utf-8?B?dE40VVEyZ3RVc2s3d3B0cDYzaWhJb0VVTVU2KzlLMFl1eEs0QlRocC9hWk45?=
 =?utf-8?B?MlRSaklzaW9lWHdwOVdNR0RXZHZZREhrWE5SRGhNTUV6RzZoOUpNRWZRb1J0?=
 =?utf-8?B?bS9jSjRBRjNIZDdZY3VldmxhZzBXK055cUtNOXNLMUhsc2JVKzQzdHh5d3hz?=
 =?utf-8?B?azlXN2g5UXd1L0tlLzdIaHd3SFhkZTNLS3FGcjU4bXlVNDd4bzk4Q01KalF5?=
 =?utf-8?B?VWNBTVZQMmNwcVhkZ1ZVK09US3pnbEp5c1Frejg0bTI0dndMeXorQU9nekwv?=
 =?utf-8?B?ZzcvK0pFbmtoSlpkN3FHQVArTzZCMklSb0w2UTNkOTM0UTE4bFNLWVpzWTcx?=
 =?utf-8?B?ZGdnZ3lDaUR1RXNNMjlkV3V2Q3pieFcyVk5GL2R1ckJQc1U2bjVuMFBPa3Mz?=
 =?utf-8?B?NmxpRXhZZkNjaGtJbEtCc05mRzE0K3NMOS9NTDdXUFE3Um1JL1hJWEZrRFBU?=
 =?utf-8?B?YS90eThXSWhDT0sxYjQwYkN1cktEQmJhanlzd2NreFlFMCs0ZU01SlYvT3hE?=
 =?utf-8?B?cUZRSXJRcE5PSzh4Mm12dGJyYlM3L1hIY3EwdFF5N0QzQW5Kem5kLzR5QkJE?=
 =?utf-8?B?SDlmR3NmQzNuOUdXaVB6TXNVa1RMYVFXdE15eTNHV3VzckxFdGMrUFpCTXFp?=
 =?utf-8?B?NFRIcklHMkp3emg5cVNhOTYxVUpBRjBXTFhxeGVwajZiSjFpbkZ1dkRadUd5?=
 =?utf-8?B?YllaL3BGb3lwVFZVT3BUckN2Rm43YzZpZVc5K01DczJ6R3lUVGVjdnk3bEdB?=
 =?utf-8?B?bFBTV3M0YS9oM1dzUUNjQjlHeExWa1NyZUFIUlBSYmdkdld0SExQbkh0bEpy?=
 =?utf-8?B?Q3dkZUpzME1CMlcyb2VUU2FPZHlBVXpzYy9KRG82Vk90U0VOM1dnakhZVXJn?=
 =?utf-8?B?eXNMNEIyQWxXUkp3RVBwQU0wcUVkR3ZTTzRDRjN1ZDFTenY3VFE0TVBjc0pM?=
 =?utf-8?B?YlV4NVp1TjZacDdVbEJ5WWo2YTJVT1ZtdFhwdEN6bm1FRXdnUFdmdWRTYjFJ?=
 =?utf-8?B?UndGdGh1SG9zWmpPVEQvMFNGdzdDZno2SzBSbHpJemh6OXNReExsakxGN0Ry?=
 =?utf-8?B?dXhReUxlSkpLZmY1Zis5ejBWMmd3SDZtaXVKNUF3aEZwcUtJS0JDOXZMRVhE?=
 =?utf-8?B?aVJLajd2eVRUUHpVUnlFZXlPbytrUU5qY0tLa1pnam9TU042SldNVWZ2c2R3?=
 =?utf-8?B?MFRBV01MM1J5TWN2RzVNK1FPdEV2bzF3NGVuZ3RiVmZybEVwMmwzRWEvSzJN?=
 =?utf-8?B?MWlGWHpSTG1sdVUxeDFod0E2cnZFaWRqSTR2K3dkbzUrWDFUN1hhc2RJTW4x?=
 =?utf-8?B?SnBWcG0yeDNxUC8reU1mcVVIOWRLaFNiSm83bWVBdUREaHZ4Mk1Za00zUjVB?=
 =?utf-8?B?ci9jWElTNndXTjZyRWE3M1ZDaWxFRTJTN01iTzFYaUxTTjlVT1J3WjV2Zlp3?=
 =?utf-8?B?ZGI3TU9hOEo0YVFZeUMrTkZ5a0k0NFIxekRwQVRzeG1wejZSQkN5bDZIZjlN?=
 =?utf-8?B?TWsvT1c1ampkMExZQjJtMGFtK0I2dmhkK2k0d29FNXk5djhvdktVYzRoN3Rx?=
 =?utf-8?Q?qlUxcmXApXujPyrZNrkIWFKG0gw6HdhPEd6VulEEM8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3aecda-3e6e-4d0c-33ca-08db9265ccc4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:03:33.1394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Fs25B3lmsch5z7nIdnE9ac0Mtzy4DJ8ftsnzTwAlK91PNYKEHd2RPGzBwYwjRiNjpFXQizKaKg3dLlEFj+hhy+Be7KZhxkLFFRsPWcFHLKUC4fP/h2lIFxPEnra4w8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 01.08.2023 12:15, Ghimiray, Himal Prasad wrote:
> 
> 
> > -----Original Message-----
> > From: Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Sent: 01 August 2023 11:32
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for gt
> > reset
> > 
> > On 31.07.2023 20:54, Ghimiray, Himal Prasad wrote:
> > > Hi Bala,
> > >
> > > > -----Original Message-----
> > > > From: Vivekanandan, Balasubramani
> > > > <balasubramani.vivekanandan@intel.com>
> > > > Sent: 31 July 2023 20:00
> > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > > > xe@lists.freedesktop.org
> > > > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> > > > <rodrigo.vivi@intel.com>
> > > > Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault
> > > > injection for gt reset
> > > >
> > > > On 27.07.2023 04:56, Himal Prasad Ghimiray wrote:
> > > > > To trigger gt reset failure:
> > > > >  echo 100 >
> > > > > /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
> > > > >  echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times
> > > > >
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > >
> > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > <himal.prasad.ghimiray@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
> > > > >  drivers/gpu/drm/xe/xe_gt.c      |  8 +++++++-
> > > > >  drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
> > > > >  3 files changed, 31 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > b/drivers/gpu/drm/xe/xe_debugfs.c index
> > 047341d5689a..1fd016e6f7a0
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > > @@ -5,6 +5,7 @@
> > > > >
> > > > >  #include "xe_debugfs.h"
> > > > >
> > > > > +#include <linux/fault-inject.h>
> > > > >  #include <linux/string_helpers.h>
> > > > >
> > > > >  #include <drm/drm_debugfs.h>
> > > > > @@ -20,6 +21,10 @@
> > > > >  #include "xe_vm.h"
> > > > >  #endif
> > > > >
> > > > > +#ifdef CONFIG_FAULT_INJECTION
> > > > > +DECLARE_FAULT_ATTR(gt_reset_failure);
> > > > > +#endif
> > > > > +
> > > > >  static struct xe_device *node_to_xe(struct drm_info_node *node)  {
> > > > >  	return to_xe_device(node->minor->dev); @@ -135,4 +140,9 @@
> > > > void
> > > > > xe_debugfs_register(struct xe_device *xe)
> > > > >
> > > > >  	for_each_gt(gt, xe, id)
> > > > >  		xe_gt_debugfs_register(gt);
> > > > > +
> > > > > +#ifdef CONFIG_FAULT_INJECTION
> > > > > +	fault_create_debugfs_attr("fail_gt_reset", root,
> > > > > +&gt_reset_failure); #endif
> > > > > +
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > b/drivers/gpu/drm/xe/xe_gt.c index 5e70e486b27c..691e3baf97c9
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > @@ -525,6 +525,11 @@ static int gt_reset(struct xe_gt *gt)
> > > > >
> > > > >  	xe_gt_info(gt, "reset started\n");
> > > > >
> > > > > +	if (xe_fault_inject_gt_reset()) {
> > > > > +		err = -ECANCELED;
> > > > > +		goto err_fail;
> > > > > +	}
> > > > > +
> > > > >  	xe_gt_sanitize(gt);
> > > > >
> > > > >  	xe_device_mem_access_get(gt_to_xe(gt));
> > > > > @@ -563,6 +568,7 @@ static int gt_reset(struct xe_gt *gt)
> > > > >  err_msg:
> > > > >  	XE_WARN_ON(xe_uc_start(&gt->uc));
> > > > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > > > > +err_fail:
> > > > >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > > > >
> > > > >  	/* Notify userspace about gt reset failure */ @@ -584,7 +590,7
> > > > > @@ void xe_gt_reset_async(struct xe_gt *gt)
> > > > >  	xe_gt_info(gt, "trying reset\n");
> > > > >
> > > > >  	/* Don't do a reset while one is already in flight */
> > > > > -	if (xe_uc_reset_prepare(&gt->uc))
> > > > > +	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> > > >
> > > > When `fail_gt_reset/probability` is set to a less than 100 value,
> > > > then
> > > > xe_fault_inject_gt_reset() will not always return true. So if the
> > > > xe_fault_inject_gt_reset() returns differenet values when invoked
> > > > from
> > > > xe_gt_reset_async() and gt_reset(), we will have unexpected behaviour.
> > > >
> > > > We should avoid calling xe_fault_inject_gt_reset() more than once in
> > > > a single reset cycle.
> > > > We could exit immediately in xe_gt_reset_async() if fault injection is
> > enabled.
> > > Intention here is to cause next reset fail. Unless you make the probability
> > 100 that is not guaranteed.
> > > And no.of times more than 1 are perfectly fine as long as probability is 100.
> > > Even in commit message it is mentioned clearly to use probability as 100.
> > 
> > Through the commit message it is understood that we need to supply 100
> > and >1 values for probability and no of times debugfs entries. But it doesn't
> > prevent anyone from trying other values. In such cases, it is fine for the fault
> > injection to not work, but it should not cause any issues in the driver.
> > I think if xe_fault_inject_gt_reset() returns false in
> > xe_gt_reset_async() and true in gt_reset(), then we will end up in
> > xe_uc_reset_prepare() invoked but no gt reset completely executed.
> > Thought I haven't analyzed how it would impact driver, I think the driver
> > would be left in some unexpected state. We should avoid this.
> > 
> > Wrong values for the debugfs entries should have no impact on the driver.
> Wrong values in debugfs will always impact driver here.
> 1) If probability is not 100. 
> You don’t know which reset will fail and which will pass, which is further indeterministic from software perspective.
> So passing wrong value to probability will impact irrespective of times.
> 2) If probability is 100 and times = -1, all the resets will fail irrespective we want fault injection or not. 
> 
> So passing of wrong values is something we cant guarantee to work with in case of fault_injection.
> Just to make code flow work with times = 1,  I can cache the state of xe_fault_inject_gt_reset() and use it In both places, 
> but it doesn't help with passing of wrong values to debugfs at all.
> 
> Had discussion with architects  regarding this before, implementation:
> Query: " On further exploration:  In fault injection mechanism the privilege user can make all the resets fail, whereas impact of https://patchwork.freedesktop.org/series/119784/ is limited to the  reset caused by this particular debugfs.
> for example : if user sets attr: times = -1( meaning unlimited ) and attr probability as 100, all the trials to gt_reset will fall  due to fault injection.  This shouldn't be of concern as long as we are setting correct values."
> 
> Response was:
> " Yeah, there should be no concern on user writing bad values to debugfs, it's mostly only sysfs we need to be careful with"

Can we exit from xe_gt_reset_async() itself when fault injection is
true, and not proceed with gt_reset()?

Regards,
Bala

> 
> > 
> > Regards,
> > Bala
> > 
> > >
> > > BR
> > > Himal
> > > >
> > > > Regards,
> > > > Bala
> > > > >  		return;
> > > > >
> > > > >  	xe_gt_info(gt, "reset queued\n"); diff --git
> > > > > a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h index
> > > > > 7298653a73de..caded203a8a0 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > > > @@ -7,6 +7,7 @@
> > > > >  #define _XE_GT_H_
> > > > >
> > > > >  #include <drm/drm_util.h>
> > > > > +#include <linux/fault-inject.h>
> > > > >
> > > > >  #include "xe_device_types.h"
> > > > >  #include "xe_hw_engine.h"
> > > > > @@ -16,6 +17,19 @@
> > > > >  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
> > > > >  			  xe_hw_engine_is_valid((hwe__)))
> > > > >
> > > > > +#ifdef CONFIG_FAULT_INJECTION
> > > > > +extern struct fault_attr gt_reset_failure; static inline bool
> > > > > +xe_fault_inject_gt_reset(void) {
> > > > > +	return should_fail(&gt_reset_failure, 1); } #else static inline
> > > > > +bool
> > > > > +xe_fault_inject_gt_reset(void) {
> > > > > +	return false;
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > >  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);  int
> > > > > xe_gt_init_early(struct xe_gt *gt);  int xe_gt_init(struct xe_gt
> > > > > *gt);
> > > > > --
> > > > > 2.25.1
> > > > >
